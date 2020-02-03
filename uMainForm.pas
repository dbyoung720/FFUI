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
    rg2: TRadioGroup;
    stat1: TStatusBar;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFFUI: TfrmFFUI;

implementation

{$R *.dfm}

procedure TfrmFFUI.FormResize(Sender: TObject);
begin
  pgcAll.TabWidth := (Width - 33) div 7;
end;

end.
