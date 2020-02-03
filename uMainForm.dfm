object frmFFUI: TfrmFFUI
  Left = 0
  Top = 0
  Caption = 'FFMPEG UI v2.0'
  ClientHeight = 729
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
  OnResize = FormResize
  DesignSize = (
    1008
    729)
  PixelsPerInch = 96
  TextHeight = 13
  object lblVideoFile: TLabel
    Left = 8
    Top = 11
    Width = 196
    Height = 15
    Caption = #36873#25321#35270#39057#25991#20214'/'#25991#20214#22841'/'#32593#22336#65306
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
    TabHeight = 40
    TabOrder = 0
    TabWidth = 140
    object tsInfo: TTabSheet
      Caption = #25991#20214#20449#24687'(Info)'
      object mmoInfo: TMemo
        Left = 0
        Top = 0
        Width = 984
        Height = 594
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object tsPlay: TTabSheet
      Caption = #35270#39057#25773#25918'(Play)'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 626
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
        object btnPlay: TButton
          Left = 8
          Top = 4
          Width = 89
          Height = 29
          Caption = #25773#25918
          TabOrder = 0
        end
        object btnPause: TButton
          Left = 109
          Top = 4
          Width = 89
          Height = 29
          Caption = #26242#20572
          TabOrder = 1
        end
        object btnStop: TButton
          Left = 312
          Top = 4
          Width = 89
          Height = 29
          Caption = #20572#27490
          TabOrder = 2
        end
        object btnFullScreen: TButton
          Left = 210
          Top = 4
          Width = 89
          Height = 29
          Caption = #20840#23631
          TabOrder = 3
        end
      end
      object pnlVideo: TPanel
        Left = 0
        Top = 42
        Width = 984
        Height = 552
        Align = alClient
        BevelKind = bkSoft
        BevelOuter = bvNone
        Caption = 'pnl1'
        Color = clWhite
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
        ExplicitHeight = 584
      end
    end
    object tsConv: TTabSheet
      Caption = #26684#24335#36716#25442'(Converter)'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 626
    end
    object tsSept: TTabSheet
      Caption = #20998#31163'(Separate)'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 626
    end
    object tsMerge: TTabSheet
      Caption = #21512#24182'(Merge)'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 626
    end
    object tsLive: TTabSheet
      Caption = #35270#39057#30452#25773'(Live)'
      ImageIndex = 4
      DesignSize = (
        984
        594)
      object rgWeb: TRadioGroup
        Left = 10
        Top = 3
        Width = 145
        Height = 580
        Anchors = [akLeft, akTop, akBottom]
        Caption = #30452#25773#28304#65306
        ItemIndex = 0
        Items.Strings = (
          #30913#30424#25991#20214
          'USB '#25668#20687#22836
          'IP   '#30456#26426
          #26700#38754)
        TabOrder = 0
        ExplicitHeight = 612
      end
      object pnlWeb: TPanel
        Left = 168
        Top = 9
        Width = 804
        Height = 574
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'pnlWeb'
        Ctl3D = False
        ParentCtl3D = False
        ShowCaption = False
        TabOrder = 1
        ExplicitHeight = 606
      end
    end
    object tsConfig: TTabSheet
      Caption = #37197#32622'(Config)'
      ImageIndex = 6
      DesignSize = (
        984
        594)
      object rg1: TRadioGroup
        Left = 12
        Top = 16
        Width = 961
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = #20351#29992#30340#35270#39057#24211#65306
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'FFMPEG(v4.2.0)'
          'MPV (v2.0.0.0)'
          'VLC (v3.0.8)')
        TabOrder = 0
      end
      object rg2: TRadioGroup
        Left = 12
        Top = 72
        Width = 961
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = #26159#21542#20351#29992'GPU'#21152#36895#65306
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'YES ('#38656#35201' NVIDIA '#26174#21345#65292'X64'#24179#21488')'
          'NO')
        TabOrder = 1
      end
    end
  end
  object srchbxSelectVideoFile: TSearchBox
    Left = 224
    Top = 8
    Width = 776
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object stat1: TStatusBar
    Left = 0
    Top = 705
    Width = 1008
    Height = 24
    Panels = <>
    SimplePanel = True
  end
  object dlgOpenVideoFile: TOpenDialog
    Filter = #38899#35270#39057#25991#20214'(*.MP4;*.MKV)|*.MP4;*.MKV'
    Left = 276
    Top = 147
  end
  object tmrPlay: TTimer
    Enabled = False
    Interval = 100
    Left = 276
    Top = 219
  end
end
