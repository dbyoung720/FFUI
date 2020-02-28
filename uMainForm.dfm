object frmFFUI: TfrmFFUI
  Left = 0
  Top = 0
  Caption = 'FFMPEG UI v2.0'
  ClientHeight = 730
  ClientWidth = 1008
  Color = clBtnFace
  Constraints.MinHeight = 768
  Constraints.MinWidth = 1024
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  DesignSize = (
    1008
    730)
  PixelsPerInch = 96
  TextHeight = 13
  object lblVideoFile: TLabel
    Left = 8
    Top = 11
    Width = 196
    Height = 15
    Caption = #25171#24320#25991#20214'/'#25991#20214#22841'/'#32593#32476#20018#27969#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object pgcAll: TPageControl
    Left = 8
    Top = 45
    Width = 992
    Height = 644
    ActivePage = tsInfo
    Anchors = [akLeft, akTop, akRight, akBottom]
    Images = ilpgc
    TabHeight = 50
    TabOrder = 0
    TabWidth = 123
    object tsInfo: TTabSheet
      Caption = #20449#24687
    end
    object tsPlay: TTabSheet
      Caption = #25773#25918
      ImageIndex = 1
      object pnlButtonCommand: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 42
        Align = alTop
        BevelKind = bkSoft
        BevelOuter = bvNone
        Caption = 'pnlButtonCommand'
        ShowCaption = False
        TabOrder = 0
        DesignSize = (
          980
          38)
        object btnVideoPlayPlay: TButton
          Left = 10
          Top = 5
          Width = 89
          Height = 29
          Caption = #25773#25918
          TabOrder = 0
          OnClick = btnVideoPlayPlayClick
        end
        object btnVideoPlayPause: TButton
          Left = 106
          Top = 5
          Width = 89
          Height = 29
          Caption = #26242#20572
          Enabled = False
          TabOrder = 1
          OnClick = btnVideoPlayPauseClick
        end
        object btnVideoPlayStop: TButton
          Left = 202
          Top = 5
          Width = 89
          Height = 29
          Caption = #20572#27490
          Enabled = False
          TabOrder = 2
          OnClick = btnVideoPlayStopClick
        end
        object btnPlayUSBCamera: TButton
          Left = 836
          Top = 5
          Width = 135
          Height = 29
          Anchors = [akTop, akRight]
          Caption = #25773#25918' USB '#25668#20687#22836
          TabOrder = 3
          OnClick = btnPlayUSBCameraClick
        end
      end
      object pnlVideo: TPanel
        Left = 0
        Top = 42
        Width = 984
        Height = 542
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnl1'
        Color = clWhite
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
      end
    end
    object tsConv: TTabSheet
      Caption = #36716#25442
      ImageIndex = 2
      DesignSize = (
        984
        584)
      object lstFiles: TListBox
        Left = 8
        Top = 12
        Width = 257
        Height = 559
        Anchors = [akLeft, akTop, akBottom]
        ItemHeight = 13
        TabOrder = 0
      end
      object btnAddVideoFile: TButton
        Left = 280
        Top = 12
        Width = 109
        Height = 29
        Caption = #28155#21152#25991#20214
        TabOrder = 1
        OnClick = btnAddVideoFileClick
      end
      object btnDelVideoFile: TButton
        Left = 280
        Top = 100
        Width = 109
        Height = 29
        Caption = #21024#38500
        TabOrder = 2
        OnClick = btnDelVideoFileClick
      end
      object btnAddFolder: TButton
        Left = 280
        Top = 56
        Width = 109
        Height = 29
        Caption = #28155#21152#25991#20214#22841
        TabOrder = 3
        OnClick = btnAddFolderClick
      end
      object btnVideoStartConv: TButton
        Left = 280
        Top = 230
        Width = 109
        Height = 49
        Caption = #36716#25442
        TabOrder = 4
        OnClick = btnVideoStartConvClick
      end
      object btnVideoStopConv: TButton
        Left = 280
        Top = 285
        Width = 109
        Height = 57
        Caption = #20572#27490#36716#25442
        Enabled = False
        TabOrder = 5
        OnClick = btnVideoStopConvClick
      end
      object pnlVideoConv: TPanel
        Left = 412
        Top = 12
        Width = 561
        Height = 559
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'pnlVideoConv'
        Ctl3D = False
        ParentCtl3D = False
        ShowCaption = False
        TabOrder = 6
      end
      object btnVideoConvParam: TButton
        Left = 280
        Top = 167
        Width = 109
        Height = 57
        Caption = #21442#25968#37197#32622
        TabOrder = 7
        OnClick = btnVideoConvParamClick
      end
    end
    object tsSplit: TTabSheet
      Caption = #20998#31163
      ImageIndex = 3
      DesignSize = (
        984
        584)
      object lblVidoeSplitAudio: TLabel
        Left = 354
        Top = 44
        Width = 52
        Height = 13
        Caption = #38899#39057#27969#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblVidoeSplitVideo: TLabel
        Left = 70
        Top = 41
        Width = 52
        Height = 13
        Caption = #35270#39057#27969#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblVidoeSplitSubtitle: TLabel
        Left = 646
        Top = 41
        Width = 52
        Height = 13
        Caption = #23383#24149#27969#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblVideoSplitTip: TLabel
        Left = 20
        Top = 12
        Width = 90
        Height = 15
        Caption = #27492#25991#20214#21253#21547#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lstSplitVideo: TListBox
        Left = 70
        Top = 63
        Width = 185
        Height = 228
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 0
      end
      object lstSplitAudio: TListBox
        Left = 354
        Top = 63
        Width = 185
        Height = 228
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 1
      end
      object lstSplitSubtitle: TListBox
        Left = 646
        Top = 63
        Width = 185
        Height = 228
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 2
      end
      object btnVideoSplit: TButton
        Left = 848
        Top = 324
        Width = 95
        Height = 44
        Anchors = [akTop, akRight]
        Caption = #20998#31163
        TabOrder = 3
        OnClick = btnVideoSplitClick
      end
    end
    object tsMerge: TTabSheet
      Caption = #21512#24182
      ImageIndex = 4
      DesignSize = (
        984
        584)
      object lblMergeVideo: TLabel
        Left = 70
        Top = 41
        Width = 52
        Height = 13
        Caption = #35270#39057#27969#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblMergeAudio: TLabel
        Left = 354
        Top = 44
        Width = 52
        Height = 13
        Caption = #38899#39057#27969#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblMergeSubtitle: TLabel
        Left = 646
        Top = 41
        Width = 52
        Height = 13
        Caption = #23383#24149#27969#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblMergeTip: TLabel
        Left = 20
        Top = 12
        Width = 75
        Height = 15
        Caption = #25991#20214#21253#21547#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblWatermark: TLabel
        Left = 837
        Top = 190
        Width = 60
        Height = 13
        Caption = #22270#29255#36335#24452#65306
        Visible = False
      end
      object lblWatchMarkLeft: TLabel
        Left = 840
        Top = 239
        Width = 74
        Height = 13
        Caption = #27700#24179'(X)'#22352#26631#65306
        Visible = False
      end
      object lblWatchMarkTop: TLabel
        Left = 841
        Top = 264
        Width = 74
        Height = 13
        Caption = #22402#30452'(Y)'#22352#26631#65306
        Visible = False
      end
      object lstMergeVideo: TListBox
        Left = 70
        Top = 63
        Width = 185
        Height = 228
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 0
      end
      object lstMergeAudio: TListBox
        Left = 354
        Top = 63
        Width = 185
        Height = 228
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 1
      end
      object lstMergeSubtitle: TListBox
        Left = 646
        Top = 63
        Width = 185
        Height = 228
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 2
      end
      object btnMergeVideoAdd: TButton
        Left = 256
        Top = 63
        Width = 49
        Height = 25
        Caption = #28155#21152
        TabOrder = 3
        OnClick = btnMergeVideoAddClick
      end
      object btnMergeVideoDel: TButton
        Left = 256
        Top = 91
        Width = 49
        Height = 25
        Caption = #21024#38500
        TabOrder = 4
        OnClick = btnMergeVideoDelClick
      end
      object btnMergeAudioAdd: TButton
        Left = 540
        Top = 63
        Width = 49
        Height = 25
        Caption = #28155#21152
        TabOrder = 5
        OnClick = btnMergeAudioAddClick
      end
      object btnMergeAudioDel: TButton
        Left = 540
        Top = 91
        Width = 49
        Height = 25
        Caption = #21024#38500
        TabOrder = 6
        OnClick = btnMergeAudioDelClick
      end
      object btnMergeSubtitleAdd: TButton
        Left = 832
        Top = 63
        Width = 49
        Height = 25
        Caption = #28155#21152
        TabOrder = 7
        OnClick = btnMergeSubtitleAddClick
      end
      object btnMergeSubtitleDel: TButton
        Left = 832
        Top = 91
        Width = 49
        Height = 25
        Caption = #21024#38500
        TabOrder = 8
        OnClick = btnMergeSubtitleDelClick
      end
      object btnMerge: TButton
        Left = 848
        Top = 324
        Width = 95
        Height = 44
        Anchors = [akTop, akRight]
        Caption = #21512#24182
        TabOrder = 9
        OnClick = btnMergeClick
      end
      object chkAddWaterMark: TCheckBox
        Left = 837
        Top = 166
        Width = 99
        Height = 17
        Caption = #28155#21152#27700#21360
        TabOrder = 10
        OnClick = chkAddWaterMarkClick
      end
      object srchbxWatermark: TSearchBox
        Left = 837
        Top = 210
        Width = 132
        Height = 21
        TabOrder = 11
        Visible = False
        OnInvokeSearch = srchbxWatermarkInvokeSearch
      end
      object btnConnectMulVideo: TButton
        Left = 848
        Top = 374
        Width = 95
        Height = 44
        Hint = #23558#22810#20010#23567#35270#39057#36830#25509#25104#19968#20010#22823#30340#35270#39057#25991#20214
        Anchors = [akTop, akRight]
        Caption = #36830#25509#22810#20010#35270#39057
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = btnConnectMulVideoClick
      end
      object edtWatchMarkTopValue: TEdit
        Left = 922
        Top = 261
        Width = 47
        Height = 21
        NumbersOnly = True
        TabOrder = 13
        Text = '10'
        Visible = False
      end
      object edtWatchMarkLeftValue: TEdit
        Left = 922
        Top = 234
        Width = 47
        Height = 21
        NumbersOnly = True
        TabOrder = 14
        Text = '10'
        Visible = False
      end
    end
    object tsCut: TTabSheet
      Caption = #25130#21462
      ImageIndex = 5
      DesignSize = (
        984
        584)
      object rgCut: TRadioGroup
        Left = 16
        Top = 8
        Width = 957
        Height = 61
        Anchors = [akLeft, akTop, akRight]
        Caption = #25130#21462#31867#22411#65306
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #21253#21547#38899#35270#39057
          #21482#26377#35270#39057
          #21482#26377#38899#39057)
        TabOrder = 0
        OnClick = rgCutClick
      end
      object grpCutToImage: TGroupBox
        Left = 435
        Top = 80
        Width = 122
        Height = 77
        Caption = #22270#29255#65306
        TabOrder = 1
        Visible = False
        object lblCutImageFormat: TLabel
          Left = 32
          Top = 20
          Width = 60
          Height = 13
          Caption = #22270#29255#26684#24335#65306
        end
        object cbbCutImage: TComboBox
          Left = 32
          Top = 39
          Width = 60
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 0
          Text = 'JPG'
          Items.Strings = (
            'BMP'
            'JPG'
            'PNG')
        end
      end
      object grpCutTime: TGroupBox
        Left = 16
        Top = 80
        Width = 264
        Height = 77
        Caption = #25130#21462#26102#38388#65306
        TabOrder = 2
        object lblCutStartTime: TLabel
          Left = 32
          Top = 23
          Width = 60
          Height = 13
          Caption = #24320#22987#26102#38388#65306
        end
        object lblCutEndTime: TLabel
          Left = 32
          Top = 47
          Width = 60
          Height = 13
          Caption = #32467#26463#26102#38388#65306
        end
        object edtCutStartTime: TEdit
          Left = 108
          Top = 19
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '00:00:00'
        end
        object edtCutEndTime: TEdit
          Left = 108
          Top = 44
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '00:01:00'
        end
      end
      object chkCutToImage: TCheckBox
        Left = 340
        Top = 80
        Width = 89
        Height = 17
        Caption = #25130#21462#20026#22270#29255
        TabOrder = 3
        Visible = False
        OnClick = chkCutToImageClick
      end
      object btnCut: TButton
        Left = 848
        Top = 324
        Width = 95
        Height = 44
        Anchors = [akTop, akRight]
        Caption = #25130#21462
        TabOrder = 4
        OnClick = btnCutClick
      end
    end
    object tsLive: TTabSheet
      Caption = #30452#25773
      ImageIndex = 6
      DesignSize = (
        984
        584)
      object rgLive: TRadioGroup
        Left = 10
        Top = 3
        Width = 392
        Height = 65
        Caption = #30452#25773#28304#65306
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          #30913#30424#25991#20214
          'USB '#25668#20687#22836
          #26700#38754
          #32593#32476#20018#27969)
        TabOrder = 0
      end
      object grpLiveAddress: TGroupBox
        Left = 408
        Top = 3
        Width = 409
        Height = 65
        Anchors = [akLeft, akTop, akRight]
        Caption = #30452#25773#22320#22336#65306
        TabOrder = 1
        DesignSize = (
          409
          65)
        object edtLiveIP: TEdit
          Left = 24
          Top = 24
          Width = 369
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'rtmp://192.168.3.100:6666'
        end
      end
      object btnLive: TButton
        Left = 828
        Top = 8
        Width = 144
        Height = 60
        Anchors = [akTop, akRight]
        Caption = #24320#22987#30452#25773
        TabOrder = 2
        OnClick = btnLiveClick
      end
    end
    object tsConfig: TTabSheet
      Caption = #37197#32622
      ImageIndex = 7
      DesignSize = (
        984
        584)
      object rgPlayUI: TRadioGroup
        Left = 12
        Top = 16
        Width = 961
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = #25773#25918#26102#20351#29992#30340#35270#39057#24211#65306
        Columns = 3
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'FFMPEG(v4.2.0)'
          'MPV (v2.0.0)'
          'VLC (v3.0.8)')
        ParentFont = False
        TabOrder = 0
        OnClick = rgPlayUIClick
      end
      object rgUseGPU: TRadioGroup
        Left = 12
        Top = 65
        Width = 961
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = #26159#21542#20351#29992'GPU'#21152#36895#65306
        Columns = 3
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'YES(NV GF1050'#20197#19978#26174#21345','#39537#21160'>436.15)'
          'NO')
        ParentFont = False
        TabOrder = 1
        OnClick = rgPlayUIClick
      end
      object grpVideoConv: TGroupBox
        Left = 12
        Top = 113
        Width = 961
        Height = 237
        Anchors = [akLeft, akTop, akRight]
        Caption = #26684#24335#36716#25442#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        DesignSize = (
          961
          237)
        object lblVideoWidth: TLabel
          Left = 208
          Top = 52
          Width = 26
          Height = 13
          Caption = #23485#65306
          Visible = False
        end
        object lblVideoHeight: TLabel
          Left = 209
          Top = 77
          Width = 26
          Height = 13
          Caption = #39640#65306
          Visible = False
        end
        object lblSaveVideoPath: TLabel
          Left = 349
          Top = 52
          Width = 39
          Height = 13
          Caption = #36335#24452#65306
          Visible = False
        end
        object lblConvTip: TLabel
          Left = 24
          Top = 26
          Width = 52
          Height = 13
          Caption = #36716#25442#20026#65306
        end
        object lblTitle: TLabel
          Left = 30
          Top = 125
          Width = 39
          Height = 13
          Caption = #26631#39064#65306
        end
        object lblArtist: TLabel
          Left = 30
          Top = 153
          Width = 39
          Height = 13
          Caption = #33402#26415#65306
        end
        object lblGenre: TLabel
          Left = 30
          Top = 181
          Width = 39
          Height = 13
          Caption = #31867#22411#65306
        end
        object lblComment: TLabel
          Left = 30
          Top = 207
          Width = 39
          Height = 13
          Caption = #27880#37322#65306
        end
        object lblVideoInfo: TLabel
          Left = 24
          Top = 103
          Width = 65
          Height = 13
          Caption = #21098#36753#20449#24687#65306
        end
        object chkVideoSize: TCheckBox
          Left = 192
          Top = 26
          Width = 114
          Height = 17
          Caption = #20445#25345#35270#39057#23485#39640
          Checked = True
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          State = cbChecked
          TabOrder = 0
          OnClick = chkVideoSizeClick
        end
        object edtVideoHeight: TEdit
          Left = 234
          Top = 74
          Width = 47
          Height = 21
          NumbersOnly = True
          TabOrder = 1
          Text = '600'
          Visible = False
        end
        object edtVideoWidth: TEdit
          Left = 234
          Top = 47
          Width = 47
          Height = 21
          NumbersOnly = True
          TabOrder = 2
          Text = '800'
          Visible = False
        end
        object chkConvSavePath: TCheckBox
          Left = 332
          Top = 26
          Width = 469
          Height = 17
          Caption = #20445#23384#36335#24452#21516#25991#20214
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = chkConvSavePathClick
        end
        object cbbConv: TComboBox
          Left = 30
          Top = 45
          Width = 109
          Height = 21
          Style = csDropDownList
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 4
          Text = 'H264 (*.MKV)'
          Items.Strings = (
            'H264 (*.MKV)'
            'H265 (*.MKV)'
            'Flash(*.FLV)')
        end
        object edtTitle: TEdit
          Left = 84
          Top = 123
          Width = 203
          Height = 21
          TabOrder = 5
          Text = 'FFUI 2.0'
        end
        object edtArtist: TEdit
          Left = 84
          Top = 150
          Width = 203
          Height = 21
          TabOrder = 6
          Text = 'dbyoung'
        end
        object edtGenre: TEdit
          Left = 84
          Top = 177
          Width = 203
          Height = 21
          TabOrder = 7
          Text = 'Video'
        end
        object edtComment: TEdit
          Left = 84
          Top = 204
          Width = 203
          Height = 21
          TabOrder = 8
          Text = 'dbyoung@sina.com'
        end
        object btnSaveConvParam: TButton
          Left = 810
          Top = 169
          Width = 135
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #20445#23384
          TabOrder = 9
          OnClick = btnSaveConvParamClick
        end
        object btnSaveConvParamAndStartConv: TButton
          Left = 810
          Top = 200
          Width = 135
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #20445#23384#24182#24320#22987#36716#25442
          TabOrder = 10
          OnClick = btnSaveConvParamAndStartConvClick
        end
        object srchbxVideoConvSavePath: TSearchBox
          Left = 394
          Top = 49
          Width = 407
          Height = 21
          TabOrder = 11
          Text = 'D:\'
          Visible = False
          OnInvokeSearch = srchbxVideoConvSavePathInvokeSearch
        end
        object chkConvOpenSavePath: TCheckBox
          Left = 332
          Top = 103
          Width = 265
          Height = 17
          Caption = #36716#25442#32467#26463#25171#24320#20445#23384#30446#24405
          Checked = True
          State = cbChecked
          TabOrder = 12
          OnClick = chkConvOpenSavePathClick
        end
        object chkConvAutoSearchSubtitle: TCheckBox
          Left = 332
          Top = 126
          Width = 613
          Height = 17
          Caption = #33258#21160#25628#32034#24403#21069#30446#24405#19979#21516#25991#20214#30340#23383#24149#25991#20214
          Checked = True
          State = cbChecked
          TabOrder = 13
          OnClick = chkConvSavePathClick
        end
      end
      object grpSplitPath: TGroupBox
        Left = 12
        Top = 354
        Width = 409
        Height = 72
        Caption = #20998#31163#20445#23384#36335#24452#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object lblSplitSamePath: TLabel
          Left = 208
          Top = 26
          Width = 39
          Height = 13
          Caption = #36335#24452#65306
          Visible = False
        end
        object chkSplitSamePath: TCheckBox
          Left = 28
          Top = 22
          Width = 174
          Height = 17
          Caption = #20445#23384#36335#24452#21516#25991#20214
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkSplitSamePathClick
        end
        object srchbxSplitVideoSavePath: TSearchBox
          Left = 252
          Top = 22
          Width = 147
          Height = 21
          TabOrder = 1
          Visible = False
          OnInvokeSearch = srchbxSplitVideoSavePathInvokeSearch
        end
        object chkSplitOpenSavePath: TCheckBox
          Left = 28
          Top = 46
          Width = 358
          Height = 17
          Caption = #20998#31163#32467#26463#25171#24320#20445#23384#30446#24405
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = chkConvOpenSavePathClick
        end
      end
      object lnklblHelpAccelGPU: TLinkLabel
        Left = 844
        Top = 89
        Width = 113
        Height = 17
        Hint = #26597#30475#26174#21345#26159#21542#25903#25345' GPU '#21152#36895
        Anchors = [akTop, akRight]
        Caption = 
          '<a href="https://developer.nvidia.com/video-encode-decode-gpu-su' +
          'pport-matrix">NVIDIA GPU '#21152#36895#24110#21161'</a>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnLinkClick = lnklblHelpAccelGPULinkClick
      end
      object rgLanguageUI: TRadioGroup
        Left = 12
        Top = 506
        Width = 409
        Height = 45
        Caption = #30028#38754#35821#35328#65306
        Columns = 3
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #20013#25991
          'English')
        ParentFont = False
        TabOrder = 5
        OnClick = rgLanguageUIClick
      end
      object grpMergePath: TGroupBox
        Left = 427
        Top = 354
        Width = 546
        Height = 72
        Anchors = [akLeft, akTop, akRight]
        Caption = #21512#24182#20445#23384#36335#24452#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object lblMergeSamePath: TLabel
          Left = 212
          Top = 26
          Width = 39
          Height = 13
          Caption = #36335#24452#65306
          Visible = False
        end
        object lblMergeFormat: TLabel
          Left = 412
          Top = 22
          Width = 91
          Height = 13
          Caption = #21512#24182#21518#30340#26684#24335#65306
        end
        object chkMergeSamePath: TCheckBox
          Left = 28
          Top = 22
          Width = 174
          Height = 17
          Caption = #20445#23384#36335#24452#21516#25991#20214
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkMergeSamePathClick
        end
        object srchbxMergeVideoSavePath: TSearchBox
          Left = 252
          Top = 23
          Width = 136
          Height = 21
          TabOrder = 1
          Visible = False
          OnInvokeSearch = srchbxMergeVideoSavePathInvokeSearch
        end
        object chkMergeOpenSavePath: TCheckBox
          Left = 28
          Top = 45
          Width = 358
          Height = 17
          Caption = #21512#24182#32467#26463#25171#24320#20445#23384#30446#24405
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = chkMergeOpenSavePathClick
        end
        object cbbMergeFormat: TComboBox
          Left = 418
          Top = 39
          Width = 106
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemIndex = 0
          TabOrder = 3
          Text = 'H264 (*.MKV)'
          OnChange = cbbMergeFormatChange
          Items.Strings = (
            'H264 (*.MKV)'
            'H265 (*.MKV)')
        end
      end
      object grpCutConfig: TGroupBox
        Left = 12
        Top = 429
        Width = 409
        Height = 72
        Caption = #25130#21462#20445#23384#36335#24452#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object lblCutVideoSavePath: TLabel
          Left = 208
          Top = 26
          Width = 39
          Height = 13
          Caption = #36335#24452#65306
          Visible = False
        end
        object chkCutSamePath: TCheckBox
          Left = 28
          Top = 22
          Width = 174
          Height = 17
          Caption = #20445#23384#36335#24452#21516#25991#20214
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkCutSamePathClick
        end
        object srchbxCutVideoSavePath: TSearchBox
          Left = 252
          Top = 22
          Width = 147
          Height = 21
          TabOrder = 1
          Visible = False
          OnInvokeSearch = srchbxSplitVideoSavePathInvokeSearch
        end
        object chkCutOpenSavePath: TCheckBox
          Left = 28
          Top = 46
          Width = 358
          Height = 17
          Caption = #25130#21462#32467#26463#25171#24320#20445#23384#30446#24405
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = chkConvOpenSavePathClick
        end
      end
    end
  end
  object srchbxSelectVideoFile: TSearchBox
    Left = 216
    Top = 8
    Width = 784
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    PopupMenu = pmOpen
    ReadOnly = True
    TabOrder = 1
    OnDblClick = mniOpenFileClick
    OnInvokeSearch = srchbxSelectVideoFileInvokeSearch
  end
  object statInfo: TStatusBar
    Left = 0
    Top = 706
    Width = 1008
    Height = 24
    Panels = <>
    PopupMenu = pmStatCopy
    SimplePanel = True
  end
  object dlgOpenVideoFile: TOpenDialog
    Left = 392
    Top = 355
  end
  object pmOpen: TPopupMenu
    AutoHotkeys = maManual
    Left = 828
    Top = 3
    object mniOpenFile: TMenuItem
      Caption = #25171#24320#25991#20214'...'
      OnClick = mniOpenFileClick
    end
    object mniOpenFolder: TMenuItem
      Caption = #25171#24320#25991#20214#22841'...'
      OnClick = mniOpenFolderClick
    end
    object mniOpenWebStream: TMenuItem
      Caption = #25171#24320#32593#32476#20018#27969'...'
      OnClick = mniOpenWebStreamClick
    end
  end
  object pmStatCopy: TPopupMenu
    AutoHotkeys = maManual
    Left = 480
    Top = 355
    object mniCopyDosCommand: TMenuItem
      Caption = #22797#21046#21040#21098#20999#26495
      OnClick = mniCopyDosCommandClick
    end
  end
  object tmrPlayVideo: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrPlayVideoTimer
    Left = 556
    Top = 355
  end
  object ilpgc: TImageList
    Height = 32
    Width = 32
    Left = 308
    Top = 360
    Bitmap = {
      494C010108000C00040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA9A8E00AF827300AE82
      7300AE827300AD827300AD817200AE817100AC817100AC807100AC7F7100AB7F
      7000AB7F6F00AB7E6F00AA7D6F00AA7E6E00AA7D6D00AA7D6D00A97C6C00A97C
      6C00A87B6C00A87A6B00A77A6B00A87B6B00A77A6A00A77A6A00A7796A00A779
      6900A6786900A6786900B1908500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DADA
      DA00CECECE00C2C2C200BABABA00B4B4B400B4B4B400B9B9B900C0C0C000CCCC
      CC00D9D9D9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEC9C7005F4842005F4841005E4840005E474000C8C4C3000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B1867700FAF6F200FAF5
      F200FAF5F200FAF5F200FAF6F200FAF5F100FAF5F100FAF5F100FAF5F100FAF5
      F000F9F5F100F9F5F000F9F4F100F9F4F100F9F4F000F9F4F000F9F4EF00F9F3
      EF00F9F4EF00F9F4EF00F9F4EF00F9F4EF00F9F3EF00F9F3EF00F8F3EF00F8F3
      EF00F9F3EE00F8F3EE00AE817200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2D2D200B6B1AE009478
      6A0080513800773B1D007B2F0C00802903007E270300782D0D0074381F00794E
      3B008A746A00AFABAA00CFCFCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009A8F8A00A5958E00CBBCB100C5B4A9008D7B71008D817E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2867800FBF6F300F7EF
      E900F7EFE900F7EFE900F6EFE900F6EEE900F7EEE900F6EEE900F6EFE900F6EE
      E800F6EFE900F6EFE800F6EEE900F6EEE800F7EEE800F6EEE800F6EEE800F6EE
      E800F6EEE800F7EEE800F6EEE700F6EEE800F6EDE700F6EEE700F6EEE800F6EE
      E800F6EEE700F9F4EF00AE827400000000000000000000000000000000000000
      0000DDD6D000AD917C008E5D3B007A3D13008E5B3A00AD8D7800DAD1CC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DDD4D000AD907C008D5B3B00793C13008D5B3A00AB8B7800D9D1CC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D8D8D800B5ACA900976955008D3D1A009030
      0600424203003D46040075380A00803B0B00A2300F00AF310F00AB2F0F009D2E
      0C008A2A08006E321A007F5E5000AEA8A500D5D5D50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000074625C00CABEB600C0AEA100BFACA100B3A1960066544F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2887A00FAF7F400F7EF
      E900F7EFEA00F7EFEA00F7EFE900F7EFEA00F6EFE900F7EFE900F7EFE900F6EF
      E900F7EFE900F7EFE900F6EFE900F7EFE900F6EFE900F6EFE900F6EEE800F6EE
      E800F6EEE800F6EFE800F6EEE800F7EEE900F6EEE800F6EEE800F6EFE800F6EE
      E800F6EEE800FAF4EF00AF83740000000000000000000000000000000000E1DB
      D500A9876400B47B4200DD984B00F1B77300DEA56A00B2743C009D715500DCD3
      CD0000000000000000000000000000000000000000000000000000000000E0D9
      D300A6816200AB6C3500D08B4900E39B5500CF884700AA6831009D715500DCD3
      CD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CFCFCF00A685780099482500AD320700AD2F0B007635
      08000A4C00000A5D00000B7C00000C83000027610200872D0900A32B0B00B32E
      0F00BC311200A82F0F008E2B09006F3923008E7A7200CACACA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008777720081716C00C9C4C2000000000000000000D7D5
      D500A0948F00745E5600CFBFB600C0ADA100BFAC9F00C7B7AB00624E4700928A
      8500CECDCB000000000000000000BDB8B8006C615B006F625E00000000000000
      00000000000000000000000000000000000000000000B4897B00FBF7F400F7EF
      EA00F7EFEA00F7EFE900F7EFEA00F7EFE900F7EFE900F7EFEA00F7EFEA00F7EF
      E900F7EFEA00F7EFEA00F7EFEA00F6EFE900F6EFE900F7EFE900F6EFE900F6EF
      E900F7EFE900F6EFE900F6EFE800F7EEE800F6EFE800F7EFE800F6EFE800F7EE
      E900F6EEE800FAF5F100B084750000000000000000000000000000000000BFA3
      8B00CE9C6A00ECB16A00DE9C5600D28E4E00DD9C5500EBA75A00B2723D00B290
      7A0000000000000000000000000000000000000000000000000000000000B99E
      8800BC875600DE9B5700CE905300C0834B00CD8F5200DD995500AA6C3C00B190
      7C00000000000000000000000000000000000000000000000000000000000000
      000000000000CDCDCD00A6766300A73A1000B7300900BC280B00AF2408005735
      03000A4E00000B6700000B7D00000B8000000B7C0000106E0000215E01007F30
      0600B3270B00BC2C0F00BC3112009E2E0E00772B100085675C00C7C7C7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000093847D00BBADA600B9A9A10079655D00816F6C0084767100725C
      550097847C00C0AFA500C5B3A700C2AFA300C1AEA100C2AEA200B8A79D008976
      6D005C494200796B640070615D0067534C00A18D84009C8A7F006F615E000000
      00000000000000000000000000000000000000000000B48B7B00FBF7F500F7EF
      EB00F7EFEA009A7365009A7365009A7264009972650099726400997163009870
      64009871630098706200986F620097706200976F6100976F6100966F6100966E
      6000966E6000966E6000956D5F00956D6000956D5F00956D5F00956C5F00F7EF
      E900F6EFE900FAF5F100B085770000000000000000000000000000000000B387
      5E00E8C18F00D2935300C9A58200DBD3CD00C9A38100D2935200DB9D5A009F6B
      460000000000000000000000000000000000000000000000000000000000A57A
      5900D7985A00C1854D00BE9F8200D9D3CD00BD9E8100C2864C00D08C4F009A65
      4500000000000000000000000000000000000000000000000000000000000000
      0000D2D2D200AA786400B4390C00C1300800C5270900BE2405009B2302002D3E
      02000A5700000B7200000B7E00000B7D00000A7800000A7300000A6F00003748
      01009F220400B6240900BA280C00BD2F1100A62F0F007B2A0B0083675C00CBCB
      CB00000000000000000000000000000000000000000000000000000000000000
      000093827E00C6BBB600D9CDC400D1C3BA00D6C9BF00B4A49C00A9989000CFC2
      B800CDBEB400C7B7AC00C4B3A700C4B1A500C2B0A400C0AEA200C1AFA200C5B4
      A800C4B3A9009C8A8000A3928800C4B1A600BDA99C00BBA89C009D8B80007165
      5E000000000000000000000000000000000000000000B58B7C00FBF8F600F8F0
      EC00F7EFEB009C7467009B7467009B7366009A7366009B7365009A7265009972
      64009A726400997264009971640099716300987163009870620098706200986F
      6200976F6100976F6100976E6100966E6000966D6000966E6000966E5F00F7EF
      EA00F7EFE900FAF5F200B286780000000000000000000000000000000000B67D
      4900FAE3C200AB683000DDD6CF0000000000DBD2CB00AF6A3000F7CB93009C5C
      290000000000000000000000000000000000000000000000000000000000A16E
      4200EFBB85009B5E3000DBD5CF0000000000D9D2CB009E613200EDB880009151
      280000000000000000000000000000000000000000000000000000000000DCDC
      DC00B28C7D00B7411100CA310800CF290700C9230300A0290300234A06000B57
      03000C6801000D7C01000B7E00000B7A00000A7500000A700000096A0000115C
      000059330100A61E0300B6200700BA270C00BC2E1000A62F0F00752D1000907B
      7300D6D6D6000000000000000000000000000000000000000000000000000000
      000095858100CABFBA00E4DBD500CFC1B700CEBFB500D1C3B800D0C1B900CABB
      B000C9B8AD00C8B7AB00C7B5A900C5B4A800C4B2A600C2B1A400C2AFA300C0AD
      A100BFADA000C2B0A500C1AEA100BBA79B00BBA79A00BDA99E00A18E85007163
      5F000000000000000000000000000000000000000000B68D7E00FCF8F600F8F0
      EC00F7F0EC00F8F2ED00F8F1ED00F7F2EC00F7F1EC00F7F1EC00F7F1EC00F7F1
      EC00F7F1EB00F7F1EC00F7F0EB00F6F1EB00F7F1EB00F7F1EB00F6F0EB00F7F0
      EB00F7F0EB00F7F0EA00F6F0EA00F7F0EA00F7EFEA00F6F0EA00F6F0EA00F7EF
      EA00F7EFEA00FAF6F300B287790000000000000000000000000000000000C99E
      7500EED6BA00C18A5900C59F7F00DED7CF00C39D7E00C4874F00EAC9A300AF7E
      540000000000000000000000000000000000000000000000000000000000B48D
      6900E5C19B00B7764300B8987F00DCD5CF00B7977E00B8774400DFB79000A778
      560000000000000000000000000000000000000000000000000000000000C2B7
      B300B2542B00D1370800DA2E0800D72C0500B92A03002A4F0C000D600B000E6A
      06000E7A03000E8103000D7E02000D7902000B7301000A6D0100096700000961
      00000A5C000090200100B41B0300B7200700BA270C00BD2F11009E2E0D006E39
      2300AFAAA7000000000000000000000000000000000000000000000000000000
      0000D2CDCC00907C7500EDE7E200D8CCC400D0C2B800CEC0B600CDBDB400CCBC
      B200CBBBB000CAB9AE00C8B7AC00C7B5AA00C5B4A800C4B2A700C3B1A500C1AF
      A300C0AEA100BFACA000BEAA9E00BDA99C00BCA99C00C6B3A8006B575000BDB9
      B8000000000000000000000000000000000000000000B78E7F00FCF9F700F8F0
      ED00F8F1ED00F7F2ED00F7F1ED00F7F2ED00F8F1ED00F7F1EC00F7F2ED00F8F2
      EC00F8F1EC00F7F1EC00F7F1EC00F8F1EC00F7F1EB00F7F1EC00F7F1EC00F6F1
      EB00F7F0EB00F7F0EB00F7F0EB00F7F1EB00F7F1EA00F6F0EB00F7F0EA00F7EF
      EA00F8EFEB00FBF6F300B3887B0000000000000000000000000000000000DEC4
      AB00DDBA9500EBD5BE00C08A5F00A45B2B00C1875700EDD1B100E2BE9D00A479
      5D00D0D0D000D7D7D700D3D3D300D1D1D100D4D4D400DBDBDB00DBDBDB00A37F
      6700E2BF9A00E4BE9B00B87B4C009A572A00B87C4C00E4BE9900C4997400C7AA
      9600000000000000000000000000000000000000000000000000DADADA00B679
      6000D43D0600E0350900E4320600D9320700723F09000E63100010710D00117C
      08001185060010820500107F05000F780400106D03002C520200484001006433
      010088220000A91A0000B3180100B51A0300B7200700BA280D00BC3112008E2B
      0A0083615300D1D1D10000000000000000000000000000000000000000000000
      00000000000094857F00CAC0BA00DED4CE00D1C4BA00D0C2B800CFC0B600CEBE
      B400CCBDB300CBBBB000C9B9AE00C8B8AC00C7B6AB00C6B5A900C4B3A700C3B1
      A600C2B0A400C1AEA200C0ADA100BEAB9E00C1AFA300A8968C00756761000000
      00000000000000000000000000000000000000000000B8908100FDF9F800F8F1
      EE00F8F1ED00F8F2EE00F8F2EE00F8F3EE00F8F2EE00F7F2ED00F8F2ED00F7F2
      ED00F7F2ED00F7F1ED00F7F1EC00F7F2ED00F7F1EC00F7F1EC00F7F1EC00F7F1
      EC00F7F1EC00F8F1EC00F7F1EB00F7F0EB00F7F0EB00F7F0EB00F7F0EC00F7EF
      EB00F7F0EB00FBF6F400B3897B0000000000000000000000000000000000F2EC
      E600D8B89700DFBD9900F0DDC900FCF4EA00F2E1CF00ECD1B300EBD2B800B9A0
      930087584900875648008654460084524400815042006D4135006C3F3400A482
      7100E2C29F00E3C29E00EBD4BA00FCEEDA00EAD2B800CDA78400C29E8100E9E1
      DC00000000000000000000000000000000000000000000000000C8C1BD00C052
      2400E03F0A00E63F0D00E7420E00D6410E004B4E0E00126B0E00127D0B001489
      09001487080013840800137F0800117907003E560600B02B0500C1250300C021
      0200BD1C0100B9190000B3170000B4170100B51B0400B8230900BC2C0F00A82F
      0F0070341C00B3AFAE0000000000000000000000000000000000000000000000
      0000000000009E908800C2B6B100E0D7D000D9CDC500D5C8BF00D2C3B900CFC1
      B700CEBFB400D0C1B800D9CEC600E3DBD500E7E0DA00E5DCD600DBD0C800CBBC
      B200C4B2A600C2B0A400C1AEA300C0ADA100C5B2A8009F8D83007E6F6A000000
      00000000000000000000000000000000000000000000B8908200FDFAF800F9F2
      EE00F8F2EE00F8F3EF00F9F3EE00F9F2EF00F9F3EE00F8F2EF00F8F2EE00F8F3
      EE00F8F2EE00F7F2EE00F8F2ED00F8F1ED00F8F1EE00F7F1ED00F7F2ED00F8F2
      ED00F7F1EC00F7F1ED00F7F1ED00F7F1ED00F7F1EC00F7F1EC00F7F1EC00F7F0
      EC00F8F0EC00FBF7F500B58C7C00000000000000000000000000000000000000
      0000F4EDE700E2CAB300D6AF8700CD9A6B00CFA77E00BE997B00CBB1A400FAF9
      F900E9D7C900EAD8CC00EAD8CC00EAD8CC00E7D8D3008E675C00B59D9300CBB6
      AB00A8867700AA886E00C39F7C00BB885F00C19A7700D3BAA400ECE5E0000000
      0000000000000000000000000000000000000000000000000000BE927E00DC46
      0800EA4B1500E94F1600EA531700E35719009D521600166E0D0017860D00178D
      0C00178A0C0016850B001A7A0B0043600B00A5400A00DA310700DB2B0600D524
      0400CC200300C21C0100BA170000B3170100B3190200B21E0500B3270C00BB31
      12008A2A080090776E00DBDBDB00000000000000000000000000000000000000
      0000DEDCDA0087746C00EDE7E300E0D5CE00DED3CB00DCD0C800DACEC500D6C9
      C000D8CCC400CEC1BA00A7958E00927E7500937F7600A9978F00D3C8C100E5DC
      D600D3C3BA00C4B2A700C3B0A500C1AFA300C0AEA100C9B9AF0067534B00CDCA
      C9000000000000000000000000000000000000000000BA928400FDFAF900F8F2
      EF00F8F1EF00A27D7100A37D7000A17D7000A27C6F00A27C6E00A17C6D00A17B
      6D00A07B6D00A07B6C00A0796C009F796C00A0796B009F786B009F786B009E78
      6B009E776A009D766A009D7869009D7669009D7569009D7568009C746700F8F1
      ED00F8F1ED00FBF7F500B68C7D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BAA29A00CFB7
      AF00FFFEFE00EBD9D000BE9F920095685B00BD9E9200C6B2AC0097766B009575
      6A009C8680000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DDDDDD00C1714D00E24D
      1000EB591C00ED622000E9662300E5692700C36724001D7610001A890F001B8F
      100022831000357712009E581900D0501800E0471400E53F0F00E5330800DE2B
      0600D5250500CC200300C21C0100B9170000AD1801009027030076400700A82E
      0E009A2E0C007E513F00D0D0D000000000000000000000000000000000000000
      0000A1969200A6979300EAE3DD00E2D8D200E0D5CF00DED3CC00DCD1C800DFD5
      CE00B6A7A0008A746C00C3BBB700DCDBD900DCDBDB00C1BAB6008D787200BCAE
      A700E5DCD600CBBCB100C5B3A700C3B1A600C1AFA400C9B8AC0097837B009287
      82000000000000000000000000000000000000000000BA938500FDFAF900F9F2
      EF00FAF2EF00A37F7200A37E7200A47E7100A27D7100A37D7000A37D7000A27C
      6F00A27C6F00A27C6F00A27B6E00A17B6E00A17B6D00A17A6D00A07A6C00A07A
      6C00A0796B009F796C009E796B009E786B009E796A009E776A009E776A00F8F1
      ED00F8F1EE00FCF8F600B68D7F00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AC93
      8900D1B8B100FFFEFE00B18D8100E1D0C800B08D8100EEDED600936E63008C72
      6D00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7D7D700CB5F2D00E95F
      1A00EE6E2800EA732B00D5702E0095802600CF7A3400687621004B7D1B008777
      2600C4732E00D2722D00E56E2B00EC652500EB5B1D00E84D1700E7421100E534
      0900DE2D0600D4250500CB200300BB1B01009B1D01003B761000338311005B50
      0B0091300D00703B2000C4C4C4000000000000000000E0DCDC00B1A4A0008874
      6F00826D6600DED5D200E7DED800E4DBD500E2D8D200E1D6CF00E1D7D000CCC0
      B9008A787000E0DEDE0000000000000000000000000000000000DEDDDD00907C
      7500D2C7C100DDD3CB00C6B5A900C5B3A700C4B2A600C5B3A700C1B1A700715B
      530074625B009C908C00D1CECB000000000000000000BB958700FDFBFA00FAF3
      EF00F9F3EF00FAF5F200FAF4F100F9F4F100F9F4F100FAF4F100F9F4F000F9F4
      F100F9F4F000F9F4F000F9F4F000F9F3F000F9F4F000F9F3EF00F9F3EF00F8F3
      EF00F8F3EF00F8F3EF00F8F2EE00F9F3EE00F8F2EF00F8F2EE00F8F3EE00F9F1
      EE00F8F2EE00FCF9F700B88F8000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C6D
      6200B89D9200DECAC300E1D3CE00C5A9A000D9C5BC00EFE2D800DCCEC9008663
      5900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4D4D400D4511900EE72
      2800EB7E3300CC77340064812300668B2900DC924600E5994600DF974700E798
      4600F0964500F28D3F00F1843A00EF7A3200ED6B2900EB5E2100EA4E1800E742
      1100E5340900DD290600D3230400BC1F0200723F0A003A8B21003A8B2100398A
      1F00407D1C0056460F00B8B9B8000000000000000000826C6300BCB1AB00DDD6
      D100F1ECE800EAE2DE00E7E0DA00E6DDD800E4DCD500E3D9D200E8E1DC008E7B
      7400C1BAB700000000000000000000000000000000000000000000000000C0B8
      B60099867E00E8E0DB00C7B7AB00C6B5AA00C5B4A800C4B2A600C4B3A800D0C1
      B700BEAEA5009E8C82006F5850000000000000000000BF998C00FEFCFB00FAF4
      F100FAF4F100FAF4F100FAF4F100FAF4F100FAF5F000FAF4F100FAF4F000FAF4
      F000FAF4F000FAF4F100F9F4F100FAF4F000FAF4F000FAF4F000FAF4F000F9F4
      EF00F9F4EF00FAF3EF00F9F3F000FAF3EF00F9F3EF00FAF3EF00F9F3EF00FAF3
      EF00FAF3EF00FDFAF900BA928500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C4B4AF00AA8D
      8200E0D9D300C7B1A800DECBC300FFFFFE00F2E4DE00F2E6DE00F2E4DC00A689
      8100B8A8A5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D3D3D300DB4B0B00ED86
      3700D9873C00608524002CA71E0095893F00EAAB5800F7B65E00F8B65E00F6B2
      5B00F6AC5600F5A35000F4984800F18C3E00EF7D3400ED6C2A00EB5E2100E94D
      1800E6401000E4310800DA270600BD2403006453170045963A0045963A004596
      39004495370053430E00B1B4B10000000000000000008C776D00FAF8F700EFEA
      E500EDE5E100EBE4DF00E9E2DD00E8E0DB00E6DED800E4DCD600EBE5E000755E
      5700E5E3E300000000000000000000000000000000000000000000000000E1E1
      DF007D675F00EBE3DF00C9B9AE00C8B8AC00C6B6AB00C6B4A800C5B2A600C3B1
      A500C5B3A700D1C3B900715A52000000000000000000C09A8D00FEFCFC00FAF5
      F200FAF5F100FAF5F200FAF5F100FAF4F100FAF5F100FAF4F200FAF4F100FAF4
      F100FAF5F100FAF5F100FAF4F000FAF4F100FAF4F100FAF4F100FAF3F000FAF4
      F000FAF3F000FAF4F000FAF3F000FAF4F000FAF3F000FAF3EF00F9F4F000FAF3
      F000FAF4F000FDFAF900BB948700000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009D786C00E6DB
      D400E9E2DC00E1D9D400CEBBB300D8C2BB00FFFFFF00F5E8E000F3E9E200EEE2
      DE00875F5300E0DDDC0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5D5D500DC4C0D00E790
      400097883400588E29009B8D4500ACA75200EABA6900F1C16E00F7C66E00F9C3
      6C00F9BF6700F8B76000F6AA5600F49D4B00F28E4100EF7D3500ED6C2900EB5B
      2000E84A1600E6390D00E02E0700BE280500606B2F0052A3550052A4570052A4
      560051A3540057461400B4B6B40000000000000000008F796F00FAF8F700F5F0
      EE00F0EBE600EDE6E100ECE4E000E9E2DD00E8E0DB00E6DED900EEE7E400705A
      530000000000000000000000000000000000000000000000000000000000E2E0
      E00079635C00E8E1DB00CBBBB100CAB9AF00C8B8AD00C7B7AB00C6B4A900C5B3
      A700C7B6AA00D7C9C200745C55000000000000000000C19C8E00FEFDFC00FAF6
      F300FAF5F200FBF6F400FAF6F300FAF6F300FAF5F300FAF6F300FAF5F300FAF5
      F200F9F6F200F9F5F200FAF5F200FAF5F200FAF5F200F9F4F200F9F5F200F9F5
      F200FAF5F100FAF4F100FAF4F100FAF4F100FAF4F000FAF4F100FAF4F000FAF4
      F000FAF4F000FDFBF900BC958800000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B79F9500CCB5AB00F0E8
      E200EDE6E000F6F4F300B8A49D00A1817600D2BBB200FFFFFF00F5EDE600F5ED
      E600C8B5AF00A187800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DBDBDB00D8561C00D88D
      4200578E28005E903300D5AF6500E6C37300BFB56900B8BE6C00F4D07F00FCD4
      7F00FBCD7900F9C56F00F8BC6600F6AD5800F49D4D00F18D4000EF7B3200ED67
      2600EB531B00E7421100E4330900C62B06006A753D005FB071005FB172005FB1
      72005EB0700062451900BCBEBC000000000000000000917B7200C4B8B200E4DD
      DA00F9F8F700F7F3F100EFE8E400ECE4E000EAE2DE00E8E0DB00EEE7E4008471
      6B00BCB4B200000000000000000000000000000000000000000000000000BDB6
      B2008C7B7300DED4CD00CDBDB300CBBCB100CABAAF00C9B8AD00C9BAAF00D7CB
      C300D1C6C000AE9F9800765F57000000000000000000C29D9000FEFDFC00FAF6
      F300FAF6F300AB887B00AA887A00AA887A00AA877A00A9867A00A9867900A886
      7900A8857800A8857800A8857800A7857800A7857700A7847600A6847600A682
      7600A6837500A6827400A6827400A5817400A5807400A4807300A4807200FAF5
      F100FAF5F100FDFBFA00BD978900000000000000000000000000000000000000
      000000000000000000000000000000000000DED6D300AE8B7F00F0E8E100F1E8
      E300FCFAF800C6B1A900B5A0980000000000C4ADA600D2BBB200FFFFFF00F8F0
      EA00F7EFEA00946F6400D0C7C400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3693800D086
      3F00439326003DA42E00B49C6100B5A769006BAE5900A7A96B00EBD38700FCE0
      8D00FCDA8600FCD37D00FAC87200F8BB6700F6AA5700F49B4900F1853B00EE71
      2E00EB5D2100E94A1600E6380D00CF2D070083572B006ABC89006ABD8C006ABD
      8C0069BC89006F472500C8C9C8000000000000000000E7E4E200C2B7B300A393
      89009D887F00EBE7E500F4EFED00EEE7E200ECE5E100EBE3DF00ECE4DF00CCC3
      BF0074615B00E1DFDF0000000000000000000000000000000000DEDDDD007967
      6000CBC1BB00D5C8C000CFBFB500CEBEB400CCBCB200CDBDB200CCBFB7008671
      69008A787300ABA19C00D8D5D4000000000000000000C39E9100FEFDFD00FAF6
      F400FAF7F400AC897D00AB8A7C00AB897C00AB897B00AB887B00AA887B00AA88
      7A00AA877A00AA867A00A9867900A9877900A9867900A8857900A8867800A885
      7800A8847700A7847700A6847700A6837500A6827500A6827500A5827500FAF5
      F200FAF5F200FDFCFB00BE988B00000000000000000000000000000000000000
      000000000000000000000000000000000000AE8F8200E3D5CE00F1E9E500FCFA
      F900CAB6AE00BEA7A000000000000000000000000000C7B0A800D2BBB300FFFF
      FF00F9F3EE00E5DBD7008F695D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3856000C976
      340041982B0040AE36004E9F440058B6530063C263006FB86C00C0BF8300F7E3
      9A00FEE69600FDDE8A00FBD37F00F9C57000F8B76100F5A55100F2914300F07C
      3300ED672600EA521900E6401000DB310800A237100073C69F0074C7A10074C7
      A1006FB48C0080583E00D6D6D600000000000000000000000000000000000000
      0000BDB2AD00C0B2AD00F8F6F500EEEAE500EEE7E300ECE6E100EBE4DF00EEE7
      E300AB9E980069564E00B8B1AF00DCDADA00DBD9D900B7AFAD006B575100AA9B
      9600DFD4CD00D6C9C000D0C1B800CFC0B600CEBEB400D5C9C000AC9A9100A89C
      96000000000000000000000000000000000000000000C3A09200FEFDFD00FAF7
      F500FBF7F400FBF7F600FBF7F600FBF8F500FBF7F500FBF7F500FBF7F500FBF7
      F500FBF7F500FBF7F500FBF6F500FBF6F400FAF7F400FAF6F500FBF7F400FAF7
      F400FAF6F300FAF5F300FAF6F300FAF5F200FAF5F300FAF5F200FAF6F300FAF5
      F300FAF6F200FDFCFB00C09A8C00000000000000000000000000000000000000
      0000000000000000000000000000D2C2BB00C9ADA400F2EBE600FCFAF900CFBA
      B300C2ACA6000000000000000000000000000000000000000000C8B2AA00D3BC
      B300FFFFFF00F9F5F300B4999000BBA9A3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6AA9500C763
      24004A9A340047B43F0053BA4E005FC05E006CC76E0077CC7C008FAC7B00DFD3
      9A00F8E89F00FDE49400FCDC8800FBD07900F9C06900F6AB5800F3984800F082
      3900ED6B2900EB581D00E8431100DD330800AA3812007ABA99007CCFB2007CCF
      B3007397740097806F0000000000000000000000000000000000000000000000
      0000E7E5E3009E898000F7F4F300F3EFEC00EFE9E500EEE8E300EDE6E100EBE3
      DF00EEE7E300CCC2BF00887771006C5650006B56500089767100C8BEB700E3D9
      D400DBCEC600D9CDC400D4C7BF00D1C3B900D0C1B700DBD1C80089746C00D9D7
      D4000000000000000000000000000000000000000000C5A29400FEFEFD00FBF7
      F500FBF7F600FBF8F600FBF7F700FCF8F600FBF8F700FCF8F600FBF8F600FBF7
      F600FBF7F500FBF7F500FBF7F500FBF8F600FBF7F500FBF7F500FBF6F400FAF7
      F400FAF6F400FAF6F300FAF7F400FAF6F400FBF6F300FAF6F300FAF6F400FAF6
      F400FAF6F300FEFCFB00C09B8E00000000000000000000000000000000000000
      00000000000000000000EEEBE900BA998C00EFE6DF00FCFBF900D3BEB700C6B3
      AB0000000000000000000000000000000000000000000000000000000000C9B3
      AA00D3BCB400FFFFFF00F4EEEB00906C5D00E2DDDD0000000000000000000000
      0000000000000000000000000000000000000000000000000000E2DAD600C460
      3200638835004BB6450059BD550065C3660072CA76007ED0850088CC910099B2
      8900C3C08E00E6D49000F8DD8C00FCD58000F9C46E00F7B35E00F39E4E00F186
      3C00EE702D00EB5C1F00E5471400D1370C0080895A00805128006E8E5F00706A
      3C0076582E00BCB8B50000000000000000000000000000000000000000000000
      000000000000B4A59F00D3C9C400F6F3EF00F0EAE700EFE9E600EEE8E300EDE6
      E100EBE4DF00ECE5E000EEE9E500EFEAE600EEE7E300EBE4DF00E4DBD400DFD5
      CD00DDD2CA00DCCFC700D9CCC400D3C5BD00D8CCC300AE9F9800887974000000
      00000000000000000000000000000000000000000000C6A39500FEFEFE00FBF8
      F600FBF8F600FCF8F700FBF8F700FBF8F700FBF8F600FCF8F700FBF8F700FCF8
      F600FCF8F600FBF8F600FCF7F600FCF7F500FBF8F600FBF7F600FBF7F500FBF8
      F600FBF7F500FAF7F400FAF7F400FBF7F500FAF6F400FBF7F400FAF7F400FAF7
      F400FAF6F300FEFDFC00C19D9000000000000000000000000000000000000000
      00000000000000000000CAB1A700DECCC300FDFBFA00D7C2BB00CCB8B1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBB4AD00D3BDB400FFFFFF00D3C3BD00A3877D0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D095
      790098692C004FB84B005EC05D006CC76E0078CD7E0086D48F0097DBA200A7E2
      B300B2E7C000AFC19D00DDC88300F4D28100F8C77100F8B76100F5A25000F18A
      3E00EF742E00EB5E2100E3491600BB4B1C006CB57F0098371100A62E0B009E32
      0600A2776200DCDCDC0000000000000000000000000000000000000000000000
      000000000000B1A39B00DBD4CF00F4F0EE00F1ECE900F0EBE800EFEAE500EEE8
      E400EDE6E200EBE5DF00E9E3DD00E9E0DB00E7DED900E5DCD600E3DAD300E1D7
      D100E0D5CD00DDD2CB00DCCFC700D7CAC200D8CCC300BBAFA80083726F000000
      00000000000000000000000000000000000000000000C7A49600FFFEFE00FBF9
      F600FCF9F600FBF9F700FCF8F700FBF9F700FCF9F800FBF9F700FCF8F700FBF8
      F700FBF9F700FCF8F700FCF9F700FBF8F700FBF8F700FBF8F700FBF7F700FCF8
      F600FBF7F500FAF8F500FBF7F500FBF7F500FBF7F500FAF7F500FBF7F500FAF7
      F500FAF6F400FEFDFC00C29E9000000000000000000000000000000000000000
      000000000000E8DEDB00C9AA9E00FDFBFA00DAC6BF00D1BCB600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCB6AD00D4BDB500FFFFFF009F7F7300D5CAC700000000000000
      000000000000000000000000000000000000000000000000000000000000E3D8
      D300BA653E005C94410063C2630070C975007ED0860090D89A00A3E0AE00B4E6
      C100C3EED000B3CCB800B3B99800D5C28300F4C47100F8B76100F5A45100F18C
      3F00EF762F00E95E2000E1491600BF380A0072834E00727542007E6B37009C54
      2F00CBC2BE000000000000000000000000000000000000000000000000000000
      0000E5E1DF00AB9A9100F8F6F500F3EFEC00F3EEEA00F2ECE900F1EBE800F0EA
      E600EFE8E400EDE7E200EBE5E000EAE3DE00E8E1DB00E7DED900E6DCD500E4DA
      D400E1D7D100E0D6CE00DED2CC00DBCFC700D5C8BF00E0D6D100806C6600CAC6
      C4000000000000000000000000000000000000000000C8A59800FFFEFE00FBF8
      F700FBF8F800B3918500B2918500B2918400B2918400B1918400B1908300B090
      8300B0908300B0908200B08F8100B08F8200AF8E8100AF8E8100AF8E8000AE8D
      8000AE8D8000AE8C8000AE8D7F00AD8B7F00AD8C7E00AC8B7E00AC8B7E00FBF7
      F600FBF7F500FEFDFD00C3A09100000000000000000000000000000000000000
      000000000000C5A79B00F4EDEA00DCC9C200D4C1BA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CDB7AF00D4BDB500EEE8E600926E6100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D7B19E00A55E2F005FAF5A0075CB7A0085D38D009ADCA600B0E5BC00A4BF
      A700D2F3DD00DEF6E800E1F7EC00CABF8F00F0C16D00F8B76000F5A24F00F18B
      3D00EB732D00D85C2100BB4D1900875F2C0061AA6B005DAF6D0075663100B396
      8500000000000000000000000000000000000000000000000000000000000000
      0000B9AAA300DED6D300F8F5F400F5F0ED00F4EFEC00F5F1EE00F6F3F000F4F0
      EC00F0EBE700EFE9E400EDE7E200EBE5E000EBE3DE00E9E1DC00E7DFD900E6DD
      D600E4DCD500E8DFD900E9E1DC00E3DAD300D8CAC300DBCEC600C1B3AE008979
      74000000000000000000000000000000000000000000C9A69900FFFEFE00FBF9
      F800FCF9F800B3938600B3928600B3938500B3918600B3928500B3928500B291
      8400B2918500B2908400B1908300B1908300B1908300B08F8300B08F8200B08F
      8100AF8F8200AF8E8100AF8E8000AF8E8000AE8D8000AE8D8000AD8C8000FBF8
      F600FCF8F500FEFDFD00C5A19300000000000000000000000000000000000000
      0000DECDC700DECAC100DFCCC500D7C4BE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CFB8B000D5BEB600BFA8A000BFAAA2000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D39F8800A3602F006FAE69008AD69400A3E1AE00AED4B600A4A4
      8400AFB19600D1DDD000B1AE9100CFB27100E0B16400DEA25500EB994900F188
      3B00E6702B00997D40006F8E51005EA9650059AA63006A6D2F00A7846B00DDDE
      DD00000000000000000000000000000000000000000000000000000000000000
      0000B8AAA200E1D9D500FBF9F800F8F5F300FAF7F600DDD5D100D6CDC800F8F5
      F400F9F7F600F4F1EE00F0EAE700EEE7E200ECE5E000EBE4DF00EBE4DE00EFE8
      E400F1ECE900D0C6C100D9CFCB00F4F1EE00ECE5E000E0D7CF00C4B9B2008E7F
      7A000000000000000000000000000000000000000000CAA79A00FFFEFE00FCFA
      F800FDFAF900FDF9F800FCF9F800FCF9F800FCFAF800FCF9F800FCFAF800FCF9
      F800FCF9F800FCF9F800FCF9F700FCF9F700FCF9F700FCF9F700FBF8F700FCF9
      F700FBF9F700FCF8F700FBF8F700FBF8F700FBF9F700FBF8F700FCF8F700FBF9
      F700FCF8F700FEFEFD00C6A2950000000000000000000000000000000000F3EE
      EC00CDAEA400E1CFC800DBC8C200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0BAB200D5BEB60099766B00E7E1
      DE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6A28B00AD5F310084A87400AEE4B900C0E1C700A7AC
      9200AAA48300B8B6A500D0CEC100BBA27200C0B19300D3D8C900C27A3B00E87D
      3700E06A2700B6591F006985450057A259006E682C00A9846C00DDDEDD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BAACA400E0D9D500E2DCD800B2A19800B5A69F00B8A9A300A691
      8700C7BAB400EDE8E600F8F4F300EFE9E500EEE7E300EEE7E200E0D9D500AC9E
      99009F8A8100AE9F9A00AA9A9200A9988E00DAD1CD00D6CCC700AB9B95000000
      00000000000000000000000000000000000000000000CBA99B00FFFFFE00FDFA
      F900FCFAF900FCFAF900FCFAF900FCFAF900FCFAF900FCFAF900FCFAF900FDFA
      F800FCFAF800FCFAF800FCFAF900FCF9F900FCF9F900FCF9F800FCF9F800FCF9
      F800FCF9F700FCF9F800FCF9F700FCF9F800FCF9F700FBF9F700FCF9F700FBF9
      F800FBF9F700FEFEFD00C7A4960000000000000000000000000000000000D5BC
      B200E3D1CA00DECCC50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D1BCB400D5BFB700A788
      7E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DDB6A400B664400099946E00D1ECD600ECFB
      F100F6FCF900FCFEFD00FEFFFE00B4A89500D5D8D000EDFBF700C8C6B100D572
      2F00C06D2C00629B5200618C42008F643400BA9C880000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BAAAA400B8A8A100E3DFDD000000000000000000E9E7
      E600C6BCB700AA968C00FBF9F800F2EDE900EFE9E500F5F1EF0084706900ABA1
      9C00E5E2E1000000000000000000D9D4D200AB9C9400AD9E9600000000000000
      00000000000000000000000000000000000000000000CCAA9D00FFFFFF00FDFA
      FA00FCFAF900FCFAF900FDFAF900FCFAF900FDFAF900FDFAF900FDFAF900FDFA
      F900FCFAF900FCFAF800FDFAF900FCFAF900FCFAF900FCFAF800FDFAF800FCF9
      F800FCFAF900FCF9F800FCF9F800FCF9F800FCF9F800FCF9F800FCF9F800FCF9
      F800FCF9F800FEFEFE00C7A4970000000000000000000000000000000000CDAC
      9E00E0CEC8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3BEB600AD80
      7100000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7DCD800C8917700A2674600C2B4
      A600EEF0EC00FDFFFD00BCB4A700BFB8AA00F8FEFB00D5D8CF00B66E3E00D35B
      1900986A2600916C3200BB896D00D5CDC6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA9A9100ECE6E300F6F2EF00F2EDE900E6E0DD0088746F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCAB9E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C8A69900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2DAD800C8A0
      9000AD715700B07F6900B9907C00C5A99A00C0A39400AC5D3700C9663A00D587
      6300D1A79400DAD5D00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6BAB300D2C6C100FCFAF900FCFAF900D0C5C000ADA09D000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D8C0B700CFB0A400CFB0
      A400CFB0A400CFB0A400CFB0A400CFB0A400CFB0A400CFB0A400CFB0A300CFAF
      A300CFAFA300CFAFA300CFAFA300CFAEA300CFAEA300CEAFA300CEAFA200CEAE
      A200CEAEA200CEAEA200CEAEA200CEAEA200CEAEA200CEAEA200CEADA100CEAD
      A100CDADA100CDADA100D4BDB400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D8D8D800D1D1D100D4D4D40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E6E3E000A48D8300A28D8200A28C8200A18C8000DCD7D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000655753003221
      1B0033211B0032211B0032211A0032211A006357530000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006054500031201900301F1900302019003120
      1900302019006054500000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000513A2F00563D
      3300563D3300553D3300553D330050382F003E2A230000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004E362C00533A3100523B3000523A3000533A
      30004D372C003C28200000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BAB6
      B400958277008C644C008D60460098562F0097562E008D6045008C634B009481
      7600B8B4B1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D3CB
      C6009C6F57009858300000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B1857400FDFCFC00F4EC
      E500F6EBE400F6EBE400F4EBE400F4EBE300F4EBE300F4EAE300F3EAE200F4EA
      E200F4E9E200F3EAE200F3E9E100F3E8E100F3E8E100F2E8E100F2E6DD00F0E3
      DA00F4EDE900AB7B6B0000000000000000000000000000000000573E3400573F
      3400000000000000000000000000563E3400442F270034231C0034231C003322
      1C0034221C0034221C0033221C0032221B0033211C0033221C0033211B003221
      1B0033211B0032211B00422D2500543C3200543B3100DCDCDC0000000000DCDC
      DC00533B3100412D240000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A89F9A0091614300A265
      3B00B67F4F00C6935F00CA976300D5A66E00D4A66E00CA986300C6925F00B57E
      4E00A16339008E5D4000A69C9700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3E1E000B0928000945D
      3C00C39466009A5A330000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2867500FEFDFC00F6EC
      E600F6ECE600F6ECE500F4EBE500F4EBE500F4EBE400F4EBE400F4EBE400F4EA
      E300F3EAE300F3E9E200F4E9E200F2E8E100F2E8E000F1E6DE00EFE2DB00EDE0
      D600F2E9E500AB7E6D0000000000000000000000000000000000584036004531
      2800000000000000000000000000583F3500573F3500573F3500583F3500573F
      3400563F3500563E3400563F3400563E3400563E3400563E3400563D3300553E
      3300563E3300553D3300553C3300553C3300422E2600DDDDDD0000000000DDDD
      DD00543C3200422D250000000000000000000000000000000000000000000000
      0000000000000000000000000000CBCAC90090685000A96F4400C9966200D5A7
      6F00D6A77000D5A77000D6A86F00D5A76F00D5A76F00D5A76F00D5A86F00D5A7
      6F00D5A76F00C8966100A86C40008E654C00C8C6C50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6B4AB009A654700B6845B00D9B1
      7F00DBB682009D5E370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3877700FEFDFC00F7ED
      E800F6ECE600F4EDE600F4ECE600F4ECE600F6ECE500F4ECE400F4EBE400F4EB
      E400F4EBE300F3E8E200F1E5DE00F0E4DB00EDE0D900EADDD500E8DAD100E6D6
      CE00EADFD800AC7E6E00000000000000000000000000000000005A4137004732
      290037251E0037251E00463229005940370058403600D8AB7500D7AB7400D7AB
      7300D7AA7300D6AA7300D6AA7200D6A97200D7A97200D7A97100D6A97100D6A9
      7100D5A97000D5A87000D6A87000563E3400442E270034221C0034221C00442E
      2700553D3300442E260000000000000000000000000000000000000000000000
      00000000000000000000B5B0AD0098634100C08C5B00D6A87100D6A97100D6A8
      7100D6A97100D6A97000D6A97100D5A97000D6A87000D6A87000D6A87000D6A9
      7100D6A87000D5A86F00D6A77000BF8A5800965E3B00B1ABA800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D9D1CD00A67D6500AB765000D4AC7E00DDB78500DBB5
      8100DDB887009E613B00DADADA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5897900FEFDFD00F7ED
      E800F7EDE900F6EDE800F6EDE600F6EDE600F6ECE600F6ECE500F6ECE500F5EB
      E300F3EAE200F0E4DC00E9D9D100E2CFC600DEC9C000DCC7BD00DAC4B900D7C0
      B600DAC7BF00AE807000000000000000000000000000000000005B4338005B42
      39005B4338005B4238005B4238005A4238005A423800D8AC7500D8AC7500D7AB
      7500D8AB7500D7AB7400D7AB7400D7AB7300D6AA7300D6AA7300D6AA7200D6AA
      7200D6A97100D6A97200D6A97100583F3500573F3500583F3500573E3400563F
      3400573E3400442F270000000000000000000000000000000000000000000000
      000000000000B7B2AF00A0684100C9986500D7AA7300D7A97300D6A97200D6A9
      7300D7A97200D6A97200D6AA7200D7AA7200D7A97100D6A97200D6A97200D6A9
      7200D6A97100D6A97200D6A97100D6A97100C89663009C623C00B2ACA9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BB9E8C00A26D4900CBA27600E0BD8D00DDBA8800DDB98600DCB8
      8500DEBC8B00A1653E00A36E4C009255320092553100966140009C6B4F00A67E
      6800B99C8B00D7D0CB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B68A7A00FEFEFD00F7EF
      E900F7EFE900F7EFE900F7EFE800F6EDE800F6EDE800F6EDE600F6EDE600F4EC
      E600F4E8E200EADDD300B2897A00A5776600A4756400A4746400A4736300A373
      6300A3736300A2726200000000000000000000000000000000005D453A005D44
      3A000000000000000000000000005C4439005C443900D8AD7700D9AD7700D8AD
      7600D8AD7600D8AC7500D8AC7500D8AB7500D7AC7400D7AB7400D7AB7400D7AA
      7400D7AA7300D6AA7300D7AA7300594037005940360000000000000000000000
      0000584036004531270000000000000000000000000000000000000000000000
      0000CBC9C7009D6A4800CC9F6D00D7AC7600D7AB7500D7AB7400D8AB7400D7AB
      7400D7AA7400D7AB7400D7AB7400D7AB7300D7AA7300D7AA7400D6AA7300D7AA
      7300D7AA7300D6AA7300D7AA7300D7AA7300D6AB7300CC9D69009A644100C5C3
      C10000000000000000000000000000000000000000000000000000000000D1C0
      B500A7775600C2956D00E0C09200E1C08F00DFBD8C00DFBC8B00DEBC8A00DEBB
      8900DFBF9000D4AE8000D8B38400DFBD8C00DEBC8B00D5AF8000CEA67900C294
      6800AF7B5300995F3900A0735700C3AEA2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B68C7D00FEFEFE00F7F0
      EA00F7F0E900F6EFE900F7EFE900F7EFE800F7EFE900F6EDE800F7EDE800F7ED
      E600F2E7E000E8D7CF00AB7E6D00FFFFFF00FFFEFE00FFFCFB00FDFAF800FBF6
      F300C4A79C00B8A09900000000000000000000000000000000005F463C004B36
      2D000000000000000000000000005E453B005D443A00D9AF7900D9AE7800D9AE
      7800D9AD7800D9AE7700D9AE7700D9AC7600D8AD7600D7AC7600D7AC7600D7AC
      7500D8AB7400D7AB7400D7AB74005A42380047322A0000000000000000000000
      0000594137004632280000000000000000000000000000000000000000000000
      000096735B00C5936500D9AD7800D8AC7600D8AC7600D8AC7500D7AD7600D7AC
      7600DEB88700DBB58300D8AE7800D7AC7500D7AB7500D7AB7500D7AB7400D7AB
      7500D8AB7500D8AB7400D7AB7400D7AB7500D7AB7400D9AB7600C2906100926B
      5300000000000000000000000000000000000000000000000000B9937900BB8F
      6D00E3CAA900E5C99D00E1C29200E1C19100E1C09100E0BF9000E0BF8F00E0BE
      8D00E0BD8C00DFBE8D00DFBD8C00DEBB8900DEBA8800DDBB8800DDBA8700DEBA
      8900DDBB8800DDBA8900C89C7000A6704800A06F5200D4C8C100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B88E7E00FFFEFE00F8F1
      EB00F8F0EB00F7F0EB00F7F0EA00F7F0EA00F7F0E900F7EFE900F6EFE900F7ED
      E800F2E6E100E7D7CF00B0857400FFFEFE00FEF9F800FCF6F300FBF2ED00C6A9
      9E00BAA39B00000000000000000000000000000000000000000060483E004D37
      2E003C2922003C2922004C372D005F473C005F463C00DAB07A00D9B07A00D9B0
      7A00D9AF7A00D9AE7900D8AE7900D9AE7900D8AE7800D9AE7700D8AE7700D8AD
      7700D8AC7600D8AC7600D8AC75005C433A0049332B0037261F0037251F004833
      2A005A42380047322A000000000000000000000000000000000000000000AEA7
      A200B17D5500DAB17D00D8AE7800D9AD7700D8AD7800D8AE7800D9AD7700D8AD
      77009E653D00B8855900D7AF7E00DBB38000D8AE7800D8AD7600D8AC7700D8AD
      7700D8AD7600D8AC7600D8AC7600D7AC7600D8AC7600D8AC7600DAAF7B00AE77
      4D00A9A09B000000000000000000000000000000000000000000C09D8500C299
      7800EBDBC600F4E7D000EEDCB800EAD3AA00EAD2A700E9D1A600E8CEA200E7CC
      9F00E5C79A00E3C39500E0BF8F00E0BE8D00E0BD8D00DFBD8C00DFBC8A00DEBC
      8A00DEBB8800DDBA8700DFBA8900DFBB8B00C59A6D009C633E00C3AB9E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B98F8000FFFEFE00F8F2
      EC00F8F1EB00F7F1EB00F7F1EB00F7F0EB00F8F0EA00F7F0EA00F7EFEA00F5ED
      E700F2E5E000E8DAD000B68C7D00FFFEFD00FCF6F200F9F2ED00C9ABA100C0A7
      9F0000000000000000000000000000000000000000000000000061493F006249
      3E0061483F0061493E0061483E0060483D0061483D00DBB48100DDB68400DFB8
      8700DFBA8A00DFBC8C00E0BD8D00E0BD8E00E0BC8E00E0BB8C00DEB98A00DEB8
      8600DDB58200DBB38000D9AF7B005E453B005D443A005D453A005D453A005D44
      39005D443A0049342C0000000000000000000000000000000000000000009C73
      5600CFA37300DAB07C00D9AF7A00D9AF7A00DAAF7900D9AF7900DAAF7A00D9AE
      79009E653D00DCC6B500B4856000C2936600DBB68500DBB27E00D9AE7800D9AE
      7800D8AD7800D8AE7800D9AE7800D9AD7700D9AE7800D9AE7700D9AE7A00CDA1
      6F00986B4F00000000000000000000000000000000000000000000000000D7C9
      BF00B88F6E00D5B89D00F4ECD800F3E7CE00EDDAB600EBD5AC00EBD5AB00EBD3
      AB00ECD7B100F1E2C500F6ECD700F6EBD700F4E8D400F4E6CF00F2E2C900EEDB
      BC00E9CFAB00E2C39500DFBC8B00DEBB8900DFBD8C00D7B08300A46E4800C1A6
      9600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA918200FFFEFE00F8F2
      EC00F8F2EC00F8F1EC00F8F1EC00F7F1EC00F7F0EB00F8F1EA00F6EEE700F4EB
      E400F0E5DD00E9DAD100BC958400FFFEFD00F9F2ED00CCB0A400C3ACA3000000
      0000000000000000000000000000000000000000000000000000644B4000634A
      4100000000000000000000000000624A3F0062493F00E3C39500E3C39600E3C2
      9500E2C19500E2C19500E2C09300E2C09300E2C09300E1BF9100E1BF9000E1BE
      9000E0BE8F00E0BD8F00E0BC8E005F463C005E463B0000000000000000000000
      00005E463B004B362D0000000000000000000000000000000000BDB8B500B684
      5D00DCB58300DAB17B00DAB17C00DAB07C00DAB07B00DAB17C00DAB07B00DAB0
      7B009D653D00EFE4DC00F8F3EF00D3B8A200B17F5500CCA27300DEB98800DBB1
      7D00DAAF7A00D9AF7900D9AF7900D9AF7900D9AF7900D9AF7900D9AF7900DBB4
      8000B17C5500B5B0AD0000000000000000000000000000000000000000000000
      000000000000CBB3A100BC8E6C00E3CDB600F7EEDC00F2E4C800EEDAB400ECD7
      AF00EDDBB600C0957200C0926900BA885F00B7855C00B9886100C2977400D0AD
      8E00E2CAB000F2E4CE00ECD8B700E3C59800E0BE8D00DFBE8D00DBB98B00A56F
      4900CEBDB100000000000000000000000000000000009D5F38009D776200DBD8
      D8000000000000000000000000000000000000000000BB928300FFFFFF00F8F2
      ED00F8F2ED00F8F2ED00F8F2ED00F8F1ED00F8F1EC00F6EFE900F5ECE500F2E8
      E200EFE2DB00E8D9D100C19B8B00FEFEFD00CFB2A700C7B0A900000000000000
      0000000000000000000000000000000000000000000000000000654C4200523C
      3200000000000000000000000000644B4100644C4000E4C59B00E4C49A00E4C5
      9900E3C49900E3C49700E3C39700E3C29700E3C19600E3C29600E2C19600E2C0
      9400E2C09300E2C09300E2C0920060483E004D372F0000000000000000000000
      00005F473C004D362D0000000000000000000000000000000000A1908500C99E
      7400DCB58300DBB27E00DBB17E00DBB27D00DBB17D00DAB17D00DBB27D00DBB1
      7D009E643C00ECDFD600F7F0EC00FAF5F100F2E9E200C5A08300B6845800D6AE
      8000DDB78600DAB27C00DAB07C00DAB07B00DAB17B00DAB07B00DAB07A00DCB3
      7F00C6996E009A887C0000000000000000000000000000000000000000006698
      8500CBD5D20000000000E1DCD600C3A08600C9A38300EFE2CF00F6EDD900F0E2
      C200F0DEBD00B3805900DBD1C9000000000000000000DFD7CD00DACEC300CCB3
      9F00B78B6700BE916C00E1C9AF00F1DFC500E7CCA200E1C09000E1C09100D3AD
      8100A774520000000000000000000000000000000000A1633C00BC8C5E008F59
      3C00C7BAB30000000000000000000000000000000000BB928400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FBF8F800F9F5F300F6F0
      EF00F2EBE800EEE2DF00C5A19100D5BEB600CBB4AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000674E4400533D
      3300402E2600402D2600523C3300664D4300664D4200E5C79E00E6C89E00E5C6
      9D00E5C79D00E5C69C00E4C69C00E4C59A00E5C59A00E4C59A00E4C59A00E3C3
      9800E3C39800E3C39700E3C29600634A3F004F3830003D2A23003D2A23004E38
      300061493E004E372F00000000000000000000000000000000009E806900D5AE
      8000DDB68300DCB48000DCB37F00DBB38000DCB48000DCB38000DBB37E00DBB3
      7F009E643C00EDE1D800F7EFEA00F6F1EC00F9F3F000FBF6F400E7D7CB00B789
      6600C0916500DDB88A00DCB68500DAB17D00DBB27D00DBB27D00DBB27C00DCB3
      8000D2A97D009977600000000000000000000000000000000000ABCABF003585
      68002A7A5E007BA293000000000000000000D8CBC000BD947400D8BBA000F7ED
      DD00F7EDD800B6845E0000000000000000000000000000000000000000000000
      000000000000DACEC200B9906D00D5B59800F0E0C400E6CBA100E1C39400E4C6
      9800B98A6400CFBBAE00000000000000000000000000A4694100DCB37E00D3A9
      7600985D3A00AE918100000000000000000000000000C9AB9F00BC948400BD95
      8400BC938400BD938500BC938400BC938300BB928400BB928300BA918300BA90
      8200BA918100B9908100B9908000D0BAB2000000000000000000000000000000
      000000000000000000000000000000000000000000000000000069504600694F
      4500694F4400684F4500684F4400684F4500684E4400E6CAA200E6C9A100E6C9
      A100E6C9A100E6C8A000E6C89F00E5C89E00E5C79E00E5C79D00E5C79D00E5C6
      9D00E4C69B00E4C69B00E4C69A00644B4000644B4100644B4000634B4000634A
      4100634A3F004F39310000000000000000000000000000000000AB7E5D00DBB8
      8800DCB68200DDB58100DCB58100DDB58100DDB58100DCB48100DCB48100DCB4
      81009D643C00EEE2DA00F7F1EC00F8F2EE00F7F2EE00F9F3EE00F9F6F300FAF6
      F300D8BFAB00B17D5500CBA07300DFBD8D00DBB37F00DBB37F00DBB37F00DBB4
      8000DAB58500A47553000000000000000000000000000000000065A58F0062BA
      9F004EC8A200379C7B0038795F00B0CAC0000000000000000000D1BBA800C19A
      7700E6D4BE00B989630000000000000000000000000000000000000000000000
      00000000000000000000E7E4E200BE987800DEC5AA00EDD9B800E4C69800E4C8
      9A00D4B28900B68F7500000000000000000000000000A86E4700E0B78200DEB6
      8100DFBA8600B38257009A6B5300D9D4CF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006A5147006A51
      47000000000000000000000000006A51460069504500553E3500553E3500553D
      3500543D3400543D3500543D3500543D3400543D3400533D3300533D3300533D
      3400523D3300523C3300523C3300664D4200664D420000000000000000000000
      0000654C4100503A320000000000000000000000000000000000B1815D00E1BE
      9100DDB68400DDB78300DEB68300DDB68300DDB68300DDB68300DDB68300DDB6
      82009D653C00EFE4DC00F8F3EF00F9F3F000F8F4F000F8F4F000F8F3EF00F9F4
      F100FBF6F400F1E7DE00C19A7C00B3805400DCB48100DCB48100DCB48100DCB4
      8100DFBC8E00AA795400000000000000000000000000000000004594790076D6
      BB003CC2970043C49C0045BA95002B795D00C8C8C8000000000000000000E8E2
      DE00C9AA8E00BD8E670000000000000000000000000000000000000000000000
      0000000000000000000000000000DDD2C900BF946F00F0DFC200E5C99D00E5C9
      9C00E3C59C00B1835F00000000000000000000000000AF7A5100E3BE8B00E2BC
      8900E2BB8700E2BE8B00CDA4760097603D00CBB9AE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D5349005841
      37000000000000000000000000006C5247006B5247006B5247006B5147006A51
      47006A5147006A5146006A5046006A5045006950460069504500684F45006850
      4500684F4500684F4500684F4500684E4400533D340000000000000000000000
      0000664D4300523C330000000000000000000000000000000000B3846100E4C3
      9700DEB88600DEB88500DEB88500DEB78500DDB78500DEB88600E0BA8900E0BD
      8B009D643C00EFE5DE00F9F5F200F9F6F300F9F6F300F9F5F200F9F5F200F7F0
      EB00E9DCD100DAC4B500B1876B00A26D4400DDB68300DDB68300DDB58300DDB6
      8200E2C09600AD7D5700000000000000000000000000000000003993740084E0
      C60041C59B003CC398004ECAA500277657000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD8F6900F2E2C700E8CEA400E6CB
      9F00E9D2AA00B4825B00000000000000000000000000B4805800EBD0A100E9CA
      9B00E6C29100E5C39300D7B48600AA754E00CFB8AA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E554A005A42
      390047322A0047322B005A4238006D5349006D534900DFBB8900DFBB8900E0BA
      8800DFBA8800DFBA8800DEB98700DEB98700DFB88600DEB88600DEB88600DEB7
      8500DDB78400DEB78500DDB684006A504600553E3600432F2700422E2700553D
      3500694F4400553D340000000000000000000000000000000000B0896700E2C4
      9D00DFBB8A00DEB98800DFB98700E0BC8B00E3C29100E6C59500E5C69600E5C5
      96009D643C00F0E7DF00FAF7F400FAF7F500FAF8F500F9F5F300F0E7E000E2D1
      C300BE9B82009D684300C49B7000E3C09000E0BB8900DDB78400DDB78500DFB8
      8600E0C19900A97F5E0000000000000000000000000000000000479B7C0084DC
      C4004ECCA6003DC49A004ECBA5002C826300BACDC50000000000000000000000
      0000000000000000000000000000000000000000000000000000348669004D79
      6400D0D7D4000000000000000000E7DFD800C0946F00EEE2CE00F3E7CF00ECD8
      B500E7D2AD00BB906C00000000000000000000000000B8865E00EFD8AC00EFD8
      AC00EEDAAF00C9A17800AF826300DFD7D2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000070564C007057
      4B006F564B006F564B006F554B006F554A006E554B00E0BC8B00E0BC8A00E0BB
      8B00E0BB8A00E0BB8A00DFBB8900DFBA8900DFBA8900DFBA8800DFB98800DEB9
      8700DFB88600DEB88600DEB885006B5248006B5147006B5247006B5246006A51
      46006A504600553E360000000000000000000000000000000000A78D7600DFC1
      9D00E1BE8D00E1BE8D00E5C79700E7CA9B00E6C99B00E7CA9B00E6CA9C00E7C9
      9B009C643B00F0E8E100FBF8F600FBF8F700F4EFEA00E7D9D000CDB39F009F6D
      4C00B7896100E2C29600E7CA9B00E7C99B00E6CA9C00E5C59600E0BB8B00DFBB
      8A00DDBD9900A1846D000000000000000000000000000000000069AE960082D1
      BA0066D6B7003FC79C0047C9A10041AD8A003F806600D9E1DD00000000000000
      000000000000000000000000000000000000000000000000000035896B005BB3
      96001C614400799A8B000000000000000000DED1C500C39C7C00DBC1A500F4E9
      D600E5D0B700C7A68900000000000000000000000000BB8C6400F2DFB700EAD6
      AF00BA8E6500C7AA9600000000000000000000000000C5A39700BA8A7900BA8A
      7800BA887700B9897700B9877600B9887700B8877600B7867500B7867500B785
      7400B6857400B6847300B6837100B5837100B4827100B4837000B4826F00B282
      6F00B2816F00BE9B8E000000000000000000000000000000000071584D007157
      4D0000000000000000000000000070574C0070574C00E1BE8D00E1BD8D00E1BD
      8C00E0BC8C00E0BC8C00E0BC8B00E0BC8B00E0BB8A00DFBB8A00DFBB8A00DFBB
      8900DFBA8800DFBA8800DEB987006D5449006C53490000000000000000000000
      00006B5348005840370000000000000000000000000000000000A79B8F00D8B9
      9800E7CA9E00E9CEA100E9CEA100E9CDA200E9CEA100E9CEA100E9CDA200E9CE
      A1009C643B00F1E9E200F7F3F100EBE2D800D9C5B600AD826500A6764E00DBBB
      9000E9CEA100E9CEA200E9CEA100E9CEA100E8CEA100E9CEA200E9CEA100E6C9
      9D00D5B49200A294880000000000000000000000000000000000B1D2C60060B4
      990089E3CC004DCEA80041C89F004BCCA600389D7C002E785A00B1C9BF000000
      0000000000000000000000000000000000000000000000000000368C6D007DDD
      C3004AC59E0030906E002F695000ACBEB60000000000EAEBE900D3BDA900C5A1
      8200CDA98B00DDCCBF00000000000000000000000000BF916900DDC39E00B88A
      6500DFD3CB0000000000000000000000000000000000BC8D7E00FDFBF900FDFA
      F900FCFAF800FCFAF800FCF9F700FCF9F700FCF9F700FBF8F600FCF9F500FCF8
      F500FBF8F500FBF7F400FBF7F400FAF6F300FAF5F300FAF5F300FAF6F200FAF4
      F100FAF4F100B48270000000000000000000000000000000000073594E005F46
      3D0000000000000000000000000072594E0072584E00E2BF8F00E2BF8F00E1BE
      8E00E1BE8E00E1BD8E00E1BD8C00E1BD8D00E1BD8C00E0BC8C00E0BC8B00E0BC
      8B00E0BC8A00E0BB8A00DFBB8A006E554B005A43390000000000000000000000
      00006D5449005942380000000000000000000000000000000000C3C0BD00D0AB
      8900F0DDBC00EBD3A800EAD2A800EBD3A700EBD2A800EBD3A800EAD3A800EBD3
      A7009D633B00ECE1D800E0D1C500BA987F009F6A4600CCA98000EAD2A700EAD3
      A800EBD2A700EAD3A700EAD3A700EAD3A800EAD2A700EBD3A800EBD3A800F0DD
      BB00CAA48200BEBAB70000000000000000000000000000000000000000004DA4
      86008DD7C30076DEC30045CBA40041C9A1004DCEA80047B59400277F5F003179
      5D0084AD9D00B5CCC300C9D8D2000000000000000000C4D4CF00378E700075DB
      BE003EC49A0046C79F0047BB9600267B5C0055846F00D1DAD60000000000EAE4
      DF00CEAF980000000000000000000000000000000000C2966D00C7A58A000000
      00000000000000000000000000000000000000000000BD907F00FDFBFA00F9F3
      F000F8F2ED00F8F2ED00F8F2ED00F8F2ED00F8F1ED00F8F1EC00F8F1EC00F8F1
      EB00F8F0EB00F8F0EA00F7EFEA00F7F0EA00F7EFEA00F7F0E900F7EFE900F6ED
      E900FAF4F100B584710000000000000000000000000000000000745B50006047
      3E004D372E004D372F0060473E00735A4F00745A4F00E2C09100E2C09000E2C0
      8F00E2BF8F00E1BF8F00E2BF8E00E1BE8F00E2BD8E00E1BE8E00E1BD8D00E1BD
      8C00E1BD8C00E1BD8C00E0BC8B0071574C005C443B0048352D0049342C005C44
      3A006F564C005B443A000000000000000000000000000000000000000000B499
      7D00EAD8BE00EEDAB200EDD8AE00EDD7AE00EDD8AE00EDD8AE00ECD7AE00EDD8
      AE009C633B00C9AB97009F6E4B00BD966E00E9D3AA00EDD7AE00ECD7AE00ECD8
      AE00EDD8AE00EDD7AE00EDD8AE00ECD7AE00ECD8AE00ECD8AE00EDD9B200E9D7
      BC00B0917600000000000000000000000000000000000000000000000000BBD9
      CF004AA687009FE6D30076DFC3004ACEA70042CBA20049CDA60055D0AE004ABB
      9800389B7A002C866600247959002171520023735400287D5E003FA0800054CF
      AA003EC59B003EC49B0040C59D004ACAA40040AC88002571530083A697000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD928100FDFCFA00F9F4
      F000F9F3F000F9F3EF00F8F2EF00F8F2ED00F8F2ED00F8F2ED00F8F1EC00F8F1
      ED00F7F1EC00F8F1EC00F7F0EB00F7F0EA00F7F0EB00F7EFEA00F7EFEA00F7EF
      EA00FAF6F200B784730000000000000000000000000000000000765D5200765B
      5100765C5100755B5000755B5100755C5000755B5000E4C49700E6C79B00E7C9
      A000E8CBA300E9CDA500E9CDA700E9CEA800E9CEA800E8CDA500E7CBA200E6C8
      9E00E5C69A00E4C49600E2C0910072594E0072584E0071584D0071584D007158
      4D0071574C005C453C000000000000000000000000000000000000000000BAB6
      B100D4B49200F4E8CB00EEDCB500EEDCB400EEDCB400EEDCB400EEDDB500EFDC
      B4009C633A00AD815A00E2C9A300EFDCB500EFDCB500EEDDB500EEDCB400EEDC
      B500EEDCB500EEDCB400EEDCB500EFDCB400EEDCB500EFDCB500F3E8CC00D1AE
      8C00B5B0AB000000000000000000000000000000000000000000000000000000
      0000A4CEC0004FAB8E009CE2D10089E4CD0056D4B00043CCA40044CBA30049CD
      A70050D0AB0054D1AE0057D1B00059D2B00058D2AF0057D1AE0057D1AE0056D1
      AD0040C79E003FC69D003FC69D003FC69C0045C89F004EC9A4003A9E7C00397B
      6000B4C9C0000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BF938300FDFCFB00F9F4
      F100F9F4F000F9F3F100F9F3F000F8F3EF00F8F2EF00F9F2EF00F8F3EF00F8F2
      EF00F8F1ED00F8F1EC00F8F1EC00F8F1EC00F8F1EB00F8F1EB00F7F0EB00F7F0
      EB00FBF6F300B787750000000000000000000000000000000000775D5200775E
      5300000000000000000000000000765D5200765C5200ECD2AF00EBD3AF00EBD3
      AF00EBD2AE00EBD2AD00EBD2AC00EBD1AC00EAD1AB00EAD1AB00EAD0AA00EACF
      AA00EACFA900E9CFA800E9CDA800735A4F0073594F0000000000000000000000
      000072594E005F463D0000000000000000000000000000000000000000000000
      0000B19B8400E7D4BB00F3E6C700F0E1BA00F0E1BB00F0E1BA00F0E1BB00F1E1
      BA00F0E1BB00F1E1BB00F0E1BB00F1E1BA00F1E1BA00F0E1BA00F1E1BA00F0E1
      BB00F0E1BA00F1E1BB00F0E2BA00F1E1BA00F0E1BB00F2E6C600E5D2B900AD96
      7F00000000000000000000000000000000000000000000000000000000000000
      000000000000AED3C60047A5880087D2BD00A4EBDB007FE1C80055D3B0004ED1
      AC0056D4B1005CD6B50060D8B70067DABC0067D9BC0066D9BB0066D9BB005FD6
      B6005AD4B20053D0AD004BCCA60040C89E0040C79E0040C79E0049CAA40051C2
      A1003A8D6F006396810000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1958500FEFDFB00FAF4
      F100FAF6F100FAF4F100F9F4F100F9F3F100F9F3F000F9F3EF00F9F3EF00F9F3
      EF00F8F2EF00F9F2EF00F8F2EF00F8F2ED00F8F1EC00F8F1EC00F7F1EC00F7F0
      EB00FBF7F400B988770000000000000000000000000000000000785F5300634C
      4200000000000000000000000000775E5300775E5300EDD6B300EDD5B300ECD4
      B200ECD4B200ECD4B100ECD4B100ECD3B000ECD3AF00EBD3AF00EBD3AE00EBD2
      AD00EBD2AD00EBD1AD00EAD1AC00755B510061483E0000000000000000000000
      0000745A50005F473D0000000000000000000000000000000000000000000000
      0000DAD9D800C3A58500F0E4CE00F4E9CA00F2E6C000F2E6C000F2E5C100F2E5
      C100F2E5C100F2E5C100F2E6C100F3E5C100F2E6C100F2E5C000F2E5C100F2E6
      C000F2E6C000F2E5C100F2E5C100F2E6C000F4EACA00EFE3CD00BF9F8000D5D4
      D300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D4E6E00065B199005BB4980097D8C700C2F3E900B6F1
      E400A1EBDA008DE7D10082E4CC0077E1C70071DFC3007AE1C70083E3CC0078E0
      C60070DEC20070DDC20070DDC2006CDBBF005DD5B3004DCDA80066D8B60088DA
      C30057A98E0074AF990000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2968700FEFDFC00FAF6
      F300F9F6F200F9F6F200F9F4F100F9F4F100FAF4F000F9F4F000F9F4F000F9F3
      F000F9F3EF00F9F3EF00F9F2EF00F9F3ED00F9F2ED00F8F1ED00F8F1EC00F8F1
      EC00FBF8F500BA8979000000000000000000000000000000000079605500644C
      4300503C3300513B3300644D4300795F5400785F5400EDD8B700EDD8B700EDD8
      B600EDD7B600EDD8B500EDD6B400EDD5B400EDD5B300EDD5B300ECD5B300ECD5
      B200ECD4B100ECD4B100ECD4AF00775D5100624A40004F3830004F3831006149
      3F00755C500061493F0000000000000000000000000000000000000000000000
      000000000000C6C3C100CDAD8B00F0E4CE00F7F0D500F4EAC500F4E9C500F3EA
      C600F4E9C600F4E9C600F3E9C600F3E9C600F4E9C500F4EAC600F4EAC500F4E9
      C500F4EAC600F4EAC600F4E9C600F7F0D500EFE2CE00CAA98400C2BFBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B7D9CE006EB79F004DAB8C0075C2
      AB0098D6C500B1E5D800B9EADE00CDF6EE00CDF6EE00B9E9DE00B0E4D600B3F0
      E3007AE3CA007AE3CA007AE3CA007AE3C9008CE7D200B0EDDE007BC2AC0057A2
      8600C0D9D0000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3998900FEFDFC00FAF7
      F300FBF7F300FAF6F200FAF7F200FAF6F200FAF6F200FAF4F100F9F4F100F9F4
      F000F9F3F100F9F4F000F9F3F000F9F3F000F9F3EF00F9F3EF00F8F2EF00F8F2
      ED00FCF9F600BB8C7B00000000000000000000000000000000007B6156007B61
      56007A6156007A6155007A6055007A6055007A605500EFDABB00EFDABA00EFDA
      BA00EFDAB900EFD9B900EED9B900EED8B700EED8B800EED9B700EDD7B700EDD7
      B500EDD7B500EDD7B500EDD6B400785D5300775E5300775E5300775D5200765D
      5300775D5200624A400000000000000000000000000000000000000000000000
      00000000000000000000C7C4C200C6A78700EAD8C000FAF6E300F6F0D300F5EC
      CA00F5ECCA00F5EDCA00F5ECCA00F5ECCA00F5EDCA00F5ECCA00F5EDC900F5EC
      CA00F5EDCA00F6EFD300FAF5E300E8D7BF00C2A58300C2C0BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3EEEB00A8D3
      C50080BEAA0062B0970059AD910040A180003FA0800057AB91003E9F7E00B9F3
      E70084E7D10084E7D1008CE9D400AEF0E2009DD8C70052A589009AC6B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C69B8A00FEFDFD00FBF8
      F400FAF7F400FAF7F300FAF7F300FAF7F300FAF6F300F9F6F200FAF6F200FAF6
      F200FAF6F100F9F4F100F9F4F100F9F4F100F9F4F000F9F3EF00F9F3EF00F8F3
      EF00FCF9F700BC8F7F00000000000000000000000000000000007C6257007B62
      57000000000000000000000000007B6157007B6156007B6156007A6056007B61
      56007A6156007A6156007B6155007A6055007A6055007A60550079605500795F
      5500795F5500795F5500795F5400795F5400785E540000000000000000000000
      0000785E5300634B410000000000000000000000000000000000000000000000
      0000000000000000000000000000DEDDDD00B6A08900DCC1A100F1E7D300FAF8
      E800F9F5DF00F8F2D600F7F2D400F5EFCD00F6EFCD00F7F2D400F8F2D600F9F5
      DF00FAF8E800F1E7D300DBC0A000B39D8600D9D9D80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003FA18100C0F4
      EA008FEBD800AAF1E100B6E9DE0068B69E0077B7A000E1ECE900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C69C8D00FEFEFD00FBF8
      F600FBF8F400FAF7F600FAF7F400FAF7F300FAF7F300FAF7F300FAF6F300FAF6
      F200F9F6F300FAF6F200F9F4F200F9F4F100F9F4F100FAF4F100F9F3F000F9F3
      F000FCF9F800BD918100000000000000000000000000000000007C625800674F
      45000000000000000000000000007C6258007C6257007C6257007B6257007B61
      56007C6257007C6256007B6156007B6256007B6156007B6156007B6156007A60
      55007A6156007B6156007A6056007A605500654D430000000000000000000000
      0000795F5500644C420000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BEBBB700BDA48A00D9BB
      9800E6D3B900F1E7D300F3EBD900FBF8EB00FBF8EB00F3EAD800F1E6D300E6D2
      B800D8B99700BBA38600BBB7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000040A48300CCF8
      F000C1F4EA008ACCB90059AC9100C3DED5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C7A09100FEFEFD00FBF8
      F700FBF8F600FBF8F600FBF8F600FAF8F400FBF7F400FAF7F400FBF7F400FAF7
      F400FAF6F300FAF6F300FAF6F200FAF6F200F9F6F100F9F6F100F9F4F100F9F4
      F100FAF7F500BE928300000000000000000000000000000000007D635800684F
      4500543D3500543D3500684F45007D6358007C63580000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B615600664E4400513D3300523D3300664D
      44007A615500654D430000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D3D2
      D000B1A99F00B5A38B00B8A38A00D0B08A00D0B08A00B8A18900B5A18A00B0A7
      9D00D1D0CF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042A68600ADE0
      D30059B093009CCCBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9A29300FFFEFE00FBF9
      F700FBF9F700FBF9F600FDF9F600FBF8F600FAF8F600FBF8F600FBF8F400FAF7
      F400FBF7F400FAF7F400FAF7F300FAF7F300FAF7F300FAF6F200F9F4F200F8F2
      EE00F8F4F300C0958400000000000000000000000000000000009B8982007D63
      58007D6358007D6358007D6358007D6358008C7A720000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099867E007C6257007C6157007B6257007C62
      56007B6157008A78710000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000043A8870078BF
      A800E3EEEC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      80000001FFFFFFFFFFE007FFFFF81FFF80000001FFFFFFFFFF8001FFFFF81FFF
      80000001F01FF01FFE00007FFFF81FFF80000001E00FE00FFC00003FFC60063F
      80000001E00FE00FF800001FF800001F80000001E00FE00FF000000FF000000F
      80000001E10FE10FE0000007F000000F80000001E00FE00FE0000007F000000F
      80000001E000000FC0000003F800001F80000001E000000FC0000003F800001F
      80000001F000001FC0000001F000000F80000001FFC007FF80000001F000000F
      80000001FFE00FFF800000018003C00180000001FFE00FFF800000018007E001
      80000001FFC007FF800000018007E00180000001FFC003FF80000001800FE001
      80000001FF8003FF800000018007E00180000001FF0101FFC00000018003C001
      80000001FF0381FFC0000001F000000F80000001FE07C0FFC0000003F000000F
      80000001FC0FE07FC0000003F800001F80000001FC1FF07FE0000003F800001F
      80000001F83FF83FE0000007F000000F80000001F87FFC3FF000000FF000000F
      80000001F0FFFE1FF800000FF000000F80000001E1FFFF0FFC00001FF800001F
      80000001E3FFFF8FFE00007FFC60063F80000001E7FFFFCFFF0000FFFFF81FFF
      80000001FFFFFFFFFFC003FFFFF81FFF80000001FFFFFFFFFFFC7FFFFFF81FFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      C07FFE03FFFFFFFFFFFFFFFFFFFFFFFFC07FFE03FFE007FFFFE3FFFFFF800003
      CE000023FF8001FFFF83FFFFFF800003CE000023FE00007FFF03FFFFFF800003
      C0000003FC00003FFC01FFFFFF800003C0000003F800001FF80003FFFF800003
      CE000073F000000FE00000FFFF800003CE000073F000000FC000003FFF800007
      C0000003E0000007C000001FFF80000FC0000003E0000007E000000FFF80001F
      CE000073C0000003F80000078F80003FCE000073C0000003E40180078780007F
      C0000003C0000003C303F803838000FFC0000003C0000003C0C3FC0380FFFFFF
      CE000073C0000003C063FE03807FFFFFCE000073C0000003C0FFFF03807FFFFF
      C0000003C0000003C07FC60380FFFFFFC0000003C0000003C03FC30383800003
      CE000073C0000003C01FC08387800003CE000073C0000003E00180279F800003
      C0000003E0000007E000001FFF800003C0000003E0000007F0000007FF800003
      CE000073F000000FF8000003FF800003CE000073F000000FFC000003FF800003
      C0000003F800001FFF000007FF800003C0000003FC00003FFFC0001FFF800003
      CE000073FE00007FFFFFC03FFF800003CE000073FF8001FFFFFFC0FFFF800003
      C07FFE03FFE007FFFFFFC3FFFF800003C07FFE03FFFFFFFFFFFFC7FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
