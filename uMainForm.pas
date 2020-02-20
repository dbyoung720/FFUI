unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.TlHelp32, Winapi.PsAPI, Winapi.ShellAPI, Winapi.ShlObj, Winapi.ActiveX, System.SysUtils, System.StrUtils, System.Variants, System.Classes, System.IniFiles, System.IOUtils, System.Types, System.Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Clipbrd, Vcl.FileCtrl,
  {第三方控件}
  SynEdit, SynHighlighterJSON, DosCommand, uProcessAPI, System.ImageList,
  Vcl.ImgList;

type
  { 打开文件方式：文件/文件夹/网络视频流地址 }
  TFileStyle = (fsFile, fsFolder, fsStream);

  { 视频操作状态 }
  TStatStyle = (ssBlank, ssInfo, ssPaly, ssConv, ssSplit, ssMerge, ssLine);

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
    pnlWeb: TPanel;
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
    chkSplitPath: TCheckBox;
    lblSplitPath: TLabel;
    srchbxVideoConvSavePath: TSearchBox;
    srchbxSplitVideoSavePath: TSearchBox;
    lnklblHelpAccelGPU: TLinkLabel;
    rgLanguageUI: TRadioGroup;
    ilpgc: TImageList;
    tsCut: TTabSheet;
    chkConvOpenSavePath: TCheckBox;
    chkSplitOpenSavePath: TCheckBox;
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
    procedure btnSaveVideoPathClick(Sender: TObject);
    procedure chkSplitPathClick(Sender: TObject);
    procedure btnSplitPathClick(Sender: TObject);
    procedure lnklblHelpAccelGPULinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
    procedure rgLanguageUIClick(Sender: TObject);
    procedure btnVideoSplitClick(Sender: TObject);
    procedure chkConvOpenSavePathClick(Sender: TObject);
  private
    FlngUI             : TLangUI;
    FDOSCommand        : TDosCommand;
    FSynEdit_VideoInfo : TSynEdit;
    FSynEdit_VideoConv : TSynEdit;
    FSynEdit_VideoSplit: TSynEdit;
    FJSONHL            : TSynJSONSyn;
    FFileStyle         : TFileStyle;
    FVideoStyle        : TVideoStyle;
    FhPlayVideoWnd     : HWND;
    FStatStyle         : TStatStyle;
    FbLoadConfig       : Boolean;
    { 更改界面语言 }
    procedure ChangeLanguageUI;
    procedure ChangeLanguageChinese;
    procedure ChangeLanguageEnglish;
    function TransUI(const strLang: string): String;
    { 创建语法高亮的 SynEdit 控件 }
    procedure CreateSynEdit;
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
    { 打开视频转换后的保存目录 }
    procedure OpenVideoConvPath;
    { 打开视频分离后的保存目录 }
    procedure OpenVideoSplitPath;
  end;

var
  frmFFUI: TfrmFFUI;

implementation

{$R *.dfm}

const
  c_strMsgTitle: PChar = '系统提示：';

function TfrmFFUI.TransUI(const strLang: string): String;
begin
  if FlngUI = lngEnglish then
  begin
    if SameText(strLang, String(c_strMsgTitle)) then
      Result := 'System Information：'
    else if SameText(strLang, '视频剪辑信息不允许为空，请输入正确的值') then
      Result := 'Video Info is not null, must be input'
    else if SameText(strLang, '必须输入正确视频的宽和高') then
      Result := 'Must be intput video width/height'
    else if SameText(strLang, '必须选择一个目录，来保存转换后的视频') then
      Result := 'Must be select a folder, save convert'
    else if SameText(strLang, '必须选择一个目录，来保存分离的视频') then
      Result := 'Must be select a folder, save split'
    else if SameText(strLang, '选择保存视频转换结果目录：') then
      Result := 'select a folder, save convert：'
    else if SameText(strLang, '选择目录：') then
      Result := 'select folder：'
    else if SameText(strLang, '选择一个目录，目录下包含视频文件') then
      Result := 'select a folder, the folder contains video'
    else if SameText(strLang, '目录名称：') then
      Result := 'Folder name：'
    else if SameText(strLang, '网络视频地址：') then
      Result := 'Web stream addr：'
    else if SameText(strLang, '地址：') then
      Result := 'Addr：'
    else if SameText(strLang, '请先选择打开一个视频文件，再播放') then
      Result := 'Please select a video file before playing'
    else if SameText(strLang, '视频正在播放，请停止后，再次播放') then
      Result := 'Video is playing, please stop and play again'
    else if SameText(strLang, '选择保存视频转换结果目录：') then
      Result := 'Select video save folder：'
    else if SameText(strLang, '必须先添加视频文件再转换') then
      Result := 'Video files must be added before conversion'
    else if SameText(strLang, '必须先打开一个视频文件，再进行视频分离') then
      Result := 'A video file must be opened before video split'
  end
  else
  begin
    Result := strLang;
  end;
end;

procedure TfrmFFUI.ChangeLanguageChinese;
begin
  mniOpenFile.Caption       := '打开文件...';
  mniOpenFolder.Caption     := '打开文件夹...';
  mniOpenWebStream.Caption  := '打开网络串流...';
  mniCopyDosCommand.Caption := '复制到剪切板';

  lblVideoFile.Caption := '打开文件/文件夹/网络串流：';
  tsInfo.Caption       := '信息';
  tsPlay.Caption       := '播放';
  tsConv.Caption       := '转换';
  tsSplit.Caption      := '分离';
  tsMerge.Caption      := '合并';
  tsCut.Caption        := '截取';
  tsLive.Caption       := '直播';
  tsConfig.Caption     := '配置';

  btnVideoPlayPlay.Caption  := '播放';
  btnVideoPlayPause.Caption := '暂停';
  btnVideoPlayStop.Caption  := '停止';

  btnAddVideoFile.Caption   := '添加文件';
  btnAddFolder.Caption      := '添加文件夹';
  btnDelVideoFile.Caption   := '删除';
  btnVideoConvParam.Caption := '参数配置';
  btnVideoStartConv.Caption := '转换';
  btnVideoStopConv.Caption  := '停止转换';

  lblVideoSplitTip.Caption      := '此文件包含：';
  lblVidoeSplitVideo.Caption    := '视频流：';
  lblVidoeSplitAudio.Caption    := '音频流：';
  lblVidoeSplitSubtitle.Caption := '字幕流：';
  btnVideoSplit.Caption         := '分离';

  rgLive.Items.Strings[0] := '磁盘文件';
  rgLive.Items.Strings[1] := 'USB摄像头';
  rgLive.Items.Strings[2] := 'IP 相机';
  rgLive.Items.Strings[3] := '桌 面';

  rgPlayUI.Caption           := '播放时使用的视频库：';
  rgUseGPU.Caption           := '是否使用GPU加速：';
  rgUseGPU.Items.Strings[0]  := '是(NV GF1050以上显卡,驱动>436.15,X64平台)';
  rgUseGPU.Items.Strings[1]  := '否';
  lnklblHelpAccelGPU.Caption := '<a href="https://developer.nvidia.com/video-encode-decode-gpu-support-matrix">NVIDIA GPU 加速帮助</a>';

  grpVideoConv.Caption                 := '格式转换：';
  lblConvTip.Caption                   := '转换为：';
  chkVideoSize.Caption                 := '保持视频宽高';
  lblVideoWidth.Caption                := '宽：';
  lblVideoHeight.Caption               := '高：';
  chkConvSavePath.Caption              := '保存路径同文件';
  lblSaveVideoPath.Caption             := '路径：';
  chkConvOpenSavePath.Caption          := '转换结束打开保存目录';
  lblVideoInfo.Caption                 := '剪辑信息：';
  lblTitle.Caption                     := '标题：';
  lblArtist.Caption                    := '艺术：';
  lblGenre.Caption                     := '类型：';
  lblComment.Caption                   := '注释：';
  btnSaveConvParam.Caption             := '保存';
  btnSaveConvParamAndStartConv.Caption := '保存并开始转换';

  grpSplitPath.Caption         := '分离保存路径：';
  chkSplitPath.Caption         := '保存路径同文件';
  lblSplitPath.Caption         := '路径：';
  chkSplitOpenSavePath.Caption := '分离结束打开保存目录';

  rgLanguageUI.Caption := '界面语言：';
end;

procedure TfrmFFUI.ChangeLanguageEnglish;
begin
  mniOpenFile.Caption       := 'Open file...';
  mniOpenFolder.Caption     := 'Open folder...';
  mniOpenWebStream.Caption  := 'Open stream...';
  mniCopyDosCommand.Caption := 'Copy to clipbrd';

  lblVideoFile.Caption := 'Open File/Folder/Stream：';
  tsInfo.Caption       := 'Info';
  tsPlay.Caption       := 'Play';
  tsConv.Caption       := 'Conv';
  tsSplit.Caption      := 'Split';
  tsMerge.Caption      := 'Merge';
  tsCut.Caption        := 'Cut';
  tsLive.Caption       := 'Live';
  tsConfig.Caption     := 'Config';

  btnVideoPlayPlay.Caption  := 'Play';
  btnVideoPlayPause.Caption := 'Pause';
  btnVideoPlayStop.Caption  := 'Stop';

  btnAddVideoFile.Caption   := 'Add File';
  btnAddFolder.Caption      := 'Add Folder';
  btnDelVideoFile.Caption   := 'Delete';
  btnVideoConvParam.Caption := 'Param config';
  btnVideoStartConv.Caption := 'Convert';
  btnVideoStopConv.Caption  := 'Stop convert';

  lblVideoSplitTip.Caption      := 'File include：';
  lblVidoeSplitVideo.Caption    := 'Video:';
  lblVidoeSplitAudio.Caption    := 'Audio:';
  lblVidoeSplitSubtitle.Caption := 'Subtitle:';
  btnVideoSplit.Caption         := 'Split';

  rgLive.Items.Strings[0] := 'Disk File';
  rgLive.Items.Strings[1] := 'USB Camera';
  rgLive.Items.Strings[2] := 'IP Camera';
  rgLive.Items.Strings[3] := 'Desktop';

  rgPlayUI.Caption           := 'Video library for play：';
  rgUseGPU.Caption           := 'Use GPU Accelerate：';
  rgUseGPU.Items.Strings[0]  := 'Yes(NV GF1050 above,Drivers>436.15,X64)';
  rgUseGPU.Items.Strings[1]  := 'No';
  lnklblHelpAccelGPU.Caption := '<a href="https://developer.nvidia.com/video-encode-decode-gpu-support-matrix">NVIDIA GPU Help</a>';

  grpVideoConv.Caption        := 'Convert format：';
  lblConvTip.Caption          := 'Convert to：';
  chkVideoSize.Caption        := 'Same Video Size';
  lblVideoWidth.Caption       := 'W：';
  lblVideoHeight.Caption      := 'H：';
  chkConvSavePath.Caption     := 'Same Path';
  lblSaveVideoPath.Caption    := 'Path：';
  chkConvOpenSavePath.Caption := 'Open save path after finish convert';

  lblVideoInfo.Caption                 := 'Video Info：';
  lblTitle.Caption                     := 'Title:';
  lblArtist.Caption                    := 'Artist:';
  lblGenre.Caption                     := 'Genre:';
  lblComment.Caption                   := 'Comment:';
  btnSaveConvParam.Caption             := 'Save';
  btnSaveConvParamAndStartConv.Caption := 'Save And Convert';

  grpSplitPath.Caption         := 'Split save path：';
  chkSplitPath.Caption         := 'Same path';
  lblSplitPath.Caption         := 'Path：';
  chkSplitOpenSavePath.Caption := 'Open save path after finish split';

  rgLanguageUI.Caption := 'Language UI：';
end;

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

      { 视频分离路径 }
      chkSplitPath.Checked := ReadBool('Split', 'SamePath', True);
      if not chkSplitPath.Checked then
        srchbxSplitVideoSavePath.Text := ReadString('Split', 'SavePath', 'D:\');

      { 界面语言 }
      FlngUI                 := TLangUI(ReadInteger('UI', 'Language', 0) mod 2);
      rgLanguageUI.ItemIndex := Integer(TLangUI(ReadInteger('UI', 'Language', 0) mod 2));
      ChangeLanguageUI;

      Free;
    end;
{$IF Defined(CPUX86)}
    rgUseGPU.ItemIndex := 1;
    rgUseGPU.Enabled   := False;
{$ELSE}
    with TIniFile.Create(strIniFileName) do
    begin
      rgUseGPU.ItemIndex := ReadInteger('Main', 'UseGPU', 0);
      rgUseGPU.Enabled   := True;
      Free;
    end;
{$ENDIF}
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

    { 分离保存路径 }
    WriteBool('Split', 'SamePath', chkSplitPath.Checked);
    if not chkSplitPath.Checked then
      WriteString('Split', 'SavePath', srchbxSplitVideoSavePath.Text)
    else
      DeleteKey('Split', 'SavePath');

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

  if not chkSplitPath.Checked then
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

procedure TfrmFFUI.btnSaveVideoPathClick(Sender: TObject);
var
  strSelectedFolder: String;
begin
  if not SelectDirectory(TransUI('选择保存视频转换结果目录：'), TransUI('选择目录：'), strSelectedFolder) then
    Exit;

  srchbxVideoConvSavePath.Text := strSelectedFolder;
end;

procedure TfrmFFUI.chkVideoSizeClick(Sender: TObject);
begin
  lblVideoWidth.Visible  := not chkVideoSize.Checked;
  lblVideoHeight.Visible := not chkVideoSize.Checked;
  edtVideoWidth.Visible  := not chkVideoSize.Checked;
  edtVideoHeight.Visible := not chkVideoSize.Checked;
end;

procedure TfrmFFUI.chkConvOpenSavePathClick(Sender: TObject);
begin
  SaveConfig;
end;

procedure TfrmFFUI.chkSplitPathClick(Sender: TObject);
begin
  lblSplitPath.Visible             := not chkSplitPath.Checked;
  srchbxSplitVideoSavePath.Visible := not chkSplitPath.Checked;
end;

procedure TfrmFFUI.chkConvSavePathClick(Sender: TObject);
begin
  lblSaveVideoPath.Visible        := not chkConvSavePath.Checked;
  srchbxVideoConvSavePath.Visible := not chkConvSavePath.Checked;
end;

procedure TfrmFFUI.lnklblHelpAccelGPULinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
begin
  ShellExecute(0, nil, PChar(Link), nil, nil, 1);
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

end;

procedure TfrmFFUI.FormCreate(Sender: TObject);
begin
  { 创建第三方控件 }
  FDOSCommand              := TDosCommand.Create(nil);
  FDOSCommand.OnNewLine    := DosCommandLine;
  FDOSCommand.OnTerminated := DosCommandTerminated;
  CreateSynEdit;

  { 初始化变量 }
  FStatStyle             := ssBlank;
  FhPlayVideoWnd         := 0;
  pgcAll.ActivePageIndex := 0;

  { 加载系统参数 }
  LoadConfig;
end;

procedure TfrmFFUI.FormDestroy(Sender: TObject);
begin
  { 保存系统参数 }
  SaveConfig;

  { 销毁创建的第三方控件 }
  FDOSCommand.Free;
  FJSONHL.Free;
  FSynEdit_VideoSplit.Free;
  FSynEdit_VideoConv.Free;
  FSynEdit_VideoInfo.Free;
end;

procedure TfrmFFUI.FormResize(Sender: TObject);
begin
  pgcAll.TabWidth := (Width - 35) div 8;

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
  end;
end;

function SHOpenFolderAndSelectItems(pidlFolder: pItemIDList; cidl: Cardinal; apidl: Pointer; dwFlags: DWORD): HRESULT; stdcall; external shell32;

function OpenFolderAndSelectFile(const strFileName: string; const bEditMode: Boolean = False): Boolean;
var
  IIDL      : pItemIDList;
  pShellLink: IShellLink;
  hr        : Integer;
begin
  Result := False;

  hr := CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER, IID_IShellLink, &pShellLink);
  if hr = S_OK then
  begin
    pShellLink.SetPath(PChar(strFileName));
    pShellLink.GetIDList(&IIDL);
    Result := SHOpenFolderAndSelectItems(IIDL, 0, nil, Cardinal(bEditMode)) = S_OK;
  end;
end;

{ 打开视频转换后的保存目录 }
procedure TfrmFFUI.OpenVideoConvPath;
var
  strSavePath: String;
begin
  if chkConvSavePath.Checked then
    strSavePath := ExtractFilePath(srchbxSelectVideoFile.Text)
  else
    strSavePath := srchbxVideoConvSavePath.Text;

  if chkConvOpenSavePath.Checked then
    OpenFolderAndSelectFile(srchbxSelectVideoFile.Text);
end;

{ 打开视频分离后的保存目录 }
procedure TfrmFFUI.OpenVideoSplitPath;
var
  strSavePath: String;
begin
  if chkSplitPath.Checked then
    strSavePath := ExtractFilePath(srchbxSelectVideoFile.Text)
  else
    strSavePath := srchbxSplitVideoSavePath.Text;

  if chkSplitOpenSavePath.Checked then
    OpenFolderAndSelectFile(srchbxSelectVideoFile.Text);
end;

{ 视频转换结束 }
procedure TfrmFFUI.DosCommandTerminated(Sender: TObject);
var
  strTempVideoCSVFileName   : String;
  strTempAudioCSVFileName   : String;
  strTempSubtitleCSVFileName: String;
  I                         : Integer;
  strSplit                  : TArray<string>;
begin
  if FStatStyle = ssConv then
  begin
    FStatStyle                := ssBlank;
    btnVideoStartConv.Enabled := True;
    btnVideoStopConv.Enabled  := False;
    OpenVideoConvPath;
  end
  else if FStatStyle = ssSplit then
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
            lstSplitVideo.Items.Add(strSplit[0] + '/' + strSplit[1] + '/' + strSplit[2]);
          end;
          Free;
        end;
      finally
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
            lstSplitAudio.Items.Add(strSplit[0] + '/' + strSplit[1] + '/' + strSplit[2]);
          end;
          Free;
        end;
      finally
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
            lstSplitSubtitle.Items.Add(strSplit[0] + '/' + strSplit[1] + '/' + strSplit[2]);
          end;
          Free;
        end;
      finally
        DeleteFile(strTempSubtitleCSVFileName);
      end;
      FStatStyle := ssBlank;
    end;

    FSynEdit_VideoSplit.Lines.Clear;

    { 视频分离结束 }
    if FVideoStyle = vsConv then
    begin
      btnVideoSplit.Enabled := True;

      { 删除临时的 CMD 文件 }
      DeleteFile(TPath.GetTempPath + 'split.cmd');

      { 打开分离后的路径 }
      OpenVideoSplitPath;
    end;
  end;
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
  if not InputQuery(TransUI('网络视频地址：'), TransUI('地址：'), strWebStreamAddr) then
    Exit;

  srchbxSelectVideoFile.Text := strWebStreamAddr;
  FFileStyle                 := fsStream;
  pgcAll.ActivePage          := tsPlay;
  btnVideoPlayPlay.Click;
end;

procedure TfrmFFUI.srchbxSelectVideoFileInvokeSearch(Sender: TObject);
var
  pt: TPoint;
begin
  GetCursorPos(pt);
  pmOpen.Popup(pt.x, pt.y);
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
var
  strPlayProgramPath: String;
begin
  case rgPlayUI.ItemIndex of
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

procedure TfrmFFUI.btnAddFolderClick(Sender: TObject);
var
  strFolder: String;
begin
  if not SelectDirectory(TransUI('选择一个目录，目录下包含视频文件'), TransUI('目录名称：'), strFolder) then
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

procedure TfrmFFUI.btnSplitPathClick(Sender: TObject);
var
  strSelectedFolder: String;
begin
  if not SelectDirectory(TransUI('选择保存视频转换结果目录：'), TransUI('选择目录：'), strSelectedFolder) then
    Exit;

  srchbxSplitVideoSavePath.Text := strSelectedFolder;
end;

procedure TfrmFFUI.btnVideoConvParamClick(Sender: TObject);
begin
  pgcAll.ActivePage := tsConfig;
end;

{ 开始视频转换 }
procedure TfrmFFUI.btnVideoStartConvClick(Sender: TObject);
const
  c_strVideoSize           = ' -s %sx%s ';
  c_strVideoInfo           = ' -metadata "title=%s" -metadata "artist=%s" -metadata "genre=%s" -metadata "comment=%s" ';
  c_strFFMPEGConv_CPU_H264 = '"%s\ffmpeg" -hide_banner -i "%s" -c:v libx264    %s %s -y "%s"';
  c_strFFMPEGConv_GPU_H264 = '"%s\ffmpeg" -hide_banner -i "%s" -c:v h264_nvenc %s %s -y "%s"';
  c_strFFMPEGConv_CPU_FFLV = '"%s\ffmpeg" -hide_banner -i "%s" -c:v libx264    %s %s -y "%s"';
  c_strFFMPEGConv_CPU_H265 = '"%s\ffmpeg" -hide_banner -i "%s" -c:v libx265    %s %s -y "%s"';
  c_strFFMPEGConv_GPU_H265 = '"%s\ffmpeg" -hide_banner -i "%s" -c:v h265_nvenc %s %s -y "%s"';
  c_strFFMPEGConv_GPU_FFLV = '"%s\ffmpeg" -hide_banner -i "%s" -c:v h264_nvenc %s %s -y "%s"';
var
  strFFMPEGPath      : String;
  strFFMPGCommandLine: String;
  strInputFile       : string;
  strOutPutFile      : string;
  I                  : Integer;
  strTempCMDFileName : String;
  lstCMD             : TStringList;
  strExtFileName     : String;
  strVideoSize       : String;
  strVideoInfo       : String;
  procedure X86_CPU;
  begin
    case cbbConv.ItemIndex of
      0:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_CPU_H264, [strFFMPEGPath, strInputFile, strVideoSize, strVideoInfo, strOutPutFile]);
      1:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_CPU_H265, [strFFMPEGPath, strInputFile, strVideoSize, strVideoInfo, strOutPutFile]);
      2:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_CPU_FFLV, [strFFMPEGPath, strInputFile, strVideoSize, strVideoInfo, strOutPutFile]);
    end;
  end;

  procedure X64_CPU;
  begin
    X86_CPU;
  end;

  procedure X64_GPU;
  begin
    case cbbConv.ItemIndex of
      0:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_GPU_H264, [strFFMPEGPath, strInputFile, strVideoSize, strVideoInfo, strOutPutFile]);
      1:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_GPU_H265, [strFFMPEGPath, strInputFile, strVideoSize, strVideoInfo, strOutPutFile]);
      2:
        strFFMPGCommandLine := Format(c_strFFMPEGConv_GPU_FFLV, [strFFMPEGPath, strInputFile, strVideoSize, strVideoInfo, strOutPutFile]);
    end;
  end;

begin
  if lstFiles.Count <= 0 then
  begin
    MessageBox(Handle, PChar(TransUI('必须先添加视频文件再转换')), PChar(TransUI(c_strMsgTitle)), MB_OK or MB_ICONWARNING);
    Exit;
  end;

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
      if chkConvOpenSavePath.Checked then
      begin
        strOutPutFile := ChangeFileExt(strInputFile, strExtFileName);
        if SameText(strOutPutFile, strInputFile) then
          strOutPutFile := strInputFile + strExtFileName;
      end
      else
      begin
        strOutPutFile := srchbxVideoConvSavePath.Text + ChangeFileExt(ExtractFileName(strInputFile), strExtFileName);
        if not System.SysUtils.DirectoryExists(ExtractFileDir(strOutPutFile)) then
          System.SysUtils.ForceDirectories(ExtractFileDir(strOutPutFile));
      end;

{$IF Defined(CPUX86)}
      X86_CPU;
{$ELSE}
      if rgUseGPU.ItemIndex = 0 then
        X64_GPU
      else
        X64_CPU;
{$ENDIF}
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
  if chkSplitPath.Checked then
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
      intIndex          := StrToInt(lstSplitVideo.Items.Strings[I].Split(['/'])[1]);
      strOutputFileName := strSavePath + ChangeFileExt(ExtractFileName(srchbxSelectVideoFile.Text), '') + Format('_%0.2d', [intIndex]) + '.' + lstSplitVideo.Items.Strings[I].Split(['/'])[2];
      Add(Format('"%s\ffmpeg.exe" -hide_banner -i "%s" -c copy -map 0:%d -y "%s"', [strFFMPEGPath, strVideoFileName, intIndex, strOutputFileName]));
    end;

    { 分离出音频 命令行 }
    for I := 0 to lstSplitAudio.Count - 1 do
    begin
      intIndex          := StrToInt(lstSplitAudio.Items.Strings[I].Split(['/'])[1]);
      strOutputFileName := strSavePath + ChangeFileExt(ExtractFileName(srchbxSelectVideoFile.Text), '') + Format('_%0.2d', [intIndex]) + '.' + lstSplitAudio.Items.Strings[I].Split(['/'])[2];
      Add(Format('"%s\ffmpeg.exe" -hide_banner -i "%s" -c copy -map 0:%d -y "%s"', [strFFMPEGPath, strVideoFileName, intIndex, strOutputFileName]));
    end;

    { 分离出字幕 命令行 }
    for I := 0 to lstSplitSubtitle.Count - 1 do
    begin
      intIndex          := StrToInt(lstSplitSubtitle.Items.Strings[I].Split(['/'])[1]);
      strOutputFileName := strSavePath + ChangeFileExt(ExtractFileName(srchbxSelectVideoFile.Text), '') + Format('_%0.2d', [intIndex]) + '.' + lstSplitSubtitle.Items.Strings[I].Split(['/'])[2];
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

end.
