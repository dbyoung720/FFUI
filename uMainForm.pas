unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.IniFiles, System.IOUtils, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Clipbrd, Vcl.FileCtrl,
  {第三方控件}
  SynEdit, SynHighlighterJSON, DosCommand;

type
  { 打开文件方式：文件/文件夹/网络视频流地址 }
  TFileStyle = (fsFile, fsFolder, fsStream);

type
  TfrmFFUI = class(TForm)
    lblVideoFile: TLabel;
    pgcAll: TPageControl;
    tsInfo: TTabSheet;
    tsPlay: TTabSheet;
    pnlButtonCommand: TPanel;
    btnPlay: TButton;
    btnPause: TButton;
    btnStop: TButton;
    pnlVideo: TPanel;
    tsConv: TTabSheet;
    tsSept: TTabSheet;
    tsMerge: TTabSheet;
    tsLive: TTabSheet;
    rgWeb: TRadioGroup;
    pnlWeb: TPanel;
    srchbxSelectVideoFile: TSearchBox;
    dlgOpenVideoFile: TOpenDialog;
    tmrPlay: TTimer;
    tsConfig: TTabSheet;
    rgUI: TRadioGroup;
    rgGPU: TRadioGroup;
    statInfo: TStatusBar;
    pmOpen: TPopupMenu;
    mniOpenFile: TMenuItem;
    mniOpenFolder: TMenuItem;
    mniOpenWebStream: TMenuItem;
    pmStatCopy: TPopupMenu;
    mniCopyDosCommand: TMenuItem;
    lstFiles: TListBox;
    btnAddVideoFile: TButton;
    btnDelVideoFile: TButton;
    tmrPlayVideo: TTimer;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srchbxSelectVideoFileInvokeSearch(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mniOpenFileClick(Sender: TObject);
    procedure mniOpenFolderClick(Sender: TObject);
    procedure mniOpenWebStreamClick(Sender: TObject);
    procedure mniCopyDosCommandClick(Sender: TObject);
    procedure rgUIClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnAddVideoFileClick(Sender: TObject);
    procedure btnDelVideoFileClick(Sender: TObject);
    procedure tmrPlayVideoTimer(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    FDOSCommand   : TDosCommand;
    FSynEdit      : TSynEdit;
    FJSONHL       : TSynJSONSyn;
    FFileStyle    : TFileStyle;
    FhPlayVideoWnd: HWND;
    procedure LoadConfig;
    procedure SaveConfig;
    procedure GetVideoFileInfo(const strFileName: string);
    procedure DosCommandLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure FindVideoFile(const strFolder: string);
    procedure PlayVideoFile(const strVideoFileName: String);
    procedure SendPlayUIKey(H: HWND; Key: Char);
  public
    { Public declarations }
  end;

var
  frmFFUI: TfrmFFUI;

implementation

{$R *.dfm}

procedure TfrmFFUI.LoadConfig;
var
  strIniFileName: String;
begin
  strIniFileName := ExtractFilePath(ParamStr(0)) + 'config.ini';
  with TIniFile.Create(strIniFileName) do
  begin
    rgUI.ItemIndex := ReadInteger('Main', 'PlayUI', 0);
    Free;
  end;

{$IF Defined(CPUX86)}
  rgGPU.ItemIndex := 1;
  rgGPU.Enabled   := False;
{$ELSE}
  with TIniFile.Create(strIniFileName) do
  begin
    rgGPU.ItemIndex := ReadInteger('Main', 'UseGPU', 0);
    rgGPU.Enabled   := True;
    Free;
  end;
{$ENDIF}
end;

procedure TfrmFFUI.SaveConfig;
var
  strIniFileName: String;
begin
  strIniFileName := ExtractFilePath(ParamStr(0)) + 'config.ini';
  with TIniFile.Create(strIniFileName) do
  begin
    WriteInteger('Main', 'PlayUI', rgUI.ItemIndex);
    WriteInteger('Main', 'UseGPU', rgGPU.ItemIndex);
    Free;
  end;
end;

procedure TfrmFFUI.FormCreate(Sender: TObject);
begin
  FDOSCommand           := TDosCommand.Create(nil);
  FDOSCommand.OnNewLine := DosCommandLine;

  FSynEdit                := TSynEdit.Create(tsInfo);
  FSynEdit.Parent         := tsInfo;
  FSynEdit.Align          := alClient;
  FSynEdit.BorderStyle    := bsNone;
  FSynEdit.Gutter.Visible := False;
  FSynEdit.Font.Name      := '宋体';
  FSynEdit.Font.Size      := 12;
  FSynEdit.RightEdge      := tsInfo.Width;
  FSynEdit.ScrollBars     := ssVertical;
  FJSONHL                 := TSynJSONSyn.Create(Self);
  FSynEdit.Highlighter    := FJSONHL;

  pgcAll.ActivePageIndex := 0;
  LoadConfig;
end;

procedure TfrmFFUI.FormDestroy(Sender: TObject);
begin
  SaveConfig;

  FDOSCommand.Free;
  FJSONHL.Free;
  FSynEdit.Free;
end;

procedure TfrmFFUI.FormResize(Sender: TObject);
begin
  pgcAll.TabWidth := (Width - 35) div 7;

  if FhPlayVideoWnd <> 0 then
  begin
    SetWindowLong(FhPlayVideoWnd, GWL_STYLE, NativeInt($96000000));
    SetWindowLong(FhPlayVideoWnd, GWL_EXSTYLE, $00050000);
    SetWindowPos(FhPlayVideoWnd, pnlVideo.Handle, 0, 0, pnlVideo.Width, pnlVideo.Height, SWP_NOZORDER OR SWP_NOACTIVATE);
  end;
end;

procedure TfrmFFUI.DosCommandLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
  FSynEdit.Lines.Add(ANewLine);
end;

procedure TfrmFFUI.mniCopyDosCommandClick(Sender: TObject);
begin
  Clipboard.AsText := statInfo.SimpleText;
end;

procedure TfrmFFUI.GetVideoFileInfo(const strFileName: string);
var
  strFFMPEGPath: string;
begin
  strFFMPEGPath := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  SetDllDirectory(PChar(strFFMPEGPath));
  FSynEdit.Lines.Clear;
  FDOSCommand.CommandLine := Format('"%s\ffprobe.exe" -hide_banner -v quiet -show_streams -print_format json "%s"', [strFFMPEGPath, strFileName]);
  FDOSCommand.Execute;
  statInfo.SimpleText := FDOSCommand.CommandLine;
end;

procedure TfrmFFUI.mniOpenFileClick(Sender: TObject);
begin
  if not dlgOpenVideoFile.Execute then
    Exit;

  FFileStyle                 := fsFile;
  srchbxSelectVideoFile.Text := dlgOpenVideoFile.FileName;
  pgcAll.ActivePage          := tsInfo;
  GetVideoFileInfo(dlgOpenVideoFile.FileName);
  lstFiles.Items.Add(dlgOpenVideoFile.FileName);
end;

{ 查询目录下的视频文件 }
procedure TfrmFFUI.FindVideoFile(const strFolder: string);
var
  gfs        : TStringDynArray;
  strFileName: String;
begin
  gfs := TDirectory.GetFiles(strFolder, '*.mp4');
  for strFileName in gfs do
    lstFiles.Items.Add(strFileName);

  gfs := TDirectory.GetFiles(strFolder, '*.mkv');
  for strFileName in gfs do
    lstFiles.Items.Add(strFileName);

  gfs := TDirectory.GetFiles(strFolder, '*.vob');
  for strFileName in gfs do
    lstFiles.Items.Add(strFileName);

  gfs := TDirectory.GetFiles(strFolder, '*.rmvb');
  for strFileName in gfs do
    lstFiles.Items.Add(strFileName);

  if lstFiles.Count > 0 then
  begin
    pgcAll.ActivePage := tsInfo;
    GetVideoFileInfo(lstFiles.Items.Strings[0]);
  end;
end;

procedure TfrmFFUI.mniOpenFolderClick(Sender: TObject);
var
  strFolder: String;
begin
  if not SelectDirectory('选择一个目录，目录下包含视频文件', '', strFolder) then
    Exit;

  srchbxSelectVideoFile.Text := strFolder;
  FindVideoFile(strFolder);
  FFileStyle := fsFolder;
end;

procedure TfrmFFUI.mniOpenWebStreamClick(Sender: TObject);
begin
  FFileStyle := fsStream;
end;

procedure TfrmFFUI.rgUIClick(Sender: TObject);
begin
  SaveConfig;
end;

procedure TfrmFFUI.srchbxSelectVideoFileInvokeSearch(Sender: TObject);
var
  pt: TPoint;
begin
  GetCursorPos(pt);
  pmOpen.Popup(pt.x, pt.y);
end;

{$REGION 'PlayVideo'}

procedure TfrmFFUI.tmrPlayVideoTimer(Sender: TObject);
begin
  if rgUI.ItemIndex = 0 then
    FhPlayVideoWnd := FindWindow('SDL_app', 'ffplay')
  else if rgUI.ItemIndex = 1 then
    FhPlayVideoWnd := FindWindow('mpv', 'mpv')
  else if rgUI.ItemIndex = 2 then
    FhPlayVideoWnd := FindWindow('Qt5QWindowIcon', 'VLC media player');

  if FhPlayVideoWnd <> 0 then
  begin
    tmrPlayVideo.Enabled := False;
    SetWindowLong(FhPlayVideoWnd, GWL_STYLE, NativeInt($96000000));
    SetWindowLong(FhPlayVideoWnd, GWL_EXSTYLE, $00050000);
    Winapi.Windows.SetParent(FhPlayVideoWnd, pnlVideo.Handle);
    SetWindowPos(FhPlayVideoWnd, pnlVideo.Handle, 0, 0, pnlVideo.Width, pnlVideo.Height, SWP_NOZORDER OR SWP_NOACTIVATE);
    ShowWindow(FhPlayVideoWnd, SW_SHOWNORMAL);
  end;
end;

procedure TfrmFFUI.PlayVideoFile(const strVideoFileName: String);
var
  strPlayProgramPath: String;
begin
  case rgUI.ItemIndex of
    0:
      begin
        strPlayProgramPath      := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
        FDOSCommand.CommandLine := Format('"%s\ffplay.exe" -hide_banner -window_title ffplay "%s"', [strPlayProgramPath, strVideoFileName]);
      end;
    1:
      begin
        strPlayProgramPath      := ExtractFilePath(ParamStr(0)) + 'video\mpv';
        FDOSCommand.CommandLine := Format('"%s\mpv.exe" --title=mpv "%s"', [strPlayProgramPath, strVideoFileName]);
      end;
    2:
      begin
        strPlayProgramPath      := ExtractFilePath(ParamStr(0)) + 'video\vlc';
        FDOSCommand.CommandLine := Format('"%s\vlc.exe" --no-qt-name-in-title --qt-minimal-view --no-qt-system-tray "%s"', [strPlayProgramPath, strVideoFileName]);
      end;
  end;
  SetDllDirectory(PChar(strPlayProgramPath));
  FDOSCommand.Execute;
  statInfo.SimpleText  := FDOSCommand.CommandLine;
  tmrPlayVideo.Enabled := True;
  btnPlay.Enabled      := False;
  btnPause.Enabled     := True;
  btnStop.Enabled      := True;
end;

procedure TfrmFFUI.btnPlayClick(Sender: TObject);
begin
  if FhPlayVideoWnd <> 0 then
  begin
    MessageBox(Handle, '视频正在播放，请停止后，再次播放', '系统提示：', MB_OK or MB_ICONWARNING);
    Exit;
  end;

  if FFileStyle = fsFile then
    PlayVideoFile(srchbxSelectVideoFile.Text)
  else if FFileStyle = fsFolder then
    PlayVideoFile(lstFiles.Items.Strings[0])
  else if FFileStyle = fsStream then
    PlayVideoFile(srchbxSelectVideoFile.Text);
end;

procedure TfrmFFUI.SendPlayUIKey(H: HWND; Key: Char);
var
  vKey, ScanCode : Word;
  lParam, ConvKey: LongInt;
begin
  ConvKey  := OemKeyScan(ord(Key));
  ScanCode := ConvKey and $000000FF or $FF00;
  vKey     := ord(Key);
  lParam   := LongInt(ScanCode) shl 16 or 1;
  SendMessage(H, WM_KEYDOWN, vKey, lParam);
  SendMessage(H, WM_CHAR, vKey, lParam);
  lParam := lParam or LongInt($C0000000);
  SendMessage(H, WM_KEYUP, vKey, lParam);
end;

procedure TfrmFFUI.btnPauseClick(Sender: TObject);
begin
  if FhPlayVideoWnd <> 0 then
  begin
    if rgUI.ItemIndex <> 2 then
    begin
      SendPlayUIKey(FhPlayVideoWnd, 'p');
    end
    else
    begin
      SendPlayUIKey(FhPlayVideoWnd, Char(VK_SPACE));
    end;
  end;
end;

procedure TfrmFFUI.btnStopClick(Sender: TObject);
begin
  if FhPlayVideoWnd <> 0 then
  begin
    if rgUI.ItemIndex <> 2 then
      SendPlayUIKey(FhPlayVideoWnd, 'q')
    else
      SendPlayUIKey(FhPlayVideoWnd, 's');

    btnPlay.Enabled  := True;
    btnPause.Enabled := False;
    btnStop.Enabled  := False;
    FhPlayVideoWnd   := 0;
  end;
end;
{$ENDREGION}
{$REGION 'VideoConvertor'}

procedure TfrmFFUI.btnAddVideoFileClick(Sender: TObject);
begin
  //
end;

procedure TfrmFFUI.btnDelVideoFileClick(Sender: TObject);
begin
  //
end;
{$ENDREGION}

end.
