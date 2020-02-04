unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls;

type
  TfrmFFUI = class(TForm)
    lblVideoFile: TLabel;
    pgcAll: TPageControl;
    tsInfo: TTabSheet;
    mmoInfo: TMemo;
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
    stat1: TStatusBar;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srchbxSelectVideoFileInvokeSearch(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure LoadConfig;
    procedure SaveConfig;
    procedure GetVideoFileFormat(const strFileName: string);
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

procedure TfrmFFUI.FormCreate(Sender: TObject);
begin
  pgcAll.ActivePageIndex := 0;
  LoadConfig;
end;

procedure TfrmFFUI.FormDestroy(Sender: TObject);
begin
  SaveConfig;
end;

procedure TfrmFFUI.FormResize(Sender: TObject);
begin
  pgcAll.TabWidth := (Width - 33) div 7;
end;

procedure TfrmFFUI.GetVideoFileFormat(const strFileName: string);
begin
  //
end;

procedure TfrmFFUI.srchbxSelectVideoFileInvokeSearch(Sender: TObject);
begin
  if not dlgOpenVideoFile.Execute then
    Exit;

  srchbxSelectVideoFile.Text := dlgOpenVideoFile.FileName;
  pgcAll.ActivePage          := tsInfo;
  GetVideoFileFormat(dlgOpenVideoFile.FileName);
end;

end.
