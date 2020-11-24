unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.TlHelp32, Winapi.ShellAPI, Winapi.ActiveX, Winapi.DirectShow9,
  System.SysUtils, System.StrUtils, System.Classes, System.Win.Registry, System.IniFiles, System.IOUtils, System.Types, System.Math, System.ImageList, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Clipbrd, Vcl.FileCtrl, Vcl.ImgList, Vcl.ExtDlgs,
  {第三方控件}
  SynEdit, SynHighlighterJSON, DosCommand, uProcessAPI;

type
  { 打开文件方式：文件/文件夹/网络视频流地址 }
  TFileStyle = (fsFile, fsFolder, fsStream);

  { 视频操作状态 }
  TStatStyle = (ssBlank, ssInfo, ssPaly, ssConv, ssSplit, ssMerge, ssCut, ssLive);

  { 视频流、音频流、字幕流、转换 }
  TVideoStyle = (vsVideo, vsAudio, vsSubtitle, vsConv);

  { 界面语言 }
  TLangUI = (lngChinese, lngEnglish);

type
  TfrmFFUI = class(TForm)
    lblVideoFile: TLabel;
    pgcAll: TPageControl;
    tsInfo: TTabSheet;
    tsPlay: TTabSheet;
    pnlButtonCommand: TPanel;
    btnVideoPlayPlay: TButton;
    btnVideoPlayPause: TButton;
    btnVideoPlayStop: TButton;
    pnlVideo: TPanel;
    tsConv: TTabSheet;
    tsSplit: TTabSheet;
    tsMerge: TTabSheet;
    tsLive: TTabSheet;
    rgLive: TRadioGroup;
    srchbxSelectVideoFile: TSearchBox;
    dlgOpenVideoFile: TOpenDialog;
    tsConfig: TTabSheet;
    rgPlayUI: TRadioGroup;
    rgUseGPU: TRadioGroup;
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
    btnVideoStartConv: TButton;
    btnVideoStopConv: TButton;
    pnlVideoConv: TPanel;
    grpVideoConv: TGroupBox;
    chkVideoSize: TCheckBox;
    lblVideoWidth: TLabel;
    lblVideoHeight: TLabel;
    edtVideoHeight: TEdit;
    edtVideoWidth: TEdit;
    chkConvSavePath: TCheckBox;
    lblSaveVideoPath: TLabel;
    lblConvTip: TLabel;
    cbbConv: TComboBox;
    btnVideoConvParam: TButton;
    lblTitle: TLabel;
    lblArtist: TLabel;
    lblGenre: TLabel;
    lblComment: TLabel;
    edtTitle: TEdit;
    edtArtist: TEdit;
    edtGenre: TEdit;
    edtComment: TEdit;
    lblVideoInfo: TLabel;
    btnSaveConvParam: TButton;
    btnSaveConvParamAndStartConv: TButton;
    lblVidoeSplitAudio: TLabel;
    lblVidoeSplitVideo: TLabel;
    lblVidoeSplitSubtitle: TLabel;
    lstSplitVideo: TListBox;
    lstSplitAudio: TListBox;
    lstSplitSubtitle: TListBox;
    btnVideoSplit: TButton;
    lblVideoSplitTip: TLabel;
    grpSplitPath: TGroupBox;
    chkSplitSamePath: TCheckBox;
    lblSplitSamePath: TLabel;
    srchbxVideoConvSavePath: TSearchBox;
    srchbxSplitVideoSavePath: TSearchBox;
    lnklblHelpAccelGPU: TLinkLabel;
    rgLanguageUI: TRadioGroup;
    ilpgc: TImageList;
    tsCut: TTabSheet;
    chkConvOpenSavePath: TCheckBox;
    chkSplitOpenSavePath: TCheckBox;
    lblMergeVideo: TLabel;
    lstMergeVideo: TListBox;
    lblMergeAudio: TLabel;
    lblMergeSubtitle: TLabel;
    lstMergeAudio: TListBox;
    lstMergeSubtitle: TListBox;
    lblMergeTip: TLabel;
    btnMergeVideoAdd: TButton;
    btnMergeVideoDel: TButton;
    btnMergeAudioAdd: TButton;
    btnMergeAudioDel: TButton;
    btnMergeSubtitleAdd: TButton;
    btnMergeSubtitleDel: TButton;
    btnMerge: TButton;
    grpMergePath: TGroupBox;
    lblMergeSamePath: TLabel;
    chkMergeSamePath: TCheckBox;
    srchbxMergeVideoSavePath: TSearchBox;
    chkMergeOpenSavePath: TCheckBox;
    lblMergeFormat: TLabel;
    cbbMergeFormat: TComboBox;
    chkAddWaterMark: TCheckBox;
    lblWatermark: TLabel;
    srchbxWatermark: TSearchBox;
    btnConnectMulVideo: TButton;
    lblWatchMarkLeft: TLabel;
    lblWatchMarkTop: TLabel;
    edtWatchMarkTopValue: TEdit;
    edtWatchMarkLeftValue: TEdit;
    rgCut: TRadioGroup;
    grpCutToImage: TGroupBox;
    cbbCutImage: TComboBox;
    lblCutImageFormat: TLabel;
    grpCutTime: TGroupBox;
    lblCutStartTime: TLabel;
    lblCutEndTime: TLabel;
    edtCutStartTime: TEdit;
    edtCutEndTime: TEdit;
    chkCutToImage: TCheckBox;
    btnCut: TButton;
    grpCutConfig: TGroupBox;
    lblCutVideoSavePath: TLabel;
    chkCutSamePath: TCheckBox;
    srchbxCutVideoSavePath: TSearchBox;
    chkCutOpenSavePath: TCheckBox;
    grpLiveAddress: TGroupBox;
    edtLiveIP: TEdit;
    btnLive: TButton;
    btnPlayUSBCamera: TButton;
    chkConvAutoSearchSubtitle: TCheckBox;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srchbxSelectVideoFileInvokeSearch(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mniOpenFileClick(Sender: TObject);
    procedure mniOpenFolderClick(Sender: TObject);
    procedure mniOpenWebStreamClick(Sender: TObject);
    procedure mniCopyDosCommandClick(Sender: TObject);
    procedure rgPlayUIClick(Sender: TObject);
    procedure btnVideoPlayPlayClick(Sender: TObject);
    procedure btnAddVideoFileClick(Sender: TObject);
    procedure btnDelVideoFileClick(Sender: TObject);
    procedure tmrPlayVideoTimer(Sender: TObject);
    procedure btnVideoPlayPauseClick(Sender: TObject);
    procedure btnVideoPlayStopClick(Sender: TObject);
    procedure btnAddFolderClick(Sender: TObject);
    procedure chkVideoSizeClick(Sender: TObject);
    procedure chkConvSavePathClick(Sender: TObject);
    procedure btnVideoStartConvClick(Sender: TObject);
    procedure btnVideoStopConvClick(Sender: TObject);
    procedure btnVideoConvParamClick(Sender: TObject);
    procedure btnSaveConvParamClick(Sender: TObject);
    procedure btnSaveConvParamAndStartConvClick(Sender: TObject);
    procedure chkSplitSamePathClick(Sender: TObject);
    procedure lnklblHelpAccelGPULinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
    procedure rgLanguageUIClick(Sender: TObject);
    procedure btnVideoSplitClick(Sender: TObject);
    procedure chkConvOpenSavePathClick(Sender: TObject);
    procedure chkMergeSamePathClick(Sender: TObject);
    procedure chkMergeOpenSavePathClick(Sender: TObject);
    procedure btnMergeClick(Sender: TObject);
    procedure srchbxSplitVideoSavePathInvokeSearch(Sender: TObject);
    procedure srchbxVideoConvSavePathInvokeSearch(Sender: TObject);
    procedure btnMergeVideoAddClick(Sender: TObject);
    procedure btnMergeVideoDelClick(Sender: TObject);
    procedure btnMergeAudioAddClick(Sender: TObject);
    procedure btnMergeAudioDelClick(Sender: TObject);
    procedure btnMergeSubtitleAddClick(Sender: TObject);
    procedure btnMergeSubtitleDelClick(Sender: TObject);
    procedure cbbMergeFormatChange(Sender: TObject);
    procedure btnConnectMulVideoClick(Sender: TObject);
    procedure srchbxWatermarkInvokeSearch(Sender: TObject);
    procedure chkAddWaterMarkClick(Sender: TObject);
    procedure chkCutToImageClick(Sender: TObject);
    procedure rgCutClick(Sender: TObject);
    procedure btnCutClick(Sender: TObject);
    procedure chkCutSamePathClick(Sender: TObject);
    procedure srchbxMergeVideoSavePathInvokeSearch(Sender: TObject);
    procedure btnLiveClick(Sender: TObject);
    procedure btnPlayUSBCameraClick(Sender: TObject);
  private
    FlngUI                   : TLangUI;
    FDOSCommand              : TDosCommand;
    FSynEdit_VideoInfo       : TSynEdit;
    FSynEdit_VideoConv       : TSynEdit;
    FSynEdit_VideoSplit      : TSynEdit;
    FSynEdit_VideoMerge      : TSynEdit;
    FSynEdit_VideoCut        : TSynEdit;
    FSynEdit_VideoLive       : TSynEdit;
    FJSONHL                  : TSynJSONSyn;
    FFileStyle               : TFileStyle;
    FVideoStyle              : TVideoStyle;
    FhPlayVideoWnd           : HWND;
    FStatStyle               : TStatStyle;
    FbLoadConfig             : Boolean;
    FstrUSBCameraFriendlyName: String;
    { 更改界面语言 }
    procedure ChangeLanguageUI;
    procedure ChangeLanguageChinese;
    procedure ChangeLanguageEnglish;
    function TransUI(const strLang: string): String;
    { 创建语法高亮的 SynEdit 控件 }
    procedure CreateSynEdit;
    { 检查本机是否有 USB 摄像头 }
    function CheckUSBCamera: Boolean;
    { 加载系统参数 }
    procedure LoadConfig;
    { 保存系统参数 }
    procedure SaveConfigProc;
    function SaveConfig: Boolean;
    { 获取视频文件格式信息 }
    procedure GetVideoFileInfo(const strVideoFileName: string);
    { 获取视频文件，视频流、音频流、字幕流信息 }
    procedure GetVideoSplitInfo(const strVideoFileName: string);
    { 视频转换结束 }
    procedure DosCommandTerminated(Sender: TObject);
    { Dos 命令行运行返回的字符串 }
    procedure DosCommandLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    { 使 DOS 命令行提示符支持 UTF8 编码，解决乱码问题 }
    function DosCommandLineUTF8Dec(ASender: TObject; ABuf: TStream): string;
    { 查询目录下的所有视频文件 }
    procedure FindVideoFile(const strFolder: string);
    { 播放视频 }
    procedure PlayVideoFile(const strVideoFileName: String);
    { 向 ffplay/mpv 播放器发送键盘命令 }
    procedure SendPlayUIKey(H: HWND; Key: Char);
    { 向 vlc 播放器发送键盘命令 }
    procedure SendPlayUIKey_vlc(H: HWND; Key: Char);
    { TDosCommand.Stop 无法停止 CMD 进程，需手动杀死进程 }
    procedure KillProcessOfProcessName(const strProcessName: string);
    { 打开视频转换后的保存路径 }
    procedure OpenVideoConvPath;
    { 打开视频分离后的保存路径 }
    procedure OpenVideoSplitPath;
    { 打开视频合并后的保存路径 }
    procedure OpenVideoMergePath;
    { 打开视频截取后的保存路径 }
    procedure OpenVideoCutPath;
    { 视频转换结束 }
    procedure FinishVideoConv;
    { 视频分割结束 }
    procedure FinishVideoSplit;
    { 视频合并结束 }
    procedure FinishVideoMerge;
    { 视频截取结束 }
    procedure FinishVideoCut;
    { 查找相同文件的字幕文件 }
    function FindSameNameSubtitle(const strVideoFileName: string): String;
  end;

var
  frmFFUI: TfrmFFUI;

implementation

{$R *.dfm}
{$INCLUDE lng.inc}

const
  c_strAudioFormat    = '*.3gp;*.aac;*.ac3;*.dts;*.mp2;*.mp3;*.m3p;*.wav;*.wma;*.ogg';
  c_strVideoFormat    = '*.AVI;*.FLV;*.M2V;*.MKV;*.MOV;*.MPG;*.MP4;*.H264;*.H265;*.RMVB;*.TS;*.VOB;*.WMV;*.YUV';
  c_strSubtitleFormat = '*.txt;*.ass;*.srt';

  { 更改界面语言 }
procedure TfrmFFUI.ChangeLanguageUI;
begin
  case FlngUI of
    lngChinese:
      ChangeLanguageChinese;
    lngEnglish:
      ChangeLanguageEnglish;
  end;
end;

{ 加载系统参数 }
procedure TfrmFFUI.LoadConfig;
var
  strIniFileName: String;
begin
  FbLoadConfig := True;
  try
    strIniFileName := ExtractFilePath(ParamStr(0)) + 'config.ini';
    with TIniFile.Create(strIniFileName) do
    begin
      rgPlayUI.ItemIndex := ReadInteger('Main', 'PlayUI', 0);
      rgUseGPU.ItemIndex := ReadInteger('Main', 'UseGPU', 0);

      { 视频转换参数 }
      cbbConv.ItemIndex       := ReadInteger('Conv', 'Format', 0);
      chkVideoSize.Checked    := ReadBool('Conv', 'SameSize', True);
      chkConvSavePath.Checked := ReadBool('COnv', 'SamePath', True);
      if not chkVideoSize.Checked then
      begin
        edtVideoWidth.Text  := ReadString('Conv', 'SizeWidth', '800');
        edtVideoHeight.Text := ReadString('Conv', 'SizeHeight', '600');
      end;
      if not chkConvSavePath.Checked then
      begin
        srchbxVideoConvSavePath.Text := ReadString('Conv', 'SavePath', 'D:\');
      end;

      { 视频剪辑信息 }
      edtTitle.Text   := ReadString('Conv', 'Title', 'dbyoung');
      edtArtist.Text  := ReadString('Conv', 'Artist', 'FFUI 2.0');
      edtGenre.Text   := ReadString('Conv', 'Genre', 'Video');
      edtComment.Text := ReadString('Conv', 'Comment', 'dbyoung@sina.com');

      { 是否自动搜索字幕文件 }
      chkConvAutoSearchSubtitle.Checked := ReadBool('Conv', 'Subtitle', True);

      { 视频分离路径 }
      chkSplitSamePath.Checked := ReadBool('Split', 'SamePath', True);
      if not chkSplitSamePath.Checked then
        srchbxSplitVideoSavePath.Text := ReadString('Split', 'SavePath', 'D:\');
      chkSplitOpenSavePath.Checked    := ReadBool('Split', 'OpenSavePath', True);

      { 视频合并路径 }
      chkMergeSamePath.Checked := ReadBool('Merge', 'SamePath', True);
      if not chkMergeSamePath.Checked then
        srchbxMergeVideoSavePath.Text := ReadString('Merge', 'SavePath', 'D:\');
      chkMergeOpenSavePath.Checked    := ReadBool('Merge', 'OpenSavePath', True);

      { 视频截取路径 }
      chkCutSamePath.Checked := ReadBool('Cut', 'SamePath', True);
      if not chkCutSamePath.Checked then
        srchbxCutVideoSavePath.Text := ReadString('Cut', 'SavePath', 'D:\');
      chkCutOpenSavePath.Checked    := ReadBool('Cut', 'OpenSavePath', True);

      { 界面语言 }
      FlngUI                 := TLangUI(ReadInteger('UI', 'Language', 0) mod 2);
      rgLanguageUI.ItemIndex := Integer(TLangUI(ReadInteger('UI', 'Language', 0) mod 2));
      ChangeLanguageUI;

      Free;
    end;
  finally
    FbLoadConfig := False;
  end;
end;

{ 保存系统参数 }
procedure TfrmFFUI.SaveConfigProc;
var
  strIniFileName: String;
begin
  strIniFileName := ExtractFilePath(ParamStr(0)) + 'config.ini';
  with TIniFile.Create(strIniFileName) do
  begin
    WriteInteger('Main', 'PlayUI', rgPlayUI.ItemIndex);
    WriteInteger('Main', 'UseGPU', rgUseGPU.ItemIndex);

    WriteInteger('Conv', 'Format', cbbConv.ItemIndex);
    WriteBool('Conv', 'SameSize', chkVideoSize.Checked);
    WriteBool('Conv', 'SamePath', chkConvSavePath.Checked);

    { 视频分辨率大小 }
    if not chkVideoSize.Checked then
    begin
      WriteString('Conv', 'SizeWidth', edtVideoWidth.Text);
      WriteString('Conv', 'SizeHeight', edtVideoHeight.Text);
    end
    else
    begin
      DeleteKey('Conv', 'SizeWidth');
      DeleteKey('Conv', 'SizeHeight');
    end;

    { 视频保存路径 }
    if not chkConvSavePath.Checked then
      WriteString('Conv', 'SavePath', srchbxVideoConvSavePath.Text)
    else
      DeleteKey('Conv', 'SavePath');
    WriteBool('Conv', 'OpenPath', chkConvOpenSavePath.Checked);

    { 视频剪辑信息 }
    WriteString('Conv', 'Title', edtTitle.Text);
    WriteString('Conv', 'Artist', edtArtist.Text);
    WriteString('Conv', 'Genre', edtGenre.Text);
    WriteString('Conv', 'Comment', edtComment.Text);

    { 是否在当前目录下自动搜索字幕文件 }
    WriteBool('Conv', 'Subtitle', chkConvAutoSearchSubtitle.Checked);

    { 分离保存路径 }
    WriteBool('Split', 'SamePath', chkSplitSamePath.Checked);
    if not chkSplitSamePath.Checked then
      WriteString('Split', 'SavePath', srchbxSplitVideoSavePath.Text)
    else
      DeleteKey('Split', 'SavePath');
    WriteBool('Split', 'OpenSavePath', chkSplitOpenSavePath.Checked);

    { 合并保存路径 }
    WriteBool('Merge', 'SamePath', chkMergeSamePath.Checked);
    if not chkMergeSamePath.Checked then
      WriteString('Merge', 'SavePath', srchbxMergeVideoSavePath.Text)
    else
      DeleteKey('Merge', 'SavePath');
    WriteBool('Merge', 'OpenSavePath', chkMergeOpenSavePath.Checked);

    { 截取保存路径 }
    WriteBool('Cut', 'SamePath', chkCutSamePath.Checked);
    if not chkCutSamePath.Checked then
      WriteString('Cut', 'SavePath', srchbxCutVideoSavePath.Text)
    else
      DeleteKey('Cut', 'SavePath');
    WriteBool('Cut', 'OpenSavePath', chkCutOpenSavePath.Checked);

    { 界面语言 }
    WriteInteger('UI', 'Language', rgLanguageUI.ItemIndex);

    Free;
  end;
end;

{ 保存系统参数 }
function TfrmFFUI.SaveConfig: Boolean;
begin
  Result := False;
  if FbLoadConfig then
    Exit;

  { 检查配置参数的有效性 }
  if (Trim(edtTitle.Text) = '') or (Trim(edtArtist.Text) = '') or (Trim(edtGenre.Text) = '') or (Trim(edtComment.Text) = '') then
  begin
    MessageBox(Handle, PChar(TransUI('视频剪辑信息不允许为空，请输入正确的值')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    Exit;
  end;

  if not chkVideoSize.Checked then
  begin
    if (Trim(edtVideoWidth.Text) = '') or (Trim(edtVideoHeight.Text) = '') or (edtVideoWidth.Text = '0') or (edtVideoHeight.Text = '0') then
    begin
      MessageBox(Handle, PChar(TransUI('必须输入正确视频的宽和高')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
      edtVideoWidth.SetFocus;
      Exit;
    end;
  end;

  if not chkConvSavePath.Checked then
  begin
    if Trim(srchbxVideoConvSavePath.Text) = '' then
    begin
      MessageBox(Handle, PChar(TransUI('必须选择一个目录，来保存转换后的视频')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
      Exit;
    end;
  end;

  if not chkSplitSamePath.Checked then
  begin
    if Trim(srchbxSplitVideoSavePath.Text) = '' then
    begin
      MessageBox(Handle, PChar(TransUI('必须选择一个目录，来保存分离的视频')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
      Exit;
    end;
  end;

  Result := True;
  SaveConfigProc;
end;

procedure TfrmFFUI.rgLanguageUIClick(Sender: TObject);
begin
  if not SaveConfig then
    Exit;

  FlngUI := TLangUI(Ifthen(rgLanguageUI.ItemIndex = 0, Integer(lngChinese), Integer(lngEnglish)));
  ChangeLanguageUI;
end;

procedure TfrmFFUI.rgPlayUIClick(Sender: TObject);
begin
  SaveConfig;
end;

procedure TfrmFFUI.btnSaveConvParamAndStartConvClick(Sender: TObject);
begin
  if not SaveConfig then
    Exit;

  pgcAll.ActivePage := tsConv;
  btnVideoStartConv.Click;
end;

procedure TfrmFFUI.btnSaveConvParamClick(Sender: TObject);
begin
  SaveConfig;
end;

procedure TfrmFFUI.chkVideoSizeClick(Sender: TObject);
begin
  lblVideoWidth.Visible  := not chkVideoSize.Checked;
  lblVideoHeight.Visible := not chkVideoSize.Checked;
  edtVideoWidth.Visible  := not chkVideoSize.Checked;
  edtVideoHeight.Visible := not chkVideoSize.Checked;
end;

procedure TfrmFFUI.chkAddWaterMarkClick(Sender: TObject);
begin
  lblWatermark.Visible          := chkAddWaterMark.Checked;
  srchbxWatermark.Visible       := chkAddWaterMark.Checked;
  lblWatchMarkTop.Visible       := chkAddWaterMark.Checked;
  lblWatchMarkLeft.Visible      := chkAddWaterMark.Checked;
  edtWatchMarkTopValue.Visible  := chkAddWaterMark.Checked;
  edtWatchMarkLeftValue.Visible := chkAddWaterMark.Checked;
end;

procedure TfrmFFUI.chkConvOpenSavePathClick(Sender: TObject);
begin
  SaveConfig;
end;

procedure TfrmFFUI.chkSplitSamePathClick(Sender: TObject);
begin
  lblSplitSamePath.Visible         := not chkSplitSamePath.Checked;
  srchbxSplitVideoSavePath.Visible := not chkSplitSamePath.Checked;
  if chkSplitSamePath.Checked then
    SaveConfig;
end;

procedure TfrmFFUI.chkConvSavePathClick(Sender: TObject);
begin
  lblSaveVideoPath.Visible        := not chkConvSavePath.Checked;
  srchbxVideoConvSavePath.Visible := not chkConvSavePath.Checked;
end;

procedure TfrmFFUI.chkMergeOpenSavePathClick(Sender: TObject);
begin
  SaveConfig;
end;

procedure TfrmFFUI.chkMergeSamePathClick(Sender: TObject);
begin
  lblMergeSamePath.Visible         := not chkMergeSamePath.Checked;
  srchbxMergeVideoSavePath.Visible := not chkMergeSamePath.Checked;
  if chkMergeSamePath.Checked then
    SaveConfig;
end;

procedure TfrmFFUI.lnklblHelpAccelGPULinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
begin
  ShellExecute(0, nil, PChar(Link), nil, nil, 1);
end;

procedure TfrmFFUI.cbbMergeFormatChange(Sender: TObject);
begin
  //
end;

{ 创建语法高亮的 SynEdit 控件 }
procedure TfrmFFUI.CreateSynEdit;
begin
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
  FSynEdit_VideoInfo.ReadOnly       := True;

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
  FSynEdit_VideoConv.ReadOnly       := True;

  FSynEdit_VideoSplit                := TSynEdit.Create(tsSplit);
  FSynEdit_VideoSplit.Parent         := tsSplit;
  FSynEdit_VideoSplit.Left           := 70;
  FSynEdit_VideoSplit.Top            := 324;
  FSynEdit_VideoSplit.Width          := 761;
  FSynEdit_VideoSplit.Height         := 233;
  FSynEdit_VideoSplit.Anchors        := [akLeft, akTop, akRight, akBottom];
  FSynEdit_VideoSplit.Gutter.Visible := False;
  FSynEdit_VideoSplit.Font.Name      := '宋体';
  FSynEdit_VideoSplit.Font.Size      := 12;
  FSynEdit_VideoSplit.RightEdge      := pnlVideoConv.Width;
  FSynEdit_VideoSplit.ScrollBars     := ssVertical;
  FSynEdit_VideoSplit.Highlighter    := FJSONHL;
  FSynEdit_VideoSplit.ReadOnly       := True;

  FSynEdit_VideoMerge                := TSynEdit.Create(tsMerge);
  FSynEdit_VideoMerge.Parent         := tsMerge;
  FSynEdit_VideoMerge.Left           := 70;
  FSynEdit_VideoMerge.Top            := 324;
  FSynEdit_VideoMerge.Width          := 761;
  FSynEdit_VideoMerge.Height         := 233;
  FSynEdit_VideoMerge.Anchors        := [akLeft, akTop, akRight, akBottom];
  FSynEdit_VideoMerge.Gutter.Visible := False;
  FSynEdit_VideoMerge.Font.Name      := '宋体';
  FSynEdit_VideoMerge.Font.Size      := 12;
  FSynEdit_VideoMerge.RightEdge      := pnlVideoConv.Width;
  FSynEdit_VideoMerge.ScrollBars     := ssVertical;
  FSynEdit_VideoMerge.Highlighter    := FJSONHL;
  FSynEdit_VideoMerge.ReadOnly       := True;

  FSynEdit_VideoCut                := TSynEdit.Create(tsCut);
  FSynEdit_VideoCut.Parent         := tsCut;
  FSynEdit_VideoCut.Left           := 70;
  FSynEdit_VideoCut.Top            := 324;
  FSynEdit_VideoCut.Width          := 761;
  FSynEdit_VideoCut.Height         := 233;
  FSynEdit_VideoCut.Anchors        := [akLeft, akTop, akRight, akBottom];
  FSynEdit_VideoCut.Gutter.Visible := False;
  FSynEdit_VideoCut.Font.Name      := '宋体';
  FSynEdit_VideoCut.Font.Size      := 12;
  FSynEdit_VideoCut.RightEdge      := pnlVideoConv.Width;
  FSynEdit_VideoCut.ScrollBars     := ssVertical;
  FSynEdit_VideoCut.Highlighter    := FJSONHL;
  FSynEdit_VideoCut.ReadOnly       := True;

  FSynEdit_VideoLive                := TSynEdit.Create(tsLive);
  FSynEdit_VideoLive.Parent         := tsLive;
  FSynEdit_VideoLive.Left           := 10;
  FSynEdit_VideoLive.Top            := 80;
  FSynEdit_VideoLive.Width          := 960;
  FSynEdit_VideoLive.Height         := 490;
  FSynEdit_VideoLive.Anchors        := [akLeft, akTop, akRight, akBottom];
  FSynEdit_VideoLive.Gutter.Visible := False;
  FSynEdit_VideoLive.Font.Name      := '宋体';
  FSynEdit_VideoLive.Font.Size      := 12;
  FSynEdit_VideoLive.RightEdge      := pnlVideoConv.Width;
  FSynEdit_VideoLive.ScrollBars     := ssVertical;
  FSynEdit_VideoLive.Highlighter    := FJSONHL;
  FSynEdit_VideoLive.ReadOnly       := True;

end;

{ 检查本机是否有 USB 摄像头 }
function TfrmFFUI.CheckUSBCamera: Boolean;
const
  IID_IPropertyBag: TGUID = '{55272A00-42CB-11CE-8135-00AA004BB851}';
var
  hr        : Integer;
  SysDevEnum: ICreateDevEnum;
  EnumCat   : IEnumMoniker;
  Moniker   : IMoniker;
  Fetched   : ULONG;
  PropBag   : IPropertyBag;
  strName   : OleVariant;
begin
  Result := False;

  hr := CocreateInstance(CLSID_SystemDeviceEnum, nil, CLSCTX_INPROC, IID_ICreateDevEnum, SysDevEnum);
  if hr <> S_OK then
    Exit;

  try
    Result := SysDevEnum.CreateClassEnumerator(CLSID_VideoInputDeviceCategory, EnumCat, 0) = S_OK;

    if Result then
    begin
      while (EnumCat.Next(1, Moniker, @Fetched) = S_OK) do
      begin
        Moniker.BindToStorage(nil, nil, IID_IPropertyBag, PropBag);
        PropBag.Read('FriendlyName', strName, nil);
        FstrUSBCameraFriendlyName := strName;
        Break;
      end;
    end;

  finally
    EnumCat    := nil;
    SysDevEnum := nil;
  end;
end;

procedure TfrmFFUI.FormCreate(Sender: TObject);
begin
  { 创建第三方控件 }
  FDOSCommand                := TDosCommand.Create(nil);
  FDOSCommand.OnNewLine      := DosCommandLine;
  FDOSCommand.OnCharDecoding := DosCommandLineUTF8Dec;
  FDOSCommand.OnTerminated   := DosCommandTerminated;
  CreateSynEdit;

  { 初始化变量 }
  FStatStyle             := ssBlank;
  FhPlayVideoWnd         := 0;
  pgcAll.ActivePageIndex := 0;

  { 加载系统参数 }
  LoadConfig;

  btnPlayUSBCamera.Enabled := CheckUSBCamera;
  dlgOpenVideoFile.Filter  := Ifthen(FlngUI = lngChinese, '视频文件(', 'Video file(') + c_strVideoFormat + ')|' + c_strVideoFormat;
end;

procedure TfrmFFUI.FormDestroy(Sender: TObject);
begin
  { 保存系统参数 }
  SaveConfig;

  { 销毁创建的第三方控件 }
  FDOSCommand.Free;
  FJSONHL.Free;
  FSynEdit_VideoLive.Free;
  FSynEdit_VideoCut.Free;
  FSynEdit_VideoMerge.Free;
  FSynEdit_VideoSplit.Free;
  FSynEdit_VideoConv.Free;
  FSynEdit_VideoInfo.Free;
end;

procedure TfrmFFUI.FormResize(Sender: TObject);
begin
  pgcAll.TabWidth := (Width - 40) div 8;

  if FhPlayVideoWnd <> 0 then
  begin
    SetWindowLong(FhPlayVideoWnd, GWL_STYLE, NativeInt($96000000));
    SetWindowLong(FhPlayVideoWnd, GWL_EXSTYLE, $00050000);
    SetWindowPos(FhPlayVideoWnd, pnlVideo.Handle, 0, 0, pnlVideo.Width, pnlVideo.Height, SWP_NOZORDER OR SWP_NOACTIVATE);
  end;
end;

{ Dos 命令行运行返回的字符串 }
procedure TfrmFFUI.DosCommandLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
  if FStatStyle = ssConv then
  begin
    FSynEdit_VideoConv.Lines.Insert(0, ANewLine);
  end
  else if FStatStyle = ssInfo then
  begin
    FSynEdit_VideoInfo.Lines.Add(ANewLine);
  end
  else if FStatStyle = ssSplit then
  begin
    if FVideoStyle <> vsConv then
      FSynEdit_VideoSplit.Lines.Add(ANewLine)
    else
      FSynEdit_VideoSplit.Lines.Insert(0, ANewLine);
  end
  else if FStatStyle = ssMerge then
  begin
    FSynEdit_VideoMerge.Lines.Insert(0, ANewLine);
  end
  else if FStatStyle = ssCut then
  begin
    FSynEdit_VideoCut.Lines.Insert(0, ANewLine);
  end
  else if FStatStyle = ssLive then
  begin
    FSynEdit_VideoLive.Lines.Insert(0, ANewLine);
  end;
end;

{ 使 DOS 命令行提示符支持 UTF8 编码，解决乱码问题 }
function TfrmFFUI.DosCommandLineUTF8Dec(ASender: TObject; ABuf: TStream): string;
var
  stream : TStringStream;
  pBytes : TBytes;
  iLength: Integer;
begin
  try
    stream := TStringStream.Create('', TEncoding.UTF8);
    try
      stream.LoadFromStream(ABuf);
      Result := stream.DataString;
    finally
      stream.Free;
    end;
  except
    iLength := ABuf.Size;
    SetLength(pBytes, iLength);
    ABuf.Read(pBytes, iLength);
    Result := TEncoding.ANSI.GetString(pBytes);
  end;
end;

{ 打开视频转换后的保存路径 }
procedure TfrmFFUI.OpenVideoConvPath;
var
  strSavePath: String;
begin
  if not chkConvOpenSavePath.Checked then
    Exit;

  strSavePath := Ifthen(chkConvSavePath.Checked, ExtractFilePath(srchbxSelectVideoFile.Text), srchbxVideoConvSavePath.Text);
  ShellExecute(0, 'open', 'explorer.exe', PChar(strSavePath), nil, SW_SHOWNORMAL);
end;

{ 打开视频分离后的保存路径 }
procedure TfrmFFUI.OpenVideoSplitPath;
var
  strSavePath: String;
begin
  if not chkSplitOpenSavePath.Checked then
    Exit;

  strSavePath := Ifthen(chkSplitSamePath.Checked, ExtractFilePath(srchbxSelectVideoFile.Text), srchbxSplitVideoSavePath.Text);
  ShellExecute(0, 'open', 'explorer.exe', PChar(strSavePath), nil, SW_SHOWNORMAL);
end;

{ 打开视频合并后的保存路径 }
procedure TfrmFFUI.OpenVideoMergePath;
var
  strSavePath: String;
begin
  if not chkMergeOpenSavePath.Checked then
    Exit;

  strSavePath := Ifthen(chkMergeSamePath.Checked, ExtractFilePath(lstMergeVideo.Items[0]), srchbxMergeVideoSavePath.Text);
  ShellExecute(0, 'open', 'explorer.exe', PChar(strSavePath), nil, SW_SHOWNORMAL);
end;

{ 打开截取后的保存路径 }
procedure TfrmFFUI.OpenVideoCutPath;
var
  strSavePath: String;
begin
  if not chkCutOpenSavePath.Checked then
    Exit;

  strSavePath := Ifthen(chkCutSamePath.Checked, ExtractFilePath(srchbxSelectVideoFile.Text), srchbxCutVideoSavePath.Text);
  ShellExecute(0, 'open', 'explorer.exe', PChar(strSavePath), nil, SW_SHOWNORMAL);
end;

{ 视频转换结束 }
procedure TfrmFFUI.FinishVideoConv;
begin
  FStatStyle                := ssBlank;
  btnVideoStartConv.Enabled := True;
  btnVideoStopConv.Enabled  := False;
  OpenVideoConvPath;
end;

{ 视频分割结束 }
procedure TfrmFFUI.FinishVideoSplit;
var
  strTempVideoCSVFileName   : String;
  strTempAudioCSVFileName   : String;
  strTempSubtitleCSVFileName: String;
  I                         : Integer;
  strSplit                  : TArray<string>;
begin
  { 获取视频流信息 }
  if FVideoStyle = vsVideo then
  begin
    lstSplitVideo.Clear;
    strTempVideoCSVFileName := TPath.GetTempPath + 'video.csv';
    try
      FSynEdit_VideoSplit.Lines.SaveToFile(strTempVideoCSVFileName);
      with TStringList.Create do
      begin
        LoadFromFile(strTempVideoCSVFileName);
        for I := 0 to Count - 1 do
        begin
          strSplit := Strings[I].Split([',']);
          lstSplitVideo.Items.Add(strSplit[1] + '/' + strSplit[2]);
        end;
        Free;
      end;
    finally
      FSynEdit_VideoSplit.Lines.Clear;
      DeleteFile(strTempVideoCSVFileName);
    end;
  end;

  { 获取音频流信息 }
  if FVideoStyle = vsAudio then
  begin
    lstSplitAudio.Clear;
    strTempAudioCSVFileName := TPath.GetTempPath + 'Audio.csv';
    try
      FSynEdit_VideoSplit.Lines.SaveToFile(strTempAudioCSVFileName);
      with TStringList.Create do
      begin
        LoadFromFile(strTempAudioCSVFileName);
        for I := 0 to Count - 1 do
        begin
          strSplit := Strings[I].Split([',']);
          lstSplitAudio.Items.Add(strSplit[1] + '/' + strSplit[2]);
        end;
        Free;
      end;
    finally
      FSynEdit_VideoSplit.Lines.Clear;
      DeleteFile(strTempAudioCSVFileName);
    end;
  end;

  { 获取字幕流信息 }
  if FVideoStyle = vsSubtitle then
  begin
    lstSplitSubtitle.Clear;
    strTempSubtitleCSVFileName := TPath.GetTempPath + 'Subtitle.csv';
    try
      FSynEdit_VideoSplit.Lines.SaveToFile(strTempSubtitleCSVFileName);
      with TStringList.Create do
      begin
        LoadFromFile(strTempSubtitleCSVFileName);
        for I := 0 to Count - 1 do
        begin
          strSplit := Strings[I].Split([',']);
          lstSplitSubtitle.Items.Add(strSplit[1] + '/' + strSplit[2]);
        end;
        Free;
      end;
    finally
      FSynEdit_VideoSplit.Lines.Clear;
      DeleteFile(strTempSubtitleCSVFileName);
    end;
    FStatStyle := ssBlank;
  end;

  { 视频分离结束 }
  if FVideoStyle = vsConv then
  begin
    btnVideoSplit.Enabled := True;

    { 删除临时的 CMD 文件 }
    DeleteFile(TPath.GetTempPath + 'split.cmd');

    { 打开分离后的保存路径 }
    OpenVideoSplitPath;
  end;
end;

{ 视频合并结束 }
procedure TfrmFFUI.FinishVideoMerge;
begin
  btnMerge.Enabled := True;

  { 删除临时文件 }
  DeleteFile(TPath.GetTempPath + 'merge.cmd');
  DeleteFile(TPath.GetTempPath + 'merge.mkv');

  { 打开合并后的保存路径 }
  OpenVideoMergePath;
end;

{ 视频截取结束 }
procedure TfrmFFUI.FinishVideoCut;
begin
  btnCut.Enabled := True;

  { 打开截取后的保存路径 }
  OpenVideoCutPath;
end;

{ 视频操作结束 }
procedure TfrmFFUI.DosCommandTerminated(Sender: TObject);
begin
  if FStatStyle = ssConv then
    { 视频转换结束 }
    FinishVideoConv
  else if FStatStyle = ssSplit then
    { 视频分离结束 }
    FinishVideoSplit
  else if FStatStyle = ssMerge then
    { 视频合并结束 }
    FinishVideoMerge
  else if FStatStyle = ssCut then
    { 视频截取结束 }
    FinishVideoCut
end;

{ Dos 命令行参数复制到剪切板 }
procedure TfrmFFUI.mniCopyDosCommandClick(Sender: TObject);
begin
  Clipboard.AsText := statInfo.SimpleText;
end;

{ 查询目录下的所有视频文件 }
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

{ 获取视频文件格式信息 }
procedure TfrmFFUI.GetVideoFileInfo(const strVideoFileName: string);
var
  strFFMPEGPath: string;
begin
  FStatStyle    := ssInfo;
  strFFMPEGPath := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  SetDllDirectory(PChar(strFFMPEGPath));
  FSynEdit_VideoInfo.Lines.Clear;
  { 仔细查看 TDOSCOMMAND 输出的 JSON，你会发现输出的 JSON 多了一行，是不规则的 JSON 字符串，是无法用 JSON 语法来解析的 }
  FDOSCommand.CommandLine := Format('"%s\ffprobe.exe" -hide_banner -v quiet -show_streams -print_format json "%s"', [strFFMPEGPath, strVideoFileName]);
  FDOSCommand.Execute;
  statInfo.SimpleText := FDOSCommand.CommandLine;
end;

{ 获取视频文件，视频流、音频流、字幕流信息 }
procedure TfrmFFUI.GetVideoSplitInfo(const strVideoFileName: string);
var
  strFFMPEGPath: string;
begin
  if FlngUI = lngChinese then
    lblVideoSplitTip.Caption := Format('%s 文件包含：', [ExtractFileName(strVideoFileName)])
  else
    lblVideoSplitTip.Caption := Format('%s Include：', [ExtractFileName(strVideoFileName)]);

  { 等待 FDosCommand 执行结束 }
  while True do
  begin
    Application.ProcessMessages;
    if not FDOSCommand.IsRunning then
      Break;
  end;

  FStatStyle    := ssSplit;
  FVideoStyle   := vsVideo;
  strFFMPEGPath := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  SetDllDirectory(PChar(strFFMPEGPath));

  { 获取视频流信息 }
  FDOSCommand.CommandLine := Format('"%s\ffprobe" -hide_banner -v quiet -show_streams -select_streams v -print_format csv "%s"', [strFFMPEGPath, strVideoFileName]);
  FDOSCommand.Execute;

  { 等待获取视频流结束 }
  while True do
  begin
    Application.ProcessMessages;
    if not FDOSCommand.IsRunning then
      Break;
  end;

  { 获取音频流信息 }
  FVideoStyle             := vsAudio;
  FDOSCommand.CommandLine := Format('"%s\ffprobe" -hide_banner -v quiet -show_streams -select_streams a -print_format csv "%s"', [strFFMPEGPath, strVideoFileName]);
  FDOSCommand.Execute;

  { 等待获取音频流结束 }
  while True do
  begin
    Application.ProcessMessages;
    if not FDOSCommand.IsRunning then
      Break;
  end;

  { 获取字幕流信息 }
  FVideoStyle             := vsSubtitle;
  FDOSCommand.CommandLine := Format('"%s\ffprobe" -hide_banner -v quiet -show_streams -select_streams s -print_format csv "%s"', [strFFMPEGPath, strVideoFileName]);
  FDOSCommand.Execute;
end;

{ 打开文件 }
procedure TfrmFFUI.mniOpenFileClick(Sender: TObject);
begin
  dlgOpenVideoFile.Filter := Ifthen(FlngUI = lngChinese, '视频文件(', 'Video file(') + c_strVideoFormat + ')|' + c_strVideoFormat;
  if not dlgOpenVideoFile.Execute then
    Exit;

  FFileStyle                 := fsFile;
  srchbxSelectVideoFile.Text := dlgOpenVideoFile.FileName;
  pgcAll.ActivePage          := tsInfo;

  { 获取视频文件格式信息 }
  GetVideoFileInfo(dlgOpenVideoFile.FileName);

  { 获取视频文件，视频流、音频流、字幕流信息 }
  GetVideoSplitInfo(dlgOpenVideoFile.FileName);

  lstFiles.Items.Add(dlgOpenVideoFile.FileName);
end;

{ 打开文件夹 }
procedure TfrmFFUI.mniOpenFolderClick(Sender: TObject);
var
  strFolder: String;
begin
  if not SelectDirectory(TransUI('选择一个目录，目录下包含视频文件'), TransUI('目录名称：'), strFolder) then
    Exit;

  srchbxSelectVideoFile.Text := strFolder;
  FindVideoFile(strFolder);
  FFileStyle := fsFolder;
end;

{ 打开网络视频流地址 }
procedure TfrmFFUI.mniOpenWebStreamClick(Sender: TObject);
var
  strWebStreamAddr: String;
begin
  strWebStreamAddr := 'http://ivi.bupt.edu.cn/hls/cctv3hd.m3u8';
  if not InputQuery(TransUI('网络视频地址：'), TransUI('地址：'), strWebStreamAddr) then
    Exit;

  srchbxSelectVideoFile.Text := strWebStreamAddr;
  FFileStyle                 := fsStream;
  pgcAll.ActivePage          := tsPlay;
  btnVideoPlayPlay.Click;
end;

procedure TfrmFFUI.srchbxMergeVideoSavePathInvokeSearch(Sender: TObject);
var
  strFolder: String;
begin
  if not SelectDirectory(TransUI('选择一个目录，目录下包含视频文件'), TransUI('目录名称：'), strFolder) then
    Exit;

  srchbxMergeVideoSavePath.Text := strFolder;
  SaveConfig;
end;

procedure TfrmFFUI.srchbxSelectVideoFileInvokeSearch(Sender: TObject);
var
  pt: TPoint;
begin
  GetCursorPos(pt);
  pmOpen.Popup(pt.x, pt.y);
end;

procedure TfrmFFUI.srchbxSplitVideoSavePathInvokeSearch(Sender: TObject);
var
  strSelectedFolder: String;
begin
  if not SelectDirectory(TransUI('选择保存视频截取结果目录：'), TransUI('选择目录：'), strSelectedFolder) then
    Exit;

  srchbxSplitVideoSavePath.Text := strSelectedFolder;
  SaveConfig;
end;

procedure TfrmFFUI.srchbxVideoConvSavePathInvokeSearch(Sender: TObject);
var
  strSelectedFolder: String;
begin
  if not SelectDirectory(TransUI('选择保存视频转换结果目录：'), TransUI('选择目录：'), strSelectedFolder) then
    Exit;

  srchbxVideoConvSavePath.Text := strSelectedFolder;
end;

{ ------------------------------------------------------------------------- 视频播放 ------------------------------------------------------------------------------- }

procedure TfrmFFUI.btnPlayUSBCameraClick(Sender: TObject);
var
  strPlayProgramPath: String;
begin
  strPlayProgramPath      := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  FDOSCommand.CommandLine := Format('"%s\ffplay" -f dshow -i video="%s"', [strPlayProgramPath, FstrUSBCameraFriendlyName]);
  FDOSCommand.Execute;
  statInfo.SimpleText       := FDOSCommand.CommandLine;
  tmrPlayVideo.Enabled      := True;
  btnVideoPlayPlay.Enabled  := False;
  btnVideoPlayPause.Enabled := True;
  btnVideoPlayStop.Enabled  := True;
end;

procedure TfrmFFUI.tmrPlayVideoTimer(Sender: TObject);
begin
  if rgPlayUI.ItemIndex = 0 then
    FhPlayVideoWnd := FindWindow('SDL_app', 'ffplay')
  else if rgPlayUI.ItemIndex = 1 then
    FhPlayVideoWnd := FindWindow('mpv', 'mpv')
  else if rgPlayUI.ItemIndex = 2 then
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

{ 播放视频 }
procedure TfrmFFUI.PlayVideoFile(const strVideoFileName: String);
const
  c_strPlayLibrary: array [0 .. 2] of String = ('video\ffmpeg', 'video\mpv', 'video\vlc');
var
  strPlayProgramPath: String;
begin
  strPlayProgramPath := ExtractFilePath(ParamStr(0)) + c_strPlayLibrary[rgPlayUI.ItemIndex];
  case rgPlayUI.ItemIndex of
    0:
      FDOSCommand.CommandLine := Format('"%s\ffplay.exe" -hide_banner -window_title ffplay "%s"', [strPlayProgramPath, strVideoFileName]);
    1:
      FDOSCommand.CommandLine := Format('"%s\mpv.exe" --title=mpv "%s"', [strPlayProgramPath, strVideoFileName]);
    2:
      FDOSCommand.CommandLine := Format('"%s\vlc.exe" --no-qt-name-in-title --qt-minimal-view --no-qt-system-tray "%s"', [strPlayProgramPath, strVideoFileName]);
  end;
  SetDllDirectory(PChar(strPlayProgramPath));
  FDOSCommand.Execute;
  statInfo.SimpleText       := FDOSCommand.CommandLine;
  tmrPlayVideo.Enabled      := True;
  btnVideoPlayPlay.Enabled  := False;
  btnVideoPlayPause.Enabled := True;
  btnVideoPlayStop.Enabled  := True;
end;

procedure TfrmFFUI.btnVideoPlayPlayClick(Sender: TObject);
begin
  if srchbxSelectVideoFile.Text = '' then
  begin
    MessageBox(Handle, PChar(TransUI('请先选择打开一个视频文件，再播放')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    srchbxSelectVideoFile.SetFocus;
    Exit;
  end;

  if FhPlayVideoWnd <> 0 then
  begin
    MessageBox(Handle, PChar(TransUI('视频正在播放，请停止后，再次播放')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    Exit;
  end;

  FStatStyle := ssPaly;
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

procedure TfrmFFUI.btnVideoPlayPauseClick(Sender: TObject);
begin
  if FhPlayVideoWnd = 0 then
    Exit;

  if rgPlayUI.ItemIndex <> 2 then
    SendPlayUIKey(FhPlayVideoWnd, 'p')
  else
    SendPlayUIKey_vlc(FhPlayVideoWnd, Char(VK_SPACE));
end;

procedure TfrmFFUI.btnVideoPlayStopClick(Sender: TObject);
begin
  if FhPlayVideoWnd = 0 then
    Exit;

  if rgPlayUI.ItemIndex <> 2 then
    SendPlayUIKey(FhPlayVideoWnd, 'q')
  else
    SendPlayUIKey_vlc(FhPlayVideoWnd, 's');

  btnVideoPlayPlay.Enabled  := True;
  btnVideoPlayPause.Enabled := False;
  btnVideoPlayStop.Enabled  := False;
  FhPlayVideoWnd            := 0;
end;

{ ------------------------------------------------------------------------- 视频转换 ------------------------------------------------------------------------------- }

procedure TfrmFFUI.btnAddVideoFileClick(Sender: TObject);
begin
  if not dlgOpenVideoFile.Execute then
    Exit;

  lstFiles.Items.Add(dlgOpenVideoFile.FileName);
end;

procedure TfrmFFUI.btnAddFolderClick(Sender: TObject);
var
  strFolder: String;
begin
  if not SelectDirectory(TransUI('选择一个目录，目录下包含视频文件'), TransUI('目录名称：'), strFolder) then
    Exit;

  FindVideoFile(strFolder);
end;

procedure TfrmFFUI.btnDelVideoFileClick(Sender: TObject);
begin
  if lstFiles.ItemIndex <> -1 then
    lstFiles.DeleteSelected;
end;

procedure TfrmFFUI.btnVideoConvParamClick(Sender: TObject);
begin
  pgcAll.ActivePage := tsConfig;
end;

{ 查找相同文件的字幕文件 }
function TfrmFFUI.FindSameNameSubtitle(const strVideoFileName: string): String;
var
  strSubtitleFileName: String;
begin
  Result := '';

  strSubtitleFileName := ChangeFileExt(strVideoFileName, '.srt');
  if FileExists(strSubtitleFileName) then
  begin
    Result := Format(' -i "%s" -c:s copy ', [strSubtitleFileName]);
  end
  else
  begin
    strSubtitleFileName := ChangeFileExt(strVideoFileName, '.ass');
    if FileExists(strSubtitleFileName) then
    begin
      Result := Format(' -i "%s" -c:s copy ', [strSubtitleFileName]);
    end;
  end;
end;

{ 开始视频转换 }
procedure TfrmFFUI.btnVideoStartConvClick(Sender: TObject);
const
  c_strVideoSize           = ' -s %sx%s ';
  c_strVideoInfo           = ' -metadata "title=%s" -metadata "artist=%s" -metadata "genre=%s" -metadata "comment=%s" ';
  c_strFFMPEGConv_CPU_H264 = '"%s\ffmpeg" -hide_banner -i "%s" %s -c:v libx264    %s %s -y "%s"';
  c_strFFMPEGConv_CPU_H265 = '"%s\ffmpeg" -hide_banner -i "%s" %s -c:v libx265    %s %s -y "%s"';
  c_strFFMPEGConv_CPU_FFLV = '"%s\ffmpeg" -hide_banner -i "%s" %s -c:v flv        %s %s -y "%s"';
  c_strFFMPEGConv_GPU_H264 = '"%s\ffmpeg" -hide_banner -i "%s" %s -c:v h264_nvenc -profile:v main -level:v 4.2 -pix_fmt yuv420p %s %s -y "%s"';
  c_strFFMPEGConv_GPU_H265 = '"%s\ffmpeg" -hide_banner -i "%s" %s -c:v nvenc_hevc %s %s -y "%s"';
var
  strFFMPEGPath      : String;
  strFFMPGCommandLine: String;
  strInputFile       : string;
  strOutPutFile      : string;
  I                  : Integer;
  strTempCMDFileName : String;
  strExtFileName     : String;
  strVideoSize       : String;
  strVideoInfo       : String;
  lstCMD             : TStringList;
  strSubtitle        : String;
begin
  if lstFiles.Count <= 0 then
  begin
    MessageBox(Handle, PChar(TransUI('必须先添加视频文件再转换')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    Exit;
  end;

  strSubtitle  := '';
  strVideoInfo := Format(c_strVideoInfo, [edtTitle.Text, edtArtist.Text, edtGenre.Text, edtComment.Text]);
  if chkVideoSize.Checked then
    strVideoSize := ''
  else
    strVideoSize := Format(c_strVideoSize, [edtVideoWidth.Text, edtVideoHeight.Text]);

  strExtFileName := Ifthen(cbbConv.ItemIndex <> 2, '.mkv', '.flv');
  strFFMPEGPath  := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  lstCMD         := TStringList.Create;
  try
    for I := 0 to lstFiles.Count - 1 do
    begin
      Application.ProcessMessages;
      strInputFile := lstFiles.Items.Strings[I];
      if chkConvSavePath.Checked then
      begin
        strOutPutFile := ChangeFileExt(strInputFile, strExtFileName);
        if SameText(strOutPutFile, strInputFile) then
          strOutPutFile := strInputFile + strExtFileName;
      end
      else
      begin
        if RightStr(srchbxVideoConvSavePath.Text, 1) <> '\' then
          strOutPutFile := srchbxVideoConvSavePath.Text + '\' + ChangeFileExt(ExtractFileName(strInputFile), strExtFileName)
        else
          strOutPutFile := srchbxVideoConvSavePath.Text + ChangeFileExt(ExtractFileName(strInputFile), strExtFileName);
        if not System.SysUtils.DirectoryExists(ExtractFileDir(strOutPutFile)) then
          System.SysUtils.ForceDirectories(ExtractFileDir(strOutPutFile));
      end;

      { 查找相同文件的字幕文件 }
      if chkConvAutoSearchSubtitle.Checked then
        strSubtitle := FindSameNameSubtitle(strInputFile);

      case cbbConv.ItemIndex of
        0:
          if rgUseGPU.ItemIndex = 1 then
            strFFMPGCommandLine := Format(c_strFFMPEGConv_CPU_H264, [strFFMPEGPath, strInputFile, strSubtitle, strVideoSize, strVideoInfo, strOutPutFile])
          else
            strFFMPGCommandLine := Format(c_strFFMPEGConv_GPU_H264, [strFFMPEGPath, strInputFile, strSubtitle, strVideoSize, strVideoInfo, strOutPutFile]);
        1:
          if rgUseGPU.ItemIndex = 1 then
            strFFMPGCommandLine := Format(c_strFFMPEGConv_CPU_H265, [strFFMPEGPath, strInputFile, strSubtitle, strVideoSize, strVideoInfo, strOutPutFile])
          else
            strFFMPGCommandLine := Format(c_strFFMPEGConv_GPU_H265, [strFFMPEGPath, strInputFile, strSubtitle, strVideoSize, strVideoInfo, strOutPutFile]);
        2:
          strFFMPGCommandLine := Format(c_strFFMPEGConv_CPU_FFLV, [strFFMPEGPath, strInputFile, strSubtitle, strVideoSize, strVideoInfo, strOutPutFile]);
      end;

      lstCMD.Add(strFFMPGCommandLine);
    end;

    strTempCMDFileName := TPath.GetTempPath + 'conv.cmd';
    lstCMD.SaveToFile(strTempCMDFileName);
    FDOSCommand.CommandLine := strTempCMDFileName;
    FDOSCommand.Execute;
    FStatStyle := ssConv;
    FSynEdit_VideoConv.Lines.Clear;
    btnVideoStartConv.Enabled := False;
    btnVideoStopConv.Enabled  := True;
    statInfo.SimpleText       := strTempCMDFileName;
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
procedure TfrmFFUI.KillProcessOfProcessName(const strProcessName: string);
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
  KillProcessOfProcessName(ExtractFilePath(ParamStr(0)) + 'video\ffmpeg\ffmpeg.exe');

  FStatStyle                := ssBlank;
  btnVideoStartConv.Enabled := True;
  btnVideoStopConv.Enabled  := False;
  FDOSCommand.Stop;
end;

{ ------------------------------------------------------------------------- 视频分离 ------------------------------------------------------------------------------- }

procedure TfrmFFUI.btnVideoSplitClick(Sender: TObject);
var
  strFFMPEGPath     : String;
  strVideoFileName  : String;
  strOutputFileName : String;
  strTempCMDFileName: String;
  I                 : Integer;
  intIndex          : Integer;
  strSavePath       : String;
begin
  if lstSplitVideo.Count = 0 then
  begin
    MessageBox(Handle, PChar(TransUI('必须先打开一个视频文件，再进行视频分离')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    srchbxSelectVideoFile.SetFocus;
    Exit;
  end;

  if Trim(srchbxSelectVideoFile.Text) = '' then
  begin
    MessageBox(Handle, PChar(TransUI('必须先打开一个视频文件，再进行视频分离')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    srchbxSelectVideoFile.SetFocus;
    Exit;
  end;

  btnVideoSplit.Enabled := False;
  FStatStyle            := ssSplit;
  FVideoStyle           := vsConv;
  strVideoFileName      := srchbxSelectVideoFile.Text;
  strFFMPEGPath         := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  SetDllDirectory(PChar(strFFMPEGPath));

  { 保存目录 }
  if chkSplitSamePath.Checked then
    strSavePath := ExtractFilePath(srchbxSelectVideoFile.Text)
  else
    strSavePath := srchbxSplitVideoSavePath.Text;
  if RightStr(strSavePath, 1) <> '\' then
    strSavePath := strSavePath + '\';

  { 生成 CMD 文件 }
  strTempCMDFileName := TPath.GetTempPath + 'split.cmd';
  with TStringList.Create do
  begin
    { 分离出视频 命令行 }
    for I := 0 to lstSplitVideo.Count - 1 do
    begin
      intIndex          := StrToInt(lstSplitVideo.Items.Strings[I].Split(['/'])[0]);
      strOutputFileName := strSavePath + ChangeFileExt(ExtractFileName(srchbxSelectVideoFile.Text), '') + Format('_%0.2d', [intIndex]) + '.' + 'mp4';
      Add(Format('"%s\ffmpeg.exe" -hide_banner -i "%s" -c copy -map 0:%d -y "%s"', [strFFMPEGPath, strVideoFileName, intIndex, strOutputFileName]));
    end;

    { 分离出音频 命令行 }
    for I := 0 to lstSplitAudio.Count - 1 do
    begin
      intIndex          := StrToInt(lstSplitAudio.Items.Strings[I].Split(['/'])[0]);
      strOutputFileName := strSavePath + ChangeFileExt(ExtractFileName(srchbxSelectVideoFile.Text), '') + Format('_%0.2d', [intIndex]) + '.' + lstSplitAudio.Items.Strings[I].Split(['/'])[1];
      Add(Format('"%s\ffmpeg.exe" -hide_banner -i "%s" -c copy -map 0:%d -y "%s"', [strFFMPEGPath, strVideoFileName, intIndex, strOutputFileName]));
    end;

    { 分离出字幕 命令行 }
    for I := 0 to lstSplitSubtitle.Count - 1 do
    begin
      intIndex          := StrToInt(lstSplitSubtitle.Items.Strings[I].Split(['/'])[0]);
      strOutputFileName := strSavePath + ChangeFileExt(ExtractFileName(srchbxSelectVideoFile.Text), '') + Format('_%0.2d', [intIndex]) + '.' + lstSplitSubtitle.Items.Strings[I].Split(['/'])[1];
      Add(Format('"%s\ffmpeg.exe" -hide_banner -i "%s" -c copy -map 0:%d -y "%s"', [strFFMPEGPath, strVideoFileName, intIndex, strOutputFileName]));
    end;

    SaveToFile(strTempCMDFileName);
    Free;
  end;

  { 执行 CMD 文件，进行视频分离 }
  FDOSCommand.CommandLine := strTempCMDFileName;
  FDOSCommand.Execute;
  statInfo.SimpleText := FDOSCommand.CommandLine;
end;

{ ------------------------------------------------------------------------- 视频合并 ------------------------------------------------------------------------------- }
procedure TfrmFFUI.btnMergeAudioAddClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  begin
    Filter := Ifthen(FlngUI = lngChinese, '音频流(', 'Audio file(') + c_strAudioFormat + ')|' + c_strAudioFormat;
    if Execute() then
    begin
      lstMergeAudio.Items.Add(FileName);
    end;
    Free;
  end;
end;

procedure TfrmFFUI.btnMergeAudioDelClick(Sender: TObject);
begin
  lstMergeAudio.DeleteSelected;
end;

procedure TfrmFFUI.btnMergeVideoAddClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  begin
    Filter := Ifthen(FlngUI = lngChinese, '视频流(', 'Video file(') + c_strVideoFormat + ')|' + c_strVideoFormat;
    if Execute() then
    begin
      lstMergeVideo.Items.Add(FileName);
    end;
    Free;
  end;
end;

procedure TfrmFFUI.btnMergeVideoDelClick(Sender: TObject);
begin
  lstMergeVideo.DeleteSelected;
end;

procedure TfrmFFUI.btnMergeSubtitleAddClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  begin
    Filter := Ifthen(FlngUI = lngChinese, '字幕流(', 'Subtitle file(') + c_strSubtitleFormat + ')|' + c_strSubtitleFormat;
    if Execute() then
    begin
      lstMergeSubtitle.Items.Add(FileName);
    end;
    Free;
  end;
end;

procedure TfrmFFUI.btnMergeSubtitleDelClick(Sender: TObject);
begin
  lstMergeSubtitle.DeleteSelected;
end;

procedure TfrmFFUI.srchbxWatermarkInvokeSearch(Sender: TObject);
begin
  with TOpenPictureDialog.Create(nil) do
  begin
    Filter := Ifthen(FlngUI = lngChinese, '图片文件(*.BMP;*.JPG;*.PNG)|*.BMP;*.JPG;*.PNG', 'Image file(*.BMP;*.JPG;*.PNG)|*.BMP;*.JPG;*.PNG');
    if Execute() then
    begin
      srchbxWatermark.Text := FileName;
    end;
    Free;
  end;
end;

procedure TfrmFFUI.btnMergeClick(Sender: TObject);
var
  I                    : Integer;
  strVideoStreamFile   : String;
  strVideoStreamCopy   : String;
  strAudioStreamFile   : String;
  strAudioStreamCopy   : String;
  strSubtitleStreamFile: String;
  strSubtitleStreamCopy: String;
  strFFMPEGPath        : String;
  strOutFileName       : String;
  strWaterMark         : String;
  strMergeCMDFileName  : String;
  strTempVideoFileName : string;
begin
  if (lstMergeVideo.Count = 0) and (lstMergeAudio.Count = 0) then
  begin
    MessageBox(Handle, PChar(TransUI('必须先打开一个视频文件或多个音频，再进行合并')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    lstMergeVideo.SetFocus;
    Exit;
  end;

  { 视频输入 }
  for I := 0 to lstMergeVideo.Count - 1 do
  begin
    strVideoStreamFile := strVideoStreamFile + ' -i "' + lstMergeVideo.Items[I] + '"';
    strVideoStreamCopy := strVideoStreamCopy + ' -vcodec copy ';
  end;

  { 音频输入 }
  for I := 0 to lstMergeAudio.Count - 1 do
  begin
    strAudioStreamFile := strAudioStreamFile + ' -i "' + lstMergeAudio.Items[I] + '"';
    strAudioStreamCopy := strAudioStreamCopy + ' -acodec copy ';
  end;

  { 字幕输入 }
  for I := 0 to lstMergeSubtitle.Count - 1 do
  begin
    strSubtitleStreamFile := strSubtitleStreamFile + ' -i "' + lstMergeSubtitle.Items[I] + '"';
    strSubtitleStreamCopy := strSubtitleStreamCopy + ' -scodec copy ';
  end;

  { 有无水印 }
  if chkAddWaterMark.Checked then
  begin
    if (Trim(srchbxWatermark.Text) <> '') and (Trim(edtWatchMarkLeftValue.Text) <> '') and (Trim(edtWatchMarkTopValue.Text) <> '') then
    begin
      strWaterMark := ' -i "' + srchbxWatermark.Text + '" -filter_complex “overlay=' + edtWatchMarkLeftValue.Text + ':' + edtWatchMarkTopValue.Text + '” '
    end
    else
    begin
      MessageBox(Handle, PChar(TransUI('水印文件名不能为空，并且坐标不能为空')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
      Exit;
    end;
  end;

  strMergeCMDFileName  := TPath.GetTempPath + 'merge.cmd';
  strTempVideoFileName := TPath.GetTempPath + 'merge.mkv';
  strOutFileName       := Ifthen(chkMergeSamePath.Checked, ExtractFilePath(lstMergeVideo.Items[0]), srchbxMergeVideoSavePath.Text) + ChangeFileExt(ExtractFileName(lstMergeVideo.Items[0]), '') + '.mkv';
  strFFMPEGPath        := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  with TStringList.Create do
  begin
    if strWaterMark <> '' then
    begin
      { 有水印 }
      Add(Format('"%s\ffmpeg" -y %s %s %s %s %s %s "%s"', [strFFMPEGPath, strVideoStreamFile, strAudioStreamFile, strSubtitleStreamFile, strVideoStreamCopy, strAudioStreamCopy, strSubtitleStreamCopy, strTempVideoFileName]));
      Add(Format('"%s\ffmpeg" -y -i "%s" -i "%s" -filter_complex "overlay=%s:%s" "%s"', [strFFMPEGPath, strTempVideoFileName, srchbxWatermark.Text, edtWatchMarkLeftValue.Text, edtWatchMarkTopValue.Text, strOutFileName]));
    end
    else
    begin
      { 无水印 }
      Add(Format('"%s\ffmpeg" -y %s %s %s %s %s %s "%s"', [strFFMPEGPath, strVideoStreamFile, strAudioStreamFile, strSubtitleStreamFile, strVideoStreamCopy, strAudioStreamCopy, strSubtitleStreamCopy, strOutFileName]));
    end;
    SaveToFile(strMergeCMDFileName);
    Free;
  end;

  FDOSCommand.CommandLine := strMergeCMDFileName;
  FDOSCommand.Execute;
  FStatStyle := ssMerge;
  FSynEdit_VideoMerge.Clear;
  btnMerge.Enabled := False;
end;

procedure TfrmFFUI.btnConnectMulVideoClick(Sender: TObject);
var
  I                  : Integer;
  strFFMPEGPath      : String;
  strMergeCMDFileName: String;
  strMulVideo        : String;
  strOutFileName     : String;
begin
  if (lstMergeVideo.Count <= 1) then
  begin
    MessageBox(Handle, PChar(TransUI('必须先添加多个视频文件，再进行连接')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    lstMergeVideo.SetFocus;
    Exit;
  end;

  strFFMPEGPath       := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  strOutFileName      := Ifthen(chkMergeSamePath.Checked, ExtractFilePath(lstMergeVideo.Items[0]), srchbxMergeVideoSavePath.Text) + ChangeFileExt(ExtractFileName(lstMergeVideo.Items[0]), '') + '.mkv';
  strMergeCMDFileName := TPath.GetTempPath + 'merge.cmd';
  with TStringList.Create do
  begin
    for I := 0 to lstMergeVideo.Count - 1 do
    begin
      Add(Format('"%s\ffmpeg" -y -i "%s" -c copy -bsf:v h264_mp4toannexb -f mpegts "%s\%02d.ts"', [strMergeCMDFileName, lstMergeVideo.Items[I], strFFMPEGPath, I + 100]));
      strMulVideo := strMulVideo + '|' + Format('%02d.ts', [I + 100]);
    end;
    strMulVideo := RightStr(strMulVideo, Length(strMulVideo) - 1);
    Add(Format('"%s\ffmpeg" -y -i "concat:%s" -acodec copy -vcodec copy -absf aac_adtstoasc %s', [strFFMPEGPath, strMulVideo, strOutFileName]));

    SaveToFile(strMergeCMDFileName);
    Free;
  end;

  FDOSCommand.CommandLine := strMergeCMDFileName;
  FDOSCommand.Execute;
  FStatStyle := ssMerge;
  FSynEdit_VideoMerge.Clear;
  btnMerge.Enabled := False;
end;

{ ------------------------------------------------------------------------- 视频截取 ------------------------------------------------------------------------------- }

procedure TfrmFFUI.rgCutClick(Sender: TObject);
begin
  chkCutToImage.Visible := rgCut.ItemIndex = 1;
  grpCutToImage.Visible := Boolean(Ifthen(rgCut.ItemIndex = 1, Integer(chkCutToImage.Checked), 0));
end;

procedure TfrmFFUI.chkCutToImageClick(Sender: TObject);
begin
  grpCutToImage.Visible := chkCutToImage.Checked;
end;

procedure TfrmFFUI.chkCutSamePathClick(Sender: TObject);
begin
  lblCutVideoSavePath.Visible    := not chkCutSamePath.Checked;
  srchbxCutVideoSavePath.Visible := not chkCutSamePath.Checked;
end;

procedure TfrmFFUI.btnCutClick(Sender: TObject);
const
  arrSaveImageType: array [0 .. 2] of string = ('bmp', 'jpg', 'png');
var
  strStartTime, strEndTime: String;
  strCut                  : String;
  strFFMPEGPath           : String;
  strOutPathName          : String;
  strOutFileName          : String;
begin
  if FFileStyle <> fsFile then
  begin
    MessageBox(Handle, PChar(TransUI('必须先打开一个视频文件')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    srchbxSelectVideoFile.SetFocus;
    Exit;
  end;

  if (Trim(srchbxSelectVideoFile.Text) = '') then
  begin
    MessageBox(Handle, PChar(TransUI('必须先打开一个视频文件')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    srchbxSelectVideoFile.SetFocus;
    Exit;
  end;

  if (Trim(edtCutStartTime.Text) = '') or (Trim(edtCutEndTime.Text) = '') then
  begin
    MessageBox(Handle, PChar(TransUI('起始/结束时间不能为空')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    edtCutStartTime.SetFocus;
    Exit;
  end;

  strStartTime   := edtCutStartTime.Text;
  strEndTime     := edtCutEndTime.Text;
  strFFMPEGPath  := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  strOutPathName := Ifthen(chkCutSamePath.Checked, ExtractFilePath(srchbxSelectVideoFile.Text), srchbxCutVideoSavePath.Text);
  if RightStr(strOutPathName, 1) <> '\' then
    strOutPathName := strOutPathName + '\';

  if rgCut.ItemIndex = 0 then
  begin
    strCut := Format('"%s\ffmpeg" -y -ss %s -i "%s" -to %s -c:v copy -c:a copy "%s"', [strFFMPEGPath, strStartTime, srchbxSelectVideoFile.Text, strEndTime, strOutPathName + ChangeFileExt(ExtractFileName(srchbxSelectVideoFile.Text), '') + '.cut.' + ExtractFileExt(srchbxSelectVideoFile.Text)]);
  end
  else if rgCut.ItemIndex = 1 then
  begin
    if not chkCutToImage.Checked then
    begin
      strCut := Format('"%s\ffmpeg" -y -ss %s -i "%s" -to %s -c:v copy -an "%s"', [strFFMPEGPath, strStartTime, srchbxSelectVideoFile.Text, strEndTime, strOutPathName + ChangeFileExt(ExtractFileName(srchbxSelectVideoFile.Text), '') + '.cut.' + ExtractFileExt(srchbxSelectVideoFile.Text)]);
    end
    else
    begin
      strCut := Format('"%s\ffmpeg" -y -ss %s -i "%s" -to %s "%s\%s.%s"', [strFFMPEGPath, strStartTime, srchbxSelectVideoFile.Text, strEndTime, strOutPathName, '%05d', arrSaveImageType[cbbCutImage.ItemIndex]]);
    end;
  end
  else if rgCut.ItemIndex = 2 then
  begin
    strOutFileName := strOutPathName + ChangeFileExt(ExtractFileName(srchbxSelectVideoFile.Text), '') + '.cut.' + lstSplitAudio.Items[0].Split(['/'])[1];
    strCut         := Format('"%s\ffmpeg" -y -ss %s -i "%s" -to %s -c:a copy -vn "%s"', [strFFMPEGPath, strStartTime, srchbxSelectVideoFile.Text, strEndTime, strOutFileName]);
  end;

  FDOSCommand.CommandLine := strCut;
  FDOSCommand.Execute;
  FStatStyle := ssCut;
  FSynEdit_VideoCut.Clear;
  btnCut.Enabled := False;
end;

{ ------------------------------------------------------------------------- 视频直播 ------------------------------------------------------------------------------- }

procedure TfrmFFUI.btnLiveClick(Sender: TObject);
var
  strFFMPEGPath: String;
  strLive      : String;
begin
  { 合法性检查 }
  if (rgLive.ItemIndex = 0) and (Trim(srchbxSelectVideoFile.Text) = '') then
  begin
    MessageBox(Handle, PChar(TransUI('必须先打开一个视频文件')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    srchbxSelectVideoFile.SetFocus;
    Exit;
  end;

  if Trim(edtLiveIP.Text) = '' then
  begin
    MessageBox(Handle, PChar(TransUI('直播推送地址不能为空')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    edtLiveIP.SetFocus;
    Exit;
  end;

  { 获取推送方式 }
  strFFMPEGPath := ExtractFilePath(ParamStr(0)) + 'video\ffmpeg';
  if rgLive.ItemIndex = 0 then
  begin
    if FFileStyle = fsFile then
    begin
      strLive := Format('"%s\ffmpeg" -re -i "%s" -c:v libx264 -c:a aac -f flv %s', [strFFMPEGPath, srchbxSelectVideoFile.Text, edtLiveIP.Text]);
    end;
  end
  else if rgLive.ItemIndex = 1 then
  begin
    if FstrUSBCameraFriendlyName <> '' then
    begin
      strLive := Format('"%s\ffmpeg" -f dshow   -i video="%s" -vcodec libx264 -preset:v ultrafast -tune:v zerolatency -f flv %s', [strFFMPEGPath, FstrUSBCameraFriendlyName, edtLiveIP.Text]);
    end
    else
    begin
      MessageBox(Handle, PChar(TransUI('本机没有发现任何 USB 摄像头')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
      Exit;
    end;
  end
  else if rgLive.ItemIndex = 2 then
  begin
    strLive := Format('"%s\ffmpeg" -f gdigrab   -i desktop    -vcodec libx264 -preset:v ultrafast -tune:v zerolatency -f flv %s', [strFFMPEGPath, edtLiveIP.Text]);
  end
  else if rgLive.ItemIndex = 3 then
  begin
    if FFileStyle = fsStream then
    begin
      strLive := Format('"%s\ffmpeg" -f dshow   -i "%s"       -vcodec libx264 -preset:v ultrafast -tune:v zerolatency -f flv %s', [strFFMPEGPath, srchbxSelectVideoFile.Text, edtLiveIP.Text]);
    end;
  end;

  { 直播推送 }
  FDOSCommand.CommandLine := strLive;
  FDOSCommand.Execute;
  FStatStyle := ssLive;
  FSynEdit_VideoLive.Clear;
  btnLive.Enabled := False;
end;

end.
