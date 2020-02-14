unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.Clipbrd, SynEdit, SynHighlighterJSON, DosCommand;

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
    btnFullScreen: TButton;
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
    rg1: TRadioGroup;
    rgGPU: TRadioGroup;
    statInfo: TStatusBar;
    pmOpen: TPopupMenu;
    mniOpenFile: TMenuItem;
    mniOpenFolder: TMenuItem;
    mniOpenWebStream: TMenuItem;
    pmStatCopy: TPopupMenu;
    mniCopyDosCommand: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srchbxSelectVideoFileInvokeSearch(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mniOpenFileClick(Sender: TObject);
    procedure mniOpenFolderClick(Sender: TObject);
    procedure mniOpenWebStreamClick(Sender: TObject);
    procedure mniCopyDosCommandClick(Sender: TObject);
  private
    FDOSCommand: TDosCommand;
    FSynEdit   : TSynEdit;
    FJSONHL    : TSynJSONSyn;
    procedure LoadConfig;
    procedure SaveConfig;
    procedure GetVideoFileInfo(const strFileName: string);
    procedure DosCommandLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
  public
    { Public declarations }
  end;

var
  frmFFUI: TfrmFFUI;

implementation

{$R *.dfm}

procedure TfrmFFUI.LoadConfig;
begin
{$IF Defined(CPUX86)}
  rgGPU.ItemIndex := 1;
  rgGPU.Enabled   := False;
{$ENDIF}
end;

procedure TfrmFFUI.SaveConfig;
begin
  //
end;

procedure TfrmFFUI.DosCommandLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
  FSynEdit.Lines.Add(ANewLine);
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
  FSynEdit.Font.Name      := 'ËÎÌו';
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
  pgcAll.TabWidth := (Width - 33) div 7;
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

procedure TfrmFFUI.mniCopyDosCommandClick(Sender: TObject);
begin
  Clipboard.AsText := statInfo.SimpleText;
end;

procedure TfrmFFUI.mniOpenFileClick(Sender: TObject);
begin
  if not dlgOpenVideoFile.Execute then
    Exit;

  srchbxSelectVideoFile.Text := dlgOpenVideoFile.FileName;
  pgcAll.ActivePage          := tsInfo;
  GetVideoFileInfo(dlgOpenVideoFile.FileName);
end;

procedure TfrmFFUI.mniOpenFolderClick(Sender: TObject);
begin
  //
end;

procedure TfrmFFUI.mniOpenWebStreamClick(Sender: TObject);
begin
  //
end;

procedure TfrmFFUI.srchbxSelectVideoFileInvokeSearch(Sender: TObject);
var
  pt: TPoint;
begin
  GetCursorPos(pt);
  pmOpen.Popup(pt.x, pt.y);
end;

end.
