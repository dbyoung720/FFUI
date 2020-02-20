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

  lblMergeTip.Caption         := '文件包含：';
  lblMergeVideo.Caption       := '视频流：';
  btnMergeVideoAdd.Caption    := '添加';
  btnMergeVideoDel.Caption    := '删除';
  lblMergeAudio.Caption       := '音频流：';
  btnMergeAudioAdd.Caption    := '添加';
  btnMergeAudioDel.Caption    := '删除';
  lblMergeSubtitle.Caption    := '字幕流：';
  btnMergeSubtitleAdd.Caption := '添加';
  btnMergeSubtitleDel.Caption := '删除';
  btnMerge.Caption            := '合并';
  lblMergeFormat.Caption      := '合并格式：';

  rgLive.Items.Strings[0] := '磁盘文件';
  rgLive.Items.Strings[1] := 'USB摄像头';
  rgLive.Items.Strings[2] := 'IP 相机';
  rgLive.Items.Strings[3] := '桌 面';

  rgPlayUI.Caption           := '播放时使用的视频库：';
  rgUseGPU.Caption           := '是否使用GPU加速：';
  rgUseGPU.Items.Strings[0]  := '是(NV GF1050以上显卡,驱动>436.15,X64平台)';
  rgUseGPU.Items.Strings[1]  := '否';
  lnklblHelpAccelGPU.Caption := '<a href="https://developer.nvidia.com/video-encode-decode-gpu-support-matrix">NVIDIA GPU 加速帮助</a>';
  lnklblHelpAccelGPU.Hint    := '查看显卡是否支持 GPU 加速';

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
  chkSplitSamePath.Caption     := '保存路径同文件';
  lblSplitSamePath.Caption     := '路径：';
  chkSplitOpenSavePath.Caption := '分离结束打开保存目录';

  grpMergePath.Caption         := '合并保存路径：';
  chkMergeSamePath.Caption     := '保存路径同文件';
  lblMergeSamePath.Caption     := '路径：';
  chkMergeOpenSavePath.Caption := '合并结束打开保存目录';

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

  lblMergeTip.Caption         := 'File include：';
  lblMergeVideo.Caption       := 'Video stream：';
  btnMergeVideoAdd.Caption    := 'Add';
  btnMergeVideoDel.Caption    := 'Del';
  lblMergeAudio.Caption       := 'Audio stream：';
  btnMergeAudioAdd.Caption    := 'Add';
  btnMergeAudioDel.Caption    := 'Del';
  lblMergeSubtitle.Caption    := 'Subtitle stream：';
  btnMergeSubtitleAdd.Caption := 'Add';
  btnMergeSubtitleDel.Caption := 'Del';
  btnMerge.Caption            := 'Merge';
  lblMergeFormat.Caption      := 'Merge format:';

  rgLive.Items.Strings[0] := 'Disk File';
  rgLive.Items.Strings[1] := 'USB Camera';
  rgLive.Items.Strings[2] := 'IP Camera';
  rgLive.Items.Strings[3] := 'Desktop';

  rgPlayUI.Caption           := 'Video library for play：';
  rgUseGPU.Caption           := 'Use GPU Accelerate：';
  rgUseGPU.Items.Strings[0]  := 'Yes(NV GF1050 above,Drivers>436.15,X64)';
  rgUseGPU.Items.Strings[1]  := 'No';
  lnklblHelpAccelGPU.Caption := '<a href="https://developer.nvidia.com/video-encode-decode-gpu-support-matrix">NVIDIA GPU Help</a>';
  lnklblHelpAccelGPU.Hint    := 'Check whether the graphics card supports GPU acceleration';

  grpVideoConv.Caption        := 'Convert format：';
  lblConvTip.Caption          := 'Convert to：';
  chkVideoSize.Caption        := 'Same Video Size';
  lblVideoWidth.Caption       := 'W：';
  lblVideoHeight.Caption      := 'H：';
  chkConvSavePath.Caption     := 'Save path same as file';
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
  chkSplitSamePath.Caption     := 'Save path same as file';
  lblSplitSamePath.Caption     := 'Path：';
  chkSplitOpenSavePath.Caption := 'Open save path after finish split';

  grpMergePath.Caption         := 'Merge save path：';
  chkMergeSamePath.Caption     := 'Save path same as file';
  lblMergeSamePath.Caption     := 'Path：';
  chkMergeOpenSavePath.Caption := 'Open save path after finish Merge';

  rgLanguageUI.Caption := 'Language UI：';
end;
