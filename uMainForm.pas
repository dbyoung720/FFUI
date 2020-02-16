unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.TlHelp32, Winapi.PsAPI, System.SysUtils, System.StrUtils, System.Variants, System.Classes, System.IniFiles, System.IOUtils, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Clipbrd, Vcl.FileCtrl,
  {第三方控件}
  SynEdit, SynHighlighterJSON, DosCommand, uProcessAPI;

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
    btnAddFolder: TButton;
    lblConvTip: TLabel;
    cbbConv: TComboBox;
    btnVideoStartConv: TButton;
    chkSize: TCheckBox;
    lblVideoWidth: TLabel;
    lblVideoHeight: TLabel;
    edtVideoWidth: TEdit;
    edtVideoHeight: TEdit;
    chkVideoSavePath: TCheckBox;
    lblSaveVideoPath: TLabel;
    btnSaveVideoPath: TButton;
    edtSaveVideoPath: TEdit;
    btnVideoStopConv: TButton;
    pnlVideoConv: TPanel;
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
    procedure btnAddFolderClick(Sender: TObject);
    procedure chkSizeClick(Sender: TObject);
    procedure chkVideoSavePathClick(Sender: TObject);
    procedure btnVideoStartConvClick(Sender: TObject);
    procedure btnVideoStopConvClick(Sender: TObject);
  private
    FDOSCommand       : TDosCommand;
    FSynEdit_VideoInfo: TSynEdit;
    FSynEdit_VideoConv: TSynEdit;
    FJSONHL           : TSynJSONSyn;
    FFileStyle        : TFileStyle;
    FhPlayVideoWnd    : HWND;
    FbVideoConv       : Boolean;
    procedure LoadConfig;
    procedure SaveConfig;
    procedure GetVideoFileInfo(const strFileName: string);
    procedure DosCommandTerminated(Sender: TObject);
    procedure DosCommandLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure FindVideoFile(const strFolder: string);
    procedure PlayVideoFile(const strVideoFileName: String);
    { 向 ffplay/mpv 播放器发送键盘命令 }
    procedure SendPlayUIKey(H: HWND; Key: Char);
    { 向 vlc 播放器发送键盘命令 }
    procedure SendPlayUIKey_vlc(H: HWND; Key: Char);
    procedure KillProcessOfName(const strProcessName: string);
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
  FDOSCommand              := TDosCommand.Create(nil);
  FDOSCommand.OnNewLine    := DosCommandLine;
  FDOSCommand.OnTerminated := DosCommandTerminated;

  FJSONHL := TSynJSONSyn.Create(Self);

  FSynEdit_VideoInfo                := TSynEdit.Create(tsInfo);
  FSynEdit_VideoInfo.Parent         := tsInfo;
  FSynEdit_VideoInfo.Align          := alClient;
  FSynEdit_VideoInfo.BorderStyle    := bsNone;
  FSynEdit_VideoInfo.Gutter.Visible := False;
  FSynEdit_VideoInfo.Font.Name      := '宋体';
  FSynEdit_VideoInfo.Font.Size      := 12;
  FSynEdit_VideoInfo.RightEdge      := tsInfo.Width;
  FSynEdit_VideoInfo.ScrollBars     := ssVertical;
  FSynEdit_VideoInfo.Highlighter    := FJSONHL;

  FSynEdit_VideoConv                := TSynEdit.Create(pnlVideoConv);
  FSynEdit_VideoConv.Parent         := pnlVideoConv;
  FSynEdit_VideoConv.Align          := alClient;
  FSynEdit_VideoConv.BorderStyle    := bsNone;
  FSynEdit_VideoConv.Gutter.Visible := False;
  FSynEdit_VideoConv.Font.Name      := '宋体';
  FSynEdit_VideoConv.Font.Size      := 12;
  FSynEdit_VideoConv.RightEdge      := pnlVideoConv.Width;
  FSynEdit_VideoConv.ScrollBars     := ssVertical;
  FSynEdit_VideoConv.Highlighter    := FJSONHL;

  FbVideoConv            := False;
  FhPlayVideoWnd         := 0;
  pgcAll.ActivePageIndex := 0;
  LoadConfig;
end;

procedure TfrmFFUI.FormDestroy(Sender: TObject);
begin
  SaveConfig;

  FDOSCommand.Free;
  FJSONHL.Free;
  FSynEdit_VideoConv.Free;
  FSynEdit_VideoInfo.Free;
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
  if FbVideoConv then
  begin
    FSynEdit_VideoConv.Lines.Insert(0, ANewLine);
  end
  else
  begin
    FSynEdit_VideoInfo.Lines.Add(ANewLine);
  end;
end;

procedure TfrmFFUI.DosCommandTerminated(Sender: TObject);
begin
  if FbVideoConv then
  begin
    FbVideoConv               := False;
    btnVideoStartConv.Enabled := True;
    btnVideoStopConv.Enabled  := False;
  end;
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
  FSynEdit_VideoInfo.Lines.Clear;
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
  gfs := TDirectory.GetFiles(strFolder, '*.avi');
  for strFileName in gfs do
    lstFiles.Items.Add(strFileName);

  gfs := TDirectory.GetFiles(strFolder, '*.mp4');
  for strFileName in gfs do
    lstFiles.Items.Add(strFileName);

  gfs := TDirectory.GetFiles(strFolder, '*.mkv');
  for strFileName in gfs do
    lstFiles.Items.Add(strFileName);

  gfs := TDirectory.GetFiles(strFolder, '*.mov');
  for strFileName in gfs do
    lstFiles.Items.Add(strFileName);

  gfs := TDirectory.GetFiles(strFolder, '*.rmvb');
  for strFileName in gfs do
    lstFiles.Items.Add(strFileName);

  gfs := TDirectory.GetFiles(strFolder, '*.vob');
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
  if srchbxSelectVideoFile.Text = '' then
  begin
    MessageBox(Handle, '请先选择打开一个视频文件，再播放', '系统提示：', MB_OK or MB_ICONWARNING);
    srchbxSelectVideoFile.SetFocus;
    Exit;
  end;

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

{ 向 ffplay/mpv 播放器发送键盘命令 }
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

{ 向 vlc 播放器发送键盘命令 }
procedure TfrmFFUI.SendPlayUIKey_vlc(H: HWND; Key: Char);
begin
  //
end;

procedure TfrmFFUI.btnPauseClick(Sender: TObject);
begin
  if FhPlayVideoWnd = 0 then
    Exit;

  if rgUI.ItemIndex <> 2 then
    SendPlayUIKey(FhPlayVideoWnd, 'p')
  else
    SendPlayUIKey_vlc(FhPlayVideoWnd, Char(VK_SPACE));
end;

procedure TfrmFFUI.btnStopClick(Sender: TObject);
begin
  if FhPlayVideoWnd = 0 then
    Exit;

  if rgUI.ItemIndex <> 2 then
    SendPlayUIKey(FhPlayVideoWnd, 'q')
  else
    SendPlayUIKey_vlc(FhPlayVideoWnd, 's');

  btnPlay.Enabled  := True;
  btnPause.Enabled := False;
  btnStop.Enabled  := False;
  FhPlayVideoWnd   := 0;
end;
{$ENDREGION}
{$REGION 'VideoConvertor'}

procedure TfrmFFUI.btnAddFolderClick(Sender: TObject);
var
  strFolder: String;
begin
  if not SelectDirectory('选择一个目录，目录下包含视频文件', '', strFolder) then
    Exit;

  FindVideoFile(strFolder);
end;

procedure TfrmFFUI.btnAddVideoFileClick(Sender: TObject);
begin
  if not dlgOpenVideoFile.Execute then
    Exit;

  lstFiles.Items.Add(dlgOpenVideoFile.FileName);
end;

procedure TfrmFFUI.btnDelVideoFileClick(Sender: TObject);
begin
  if lstFiles.ItemIndex <> -1 then
    lstFiles.DeleteSelected;
end;

procedure TfrmFFUI.chkSizeClick(Sender: TObject);
begin
  lblVideoWidth.Visible  := not chkSize.Checked;
  lblVideoHeight.Visible := not chkSize.Checked;
  edtVideoWidth.Visible  := not chkSize.Checked;
  edtVideoHeight.Visible := not chkSize.Checked;
end;

procedure TfrmFFUI.chkVideoSavePathClick(Sender: TObject);
begin
  lblSaveVideoPath.Visible := not chkVideoSavePath.Checked;
  edtSaveVideoPath.Visible := not chkVideoSavePath.Checked;
  btnSaveVideoPath.Visible := not chkVideoSavePath.Checked;
end;

procedure TfrmFFUI.btnVideoStartConvClick(Sender: TObject);
const
  c_strFFMPEGConv_CPU_H264 = '"%s\ffmpeg" -hide_banner -i "%s" -c:v libx264    -y "%s"';
  c_strFFMPEGConv_GPU_H264 = '"%s\ffmpeg" -hide_banner -i "%s" -c:v h264_nvenc -y "%s"';
  c_strFFMPEGConv_CPU_FFLV = '"%s\ffmpeg" -hide_banner -i "%s" -c:v libx264    -y "%s"';
  c_strFFMPEGConv_CPU_H265 = '"%s\ffmpeg" -hide_banner -i "%s" -c:v libx265    -y "%s"';
  c_strFFMPEGConv_GPU_H265 = '"%s\ffmpeg" -hide_banner -i "%s" -c:v h265_nvenc -y "%s"';
  c_strFFMPEGConv_GPU_FFLV = '"%s\ffmpeg" -hide_banner -i "%s" -c:v h264_nvenc -y "%s"';
var
  strFFMPEGPath      : String;
  strFFMPGCommandLine: String;
  strInputFile       : string;
  strOutPutFile      : string;
  I                  : Integer;
  strTempCMDFileName : String;
  lstCMD             : TStringList;
  strExtFileName     : String;
  procedure X86;
  begin
    case cbbConv.ItemIndex of
      0:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_CPU_H264, [strFFMPEGPath, strInputFile, strOutPutFile]);
      1:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_CPU_H265, [strFFMPEGPath, strInputFile, strOutPutFile]);
      2:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_CPU_FFLV, [strFFMPEGPath, strInputFile, strOutPutFile]);
    end;
  end;

  procedure X64_GPU;
  begin
    case cbbConv.ItemIndex of
      0:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_GPU_H264, [strFFMPEGPath, strInputFile, strOutPutFile]);
      1:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_GPU_H265, [strFFMPEGPath, strInputFile, strOutPutFile]);
      2:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_GPU_FFLV, [strFFMPEGPath, strInputFile, strOutPutFile]);
    end;
  end;

begin
  if lstFiles.Count <= 0 then
  begin
    MessageBox(Handle, '必须先添加视频文件再转换', '系统提示：', MB_OK or MB_ICONWARNING);
    Exit;
  end;

  strExtFileName := Ifthen(cbbConv.ItemIndex <> 2, '.mkv', '.flv');
  strFFMPEGPath  := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  lstCMD         := TStringList.Create;
  try
    for I := 0 to lstFiles.Count - 1 do
    begin
      Application.ProcessMessages;
      strInputFile  := lstFiles.Items.Strings[I];
      strOutPutFile := ChangeFileExt(strInputFile, strExtFileName);
      if SameText(strOutPutFile, strInputFile) then
        strOutPutFile := strInputFile + strExtFileName;
{$IF Defined(CPUX86)}
      X86;
{$ELSE}
      if rgGPU.ItemIndex = 0 then
        X64_GPU
      else
        X86;
{$ENDIF}
      lstCMD.Add(strFFMPGCommandLine);
    end;

    strTempCMDFileName := TPath.GetTempPath + 'conv.cmd';
    lstCMD.SaveToFile(strTempCMDFileName);
    FDOSCommand.CommandLine := strTempCMDFileName;
    FDOSCommand.Execute;
    FbVideoConv := True;
    FSynEdit_VideoConv.Lines.Clear;
    btnVideoStartConv.Enabled := False;
    btnVideoStopConv.Enabled  := True;
    statInfo.SimpleText       := lstCMD.Strings[0];
  finally
    lstCMD.Free;
  end;
end;

{ 获取进程路径 }
function GetProcessName(dwProcessID: LongInt; bFullPath: Bool): String;
var
  pinfo: PROCESS_INFO;
begin
  GetProcessInfo(dwProcessID, pinfo);
  Result := String(pinfo.ImagePathName);
end;

{ TDosCommand.Stop 无法停止 CMD 进程，需手动杀死进程 }
procedure TfrmFFUI.KillProcessOfName(const strProcessName: string);
var
  hSnapshot    : THandle;
  lppe         : TProcessEntry32;
  bFound       : Boolean;
  strModulePath: string;
begin
  hSnapshot   := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  lppe.dwSize := SizeOf(TProcessEntry32);
  bFound      := Process32First(hSnapshot, lppe);
  while bFound do
  begin
    strModulePath := GetProcessName(lppe.th32ProcessID, True);
    if SameText(strModulePath, strProcessName) then
    begin
      TerminateProcess(OpenProcess(PROCESS_TERMINATE, Bool(0), lppe.th32ProcessID), 0);
      Break;
    end;
    bFound := Process32Next(hSnapshot, lppe);
  end;
end;

procedure TfrmFFUI.btnVideoStopConvClick(Sender: TObject);
begin
  { TDosCommand.Stop 无法停止 CMD 进程，需手动杀死进程 }
  KillProcessOfName(ExtractFilePath(ParamStr(0)) + 'video\ffmpeg\ffmpeg.exe');

  FbVideoConv               := False;
  btnVideoStartConv.Enabled := True;
  btnVideoStopConv.Enabled  := False;
  FDOSCommand.Stop;
end;

{$ENDREGION}

end.
