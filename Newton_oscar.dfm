object Form1: TForm1
  Left = 83
  Top = 15
  Width = 1846
  Height = 1159
  Anchors = []
  Caption = 'pilotage du banc d'#39'essai MOBY-DECK'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnMouseWheel = FMW
  PixelsPerInch = 96
  TextHeight = 13
  object GLSceneviewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 1345
    Height = 1105
    Camera = GLCamera1
    PostRender = GLSceneviewer1PostRender
    FieldOfView = 140.200408935547
    OnMouseDown = GLSceneviewer1MouseDown
    OnMouseMove = GLSceneviewer1MouseMove
  end
  object Panel1: TPanel
    Left = 1344
    Top = 0
    Width = 492
    Height = 1105
    Color = clSilver
    TabOrder = 1
    object lblFile: TLabel
      Left = 40
      Top = 976
      Width = 50
      Height = 16
      Caption = 'Attente...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblDurT: TLabel
      Left = 99
      Top = 977
      Width = 22
      Height = 13
      Caption = 'durT'
    end
    object lblIntg: TLabel
      Left = 168
      Top = 976
      Width = 17
      Height = 13
      Caption = 'intg'
    end
    object LblParc: TLabel
      Left = 152
      Top = 1024
      Width = 21
      Height = 13
      Caption = 'parc'
    end
    object LblUmaxMotG: TLabel
      Left = 192
      Top = 992
      Width = 59
      Height = 13
      AutoSize = False
      Caption = 'LblUmaxMotG'
    end
    object LblUminMotG: TLabel
      Left = 192
      Top = 1008
      Width = 59
      Height = 13
      AutoSize = False
      Caption = 'LblUminMot'
    end
    object Label11: TLabel
      Left = 160
      Top = 1045
      Width = 69
      Height = 13
      Caption = 'ActInvCycD'#233'p'
    end
    object Label12: TLabel
      Left = 240
      Top = 1056
      Width = 23
      Height = 13
      Caption = 'UDP'
    end
    object LblTimerUdp: TLabel
      Left = 384
      Top = 1056
      Width = 97
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '15.5 '#181's'
    end
    object LblTraiteUdp: TLabel
      Left = 384
      Top = 1072
      Width = 97
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '15.5 '#181's'
    end
    object LblFiltreUdp: TLabel
      Left = 384
      Top = 1088
      Width = 97
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '15.5 '#181's'
    end
    object LblNbMax: TLabel
      Left = 328
      Top = 1056
      Width = 57
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = '123456789'
    end
    object LblNbMin: TLabel
      Left = 328
      Top = 1088
      Width = 57
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = '123456789'
    end
    object LblNbMid: TLabel
      Left = 328
      Top = 1072
      Width = 57
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = '123456789'
    end
    object LblChangeUdp: TLabel
      Left = 264
      Top = 1088
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '15.5 '#181's'
    end
    object Label24: TLabel
      Left = 240
      Top = 1072
      Width = 21
      Height = 13
      Caption = 'FLM'
    end
    object Label25: TLabel
      Left = 240
      Top = 1088
      Width = 24
      Height = 13
      Caption = 'Ceint'
    end
    object GroupBoxMot: TGroupBox
      Left = 8
      Top = 8
      Width = 241
      Height = 313
      Caption = 'Moto-r'#233'ducteur'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 136
        Top = 24
        Width = 75
        Height = 13
        Caption = 'MOTEUR AR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 136
        Top = 120
        Width = 75
        Height = 13
        Caption = 'MOTEUR GA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 136
        Top = 216
        Width = 76
        Height = 13
        Caption = 'MOTEUR DR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Gauge2: TGauge
        Left = 104
        Top = 40
        Width = 121
        Height = 17
        BackColor = clYellow
        ForeColor = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 300
        ParentFont = False
        Progress = 0
        ShowText = False
      end
      object LblMaxGag2: TLabel
        Left = 225
        Top = 45
        Width = 15
        Height = 10
        Caption = '300'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object Gauge3: TGauge
        Left = 104
        Top = 137
        Width = 121
        Height = 16
        BackColor = clYellow
        ForeColor = clRed
        MaxValue = 300
        Progress = 0
        ShowText = False
      end
      object LblMaxGag3: TLabel
        Left = 225
        Top = 142
        Width = 15
        Height = 10
        Caption = '300'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object Gauge1: TGauge
        Left = 104
        Top = 232
        Width = 121
        Height = 17
        BackColor = clYellow
        ForeColor = clRed
        MaxValue = 300
        Progress = 0
        ShowText = False
      end
      object LblMaxGag1: TLabel
        Left = 225
        Top = 237
        Width = 15
        Height = 10
        Caption = '300'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object edtm2: TLabeledEdit
        Left = 8
        Top = 40
        Width = 41
        Height = 21
        AutoSize = False
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = 'c.ang ('#176')'
        EditLabel.Color = clBtnFace
        EditLabel.ParentBiDiMode = False
        EditLabel.ParentColor = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 0
        Text = '2.35'
        OnChange = edtm2Change
      end
      object edtm3: TLabeledEdit
        Tag = 1
        Left = 8
        Top = 136
        Width = 41
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'c.ang ('#176')'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 1
        Text = '90'
        OnChange = edtm3Change
      end
      object edtm1: TLabeledEdit
        Left = 8
        Top = 232
        Width = 41
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'c.ang ('#176')'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 2
        Text = '90'
        OnChange = edtm1Change
      end
      object TBar2: TTrackBar
        Left = 8
        Top = 96
        Width = 225
        Height = 25
        Max = 90
        Min = -90
        Orientation = trHorizontal
        Frequency = 10
        Position = 0
        SelEnd = 0
        SelStart = 0
        TabOrder = 3
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = TBar2Change
      end
      object TBar3: TTrackBar
        Left = 8
        Top = 192
        Width = 225
        Height = 25
        Max = 90
        Min = -90
        Orientation = trHorizontal
        Frequency = 10
        Position = 0
        SelEnd = 0
        SelStart = 0
        TabOrder = 4
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = TBar3Change
      end
      object TBar1: TTrackBar
        Left = 8
        Top = 288
        Width = 225
        Height = 25
        Max = 90
        Min = -90
        Orientation = trHorizontal
        Frequency = 10
        Position = 0
        SelEnd = 0
        SelStart = 0
        TabOrder = 5
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = TBar1Change
      end
      object edtf2: TLabeledEdit
        Left = 56
        Top = 40
        Width = 41
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'Couple (N.m)'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 6
      end
      object edtf3: TLabeledEdit
        Left = 56
        Top = 136
        Width = 41
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'Couple (N.m)'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 7
      end
      object edtf1: TLabeledEdit
        Left = 56
        Top = 232
        Width = 41
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'Couple (N.m)'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 8
      end
      object LblEdtMes2: TLabeledEdit
        Left = 8
        Top = 75
        Width = 41
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'm.ang ('#176')'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 9
        OnChange = edtm2Change
      end
      object LblEdtMes3: TLabeledEdit
        Left = 8
        Top = 171
        Width = 41
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'm.ang ('#176')'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 10
        OnChange = edtm2Change
      end
      object LblEdtMes1: TLabeledEdit
        Left = 8
        Top = 267
        Width = 41
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'm.ang ('#176')'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 11
        OnChange = edtm2Change
      end
      object LblEdtEcr2: TLabeledEdit
        Left = 56
        Top = 75
        Width = 41
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'e.ang ('#176')'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 12
        OnChange = edtm2Change
      end
      object LblEdtEcr3: TLabeledEdit
        Left = 56
        Top = 171
        Width = 41
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'e.ang ('#176')'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 13
        OnChange = edtm2Change
      end
      object LblEdtEcr1: TLabeledEdit
        Left = 56
        Top = 267
        Width = 41
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'e.ang ('#176')'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 14
        OnChange = edtm2Change
      end
      object LblEdtCor2: TLabeledEdit
        Left = 104
        Top = 75
        Width = 41
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'p.ang ('#176')'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 15
        OnChange = edtm2Change
      end
      object LblEdtCor3: TLabeledEdit
        Left = 104
        Top = 171
        Width = 41
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = 'p.ang ('#176')'
        EditLabel.ParentBiDiMode = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 16
        OnChange = edtm2Change
      end
      object LblEdtCor1: TLabeledEdit
        Left = 104
        Top = 267
        Width = 41
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'p.ang ('#176')'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 17
        OnChange = edtm2Change
      end
      object ChkInvBiel: TCheckBox
        Left = 152
        Top = 153
        Width = 73
        Height = 17
        Caption = 'Inversion'
        TabOrder = 18
        OnClick = ChkInvBielClick
      end
    end
    object GroupBoxCadr: TGroupBox
      Left = 8
      Top = 328
      Width = 241
      Height = 369
      Caption = 'Cadre mobile sup'#233'rieur'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object lblDzMin: TLabel
        Left = 6
        Top = 320
        Width = 3
        Height = 13
        Color = clCream
        ParentColor = False
      end
      object lblDzMax: TLabel
        Left = 6
        Top = 336
        Width = 3
        Height = 13
        Color = clCream
        ParentColor = False
      end
      object Label13: TLabel
        Left = 112
        Top = 327
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 208
        Top = 327
        Width = 26
        Height = 13
        Caption = '100%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object chkMiCourseAuto: TCheckBox
        Left = 8
        Top = 304
        Width = 97
        Height = 17
        Caption = 'Mi-course auto'
        TabOrder = 0
      end
      object edtcmax: TLabeledEdit
        Left = 186
        Top = 342
        Width = 41
        Height = 21
        EditLabel.Width = 56
        EditLabel.Height = 13
        EditLabel.Caption = 'Course (cm)'
        LabelPosition = lpLeft
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 1
        Visible = False
        OnChange = edttheChange
      end
      object TBar7: TTrackBar
        Left = 112
        Top = 306
        Width = 121
        Height = 23
        Max = 100
        Orientation = trHorizontal
        Frequency = 10
        Position = 50
        SelEnd = 0
        SelStart = 0
        TabOrder = 2
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsAuto
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 208
        Width = 241
        Height = 92
        TabOrder = 3
        object Label8: TLabel
          Left = 8
          Top = 72
          Width = 21
          Height = 13
          Caption = '0.25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 216
          Top = 72
          Width = 21
          Height = 13
          Caption = '0.52'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 96
          Top = 28
          Width = 21
          Height = 13
          Caption = 'Fr'#233'q'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 96
          Top = 12
          Width = 21
          Height = 13
          Caption = 'Amp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblPompAmp: TLabel
          Left = 224
          Top = 12
          Width = 5
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblPompFreq: TLabel
          Left = 224
          Top = 28
          Width = 5
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object ChkRampPomp: TCheckBox
          Left = 64
          Top = 72
          Width = 89
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'Rampe 3 sinus'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          OnClick = ChkRampPompClick
        end
        object TBar6: TTrackBar
          Left = 8
          Top = 47
          Width = 225
          Height = 26
          Max = 520
          Min = 250
          Orientation = trHorizontal
          Frequency = 10
          Position = 380
          SelEnd = 385
          SelStart = 375
          TabOrder = 1
          ThumbLength = 15
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = TBar6Change
        end
        object TBar11: TTrackBar
          Left = 120
          Top = 28
          Width = 105
          Height = 13
          Max = 100
          Orientation = trHorizontal
          Frequency = 10
          Position = 10
          SelEnd = 0
          SelStart = 0
          TabOrder = 2
          ThumbLength = 12
          TickMarks = tmBottomRight
          TickStyle = tsNone
        end
        object TBar10: TTrackBar
          Left = 120
          Top = 12
          Width = 105
          Height = 13
          Max = 100
          Orientation = trHorizontal
          Frequency = 10
          Position = 10
          SelEnd = 0
          SelStart = 0
          TabOrder = 3
          ThumbLength = 12
          TickMarks = tmBottomRight
          TickStyle = tsNone
        end
        object edtdZ: TLabeledEdit
          Left = 16
          Top = 28
          Width = 41
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Hauteur (m)'
          EditLabel.Color = clBtnFace
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentBiDiMode = False
          EditLabel.ParentColor = False
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpAbove
          LabelSpacing = 3
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '0.667'
          OnChange = edtdZChange
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 112
        Width = 241
        Height = 97
        TabOrder = 4
        object Label19: TLabel
          Left = 88
          Top = 28
          Width = 21
          Height = 13
          Caption = 'Fr'#233'q'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 88
          Top = 12
          Width = 21
          Height = 13
          Caption = 'Amp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 6
          Top = 78
          Width = 15
          Height = 13
          Caption = '-30'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 215
          Top = 78
          Width = 18
          Height = 13
          Caption = '+30'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblMesRoul: TLabel
          Left = 56
          Top = 24
          Width = 3
          Height = 13
        end
        object lblroulamp: TLabel
          Left = 224
          Top = 12
          Width = 5
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblroulfreq: TLabel
          Left = 224
          Top = 27
          Width = 5
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object TBar13: TTrackBar
          Left = 112
          Top = 28
          Width = 113
          Height = 13
          Max = 100
          Orientation = trHorizontal
          Frequency = 10
          Position = 10
          SelEnd = 0
          SelStart = 0
          TabOrder = 0
          ThumbLength = 12
          TickMarks = tmBottomRight
          TickStyle = tsNone
        end
        object edtphi: TLabeledEdit
          Left = 16
          Top = 23
          Width = 41
          Height = 21
          EditLabel.Width = 53
          EditLabel.Height = 13
          EditLabel.Caption = 'Roulis ('#176')'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          OnChange = edttheChange
        end
        object TBar9: TTrackBar
          Left = 8
          Top = 62
          Width = 225
          Height = 14
          Max = 100
          Orientation = trHorizontal
          Frequency = 5
          Position = 0
          SelEnd = 0
          SelStart = 0
          TabOrder = 2
          ThumbLength = 12
          TickMarks = tmBottomRight
          TickStyle = tsNone
          OnChange = TBar9Change
        end
        object TBar5: TTrackBar
          Left = 8
          Top = 44
          Width = 225
          Height = 20
          Max = 300
          Min = -300
          Orientation = trHorizontal
          Frequency = 25
          Position = 0
          SelEnd = 0
          SelStart = 0
          TabOrder = 3
          ThumbLength = 12
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = TBar5Change
        end
        object TBar12: TTrackBar
          Left = 112
          Top = 12
          Width = 113
          Height = 13
          Max = 100
          Orientation = trHorizontal
          Frequency = 10
          Position = 10
          SelEnd = 0
          SelStart = 0
          TabOrder = 4
          ThumbLength = 12
          TickMarks = tmBottomRight
          TickStyle = tsNone
        end
        object Roulistriangle: TRadioButton
          Left = 48
          Top = 72
          Width = 113
          Height = 17
          Caption = 'Rampe triangle'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = RoulistriangleClick
          OnMouseDown = RoulistriangleMouseDown
          OnMouseUp = RoulistriangleMouseUp
        end
        object Roulissinus: TRadioButton
          Left = 144
          Top = 72
          Width = 113
          Height = 17
          Caption = 'Rampe sinus'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = RoulissinusClick
          OnMouseDown = RoulissinusMouseDown
          OnMouseUp = RoulissinusMouseUp
        end
      end
      object chkJoystick: TCheckBox
        Left = 8
        Top = 350
        Width = 65
        Height = 17
        Caption = 'JoyStick'
        TabOrder = 5
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 16
        Width = 241
        Height = 97
        TabOrder = 6
        object Label17: TLabel
          Left = 87
          Top = 28
          Width = 21
          Height = 13
          Caption = 'Fr'#233'q'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 87
          Top = 12
          Width = 21
          Height = 13
          Caption = 'Amp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 6
          Top = 78
          Width = 15
          Height = 13
          Caption = '-30'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 215
          Top = 78
          Width = 18
          Height = 13
          Caption = '+30'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbltangamp: TLabel
          Left = 224
          Top = 12
          Width = 5
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbltangfreq: TLabel
          Left = 224
          Top = 28
          Width = 5
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblmestang: TLabel
          Left = 60
          Top = 27
          Width = 3
          Height = 13
        end
        object TBar15: TTrackBar
          Left = 111
          Top = 28
          Width = 113
          Height = 13
          Max = 100
          Orientation = trHorizontal
          Frequency = 10
          Position = 10
          SelEnd = 0
          SelStart = 0
          TabOrder = 0
          ThumbLength = 12
          TickMarks = tmBottomRight
          TickStyle = tsNone
        end
        object TBar8: TTrackBar
          Left = 8
          Top = 63
          Width = 225
          Height = 14
          Max = 100
          Orientation = trHorizontal
          Frequency = 5
          Position = 0
          SelEnd = 0
          SelStart = 0
          TabOrder = 1
          ThumbLength = 12
          TickMarks = tmBottomRight
          TickStyle = tsNone
          OnChange = TBar8Change
        end
        object TBar4: TTrackBar
          Left = 8
          Top = 46
          Width = 225
          Height = 20
          Max = 300
          Min = -300
          Orientation = trHorizontal
          Frequency = 25
          Position = 0
          SelEnd = 0
          SelStart = 0
          TabOrder = 2
          ThumbLength = 12
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = TBar4Change
        end
        object edtthe: TLabeledEdit
          Left = 16
          Top = 24
          Width = 41
          Height = 21
          EditLabel.Width = 68
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Tangage ('#176')'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentBiDiMode = False
          EditLabel.ParentFont = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 3
          Text = '0'
          OnChange = edttheChange
        end
        object TBar14: TTrackBar
          Left = 111
          Top = 12
          Width = 113
          Height = 13
          Max = 100
          Orientation = trHorizontal
          Frequency = 10
          Position = 10
          SelEnd = 0
          SelStart = 0
          TabOrder = 4
          ThumbLength = 12
          TickMarks = tmBottomRight
          TickStyle = tsNone
        end
        object Tangagesinus: TRadioButton
          Left = 136
          Top = 72
          Width = 113
          Height = 17
          Caption = 'Rampe sinus'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = TangagesinusClick
          OnMouseDown = TangagesinusMouseDown
          OnMouseUp = TangagesinusMouseUp
        end
        object Tangagetriangle: TRadioButton
          Left = 40
          Top = 72
          Width = 97
          Height = 17
          Caption = 'Rampe triangle'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = TangagetriangleClick
          OnMouseDown = TangagetriangleMouseDown
          OnMouseUp = TangagetriangleMouseUp
        end
      end
      object Edit1: TEdit
        Left = 8
        Top = 328
        Width = 121
        Height = 21
        TabOrder = 7
        Text = 'Edit1'
      end
    end
    object GroupBoxRess: TGroupBox
      Left = 8
      Top = 704
      Width = 241
      Height = 57
      Caption = 'Ressort'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object edtspring: TLabeledEdit
        Left = 8
        Top = 31
        Width = 41
        Height = 21
        EditLabel.Width = 65
        EditLabel.Height = 13
        EditLabel.Caption = 'Raideur (N.m)'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 0
        Text = '10000'
        OnChange = edtspringChange
      end
      object edtl0: TLabeledEdit
        Left = 82
        Top = 31
        Width = 49
        Height = 21
        EditLabel.Width = 29
        EditLabel.Height = 13
        EditLabel.Caption = 'L0 (m)'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 1
        Text = '0.5'
        OnChange = edtl0Change
      end
      object edth: TLabeledEdit
        Left = 140
        Top = 31
        Width = 57
        Height = 21
        EditLabel.Width = 81
        EditLabel.Height = 13
        EditLabel.Caption = 'Hauteur base (m)'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 2
        Text = '0.325'
        OnChange = edthChange
      end
    end
    object GroupBoxAsser: TGroupBox
      Left = 8
      Top = 768
      Width = 241
      Height = 201
      Caption = 'Asser.'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 3
      object LblStDurUnt: TLabel
        Left = 18
        Top = 12
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = '(ms)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GaugeStDur: TGauge
        Left = 40
        Top = 0
        Width = 201
        Height = 9
        BackColor = clLime
        ForeColor = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 9
        ParentFont = False
        Progress = 0
        ShowText = False
      end
      object LblStDurMoy: TLabel
        Left = 80
        Top = 9
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '5.63  '
        Color = clActiveBorder
        ParentColor = False
      end
      object LblStDurSig: TLabel
        Left = 120
        Top = 9
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '7.85  '
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label4: TLabel
        Left = 0
        Top = 56
        Width = 11
        Height = 16
        Alignment = taCenter
        Caption = 'P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 0
        Top = 80
        Width = 16
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'I'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 0
        Top = 104
        Width = 16
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'D'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblKP: TLabel
        Left = 216
        Top = 56
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = '0.12'
      end
      object LblKI: TLabel
        Left = 216
        Top = 80
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = '0.12'
      end
      object LblKD: TLabel
        Left = 216
        Top = 104
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = '0.12'
      end
      object LblStDurMin: TLabel
        Left = 160
        Top = 9
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '5.63  '
        Color = clActiveBorder
        ParentColor = False
      end
      object LblStDurMax: TLabel
        Left = 200
        Top = 9
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '7.85  '
        Color = clMoneyGreen
        ParentColor = False
      end
      object LblStDurMes: TLabel
        Left = 40
        Top = 9
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '7.85  '
        Color = clMoneyGreen
        ParentColor = False
      end
      object GaugeStEct: TGauge
        Left = 40
        Top = 30
        Width = 201
        Height = 9
        BackColor = clAqua
        ForeColor = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Progress = 0
        ShowText = False
      end
      object Label10: TLabel
        Left = 19
        Top = 36
        Width = 10
        Height = 13
        Alignment = taRightJustify
        Caption = '('#176')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LblStEctMes: TLabel
        Left = 40
        Top = 39
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '7.85  '
        Color = clMoneyGreen
        ParentColor = False
      end
      object LblStEctMax: TLabel
        Left = 200
        Top = 39
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '7.85  '
        Color = clMoneyGreen
        ParentColor = False
      end
      object LblStEctMoy: TLabel
        Left = 80
        Top = 39
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '5.63  '
        Color = clActiveBorder
        ParentColor = False
      end
      object LblStEctSig: TLabel
        Left = 120
        Top = 39
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '7.85  '
        Color = clMoneyGreen
        ParentColor = False
      end
      object LblStEctMin: TLabel
        Left = 160
        Top = 39
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '5.63  '
        Color = clActiveBorder
        ParentColor = False
      end
      object btRaz: TButton
        Left = 24
        Top = 168
        Width = 41
        Height = 25
        Caption = 'RaZ'
        TabOrder = 0
      end
      object btQuit: TButton
        Left = 176
        Top = 168
        Width = 57
        Height = 25
        Caption = 'Quitter'
        TabOrder = 1
        OnClick = btQuitClick
      end
      object edCons: TEdit
        Left = 8
        Top = 120
        Width = 105
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object edMes: TEdit
        Left = 120
        Top = 120
        Width = 113
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object TBar16: TTrackBar
        Left = 0
        Top = 144
        Width = 241
        Height = 17
        Max = 100
        Min = -100
        Orientation = trHorizontal
        Frequency = 1
        Position = 0
        SelEnd = 0
        SelStart = 0
        TabOrder = 2
        TickMarks = tmBottomRight
        TickStyle = tsAuto
      end
      object btEnable: TButton
        Left = 72
        Top = 168
        Width = 49
        Height = 25
        Caption = 'Enable'
        TabOrder = 3
        OnClick = btEnableClick
      end
      object btPom: TButton
        Left = 128
        Top = 168
        Width = 41
        Height = 25
        Caption = 'POM'
        TabOrder = 5
        OnClick = btPomClick
      end
      object TBarKP: TTrackBar
        Left = 16
        Top = 52
        Width = 201
        Height = 20
        Max = 50
        Orientation = trHorizontal
        Frequency = 5
        Position = 20
        SelEnd = 0
        SelStart = 0
        TabOrder = 7
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = TBarKPChange
      end
      object TBarKI: TTrackBar
        Left = 16
        Top = 76
        Width = 201
        Height = 20
        Max = 100
        Orientation = trHorizontal
        Frequency = 5
        Position = 27
        SelEnd = 0
        SelStart = 0
        TabOrder = 8
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = TBarKIChange
      end
      object TBarKD: TTrackBar
        Left = 16
        Top = 100
        Width = 201
        Height = 20
        Max = 100
        Orientation = trHorizontal
        Frequency = 5
        Position = 25
        SelEnd = 0
        SelStart = 0
        TabOrder = 9
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = TBarKDChange
      end
      object ChkAsser: TCheckBox
        Left = 0
        Top = 16
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 10
        OnClick = ChkAsserClick
      end
      object ChkInvAr: TCheckBox
        Left = 0
        Top = 168
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
    end
    object btFile1: TButton
      Left = 8
      Top = 976
      Width = 25
      Height = 25
      Caption = 'DR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btFile1Click
    end
    object btLitParc: TButton
      Left = 152
      Top = 1000
      Width = 33
      Height = 25
      Caption = 'Lit'
      TabOrder = 5
      OnClick = btLitParcClick
    end
    object EdtSeuilGamma: TEdit
      Left = 8
      Top = 1008
      Width = 17
      Height = 21
      TabOrder = 6
      Text = '6'
    end
    object EdtMoyGlis: TEdit
      Left = 24
      Top = 1008
      Width = 25
      Height = 21
      TabOrder = 7
      Text = '11'
    end
    object EdtKang: TEdit
      Left = 48
      Top = 1000
      Width = 25
      Height = 21
      TabOrder = 8
      Text = '2'
    end
    object EdtPuisAng: TEdit
      Left = 72
      Top = 1000
      Width = 25
      Height = 21
      TabOrder = 9
      Text = '0.7'
    end
    object EdtAngleMax: TEdit
      Left = 96
      Top = 1000
      Width = 25
      Height = 21
      TabOrder = 10
      Text = '23'
    end
    object EdtCoupAng: TEdit
      Left = 120
      Top = 1000
      Width = 25
      Height = 21
      TabOrder = 11
      Text = '1.5'
    end
    object EdtKpmp: TEdit
      Left = 48
      Top = 1024
      Width = 25
      Height = 21
      TabOrder = 12
      Text = '2'
    end
    object EdtCoupPmp: TEdit
      Left = 120
      Top = 1024
      Width = 25
      Height = 21
      TabOrder = 13
      Text = '4.5'
    end
    object EdtPuisPmp: TEdit
      Left = 72
      Top = 1024
      Width = 25
      Height = 21
      TabOrder = 14
      Text = '0.7'
    end
    object BtRazMinMax: TButton
      Left = 188
      Top = 976
      Width = 65
      Height = 17
      Caption = 'RazMinMax'
      TabOrder = 15
      OnClick = BtRazMinMaxClick
    end
    object EdtDiagTens1: TEdit
      Left = 8
      Top = 1056
      Width = 25
      Height = 21
      TabOrder = 16
      Text = '3'
    end
    object EdtDiagTens2: TEdit
      Left = 32
      Top = 1056
      Width = 25
      Height = 21
      TabOrder = 17
    end
    object EdtDiagTens3: TEdit
      Left = 56
      Top = 1056
      Width = 25
      Height = 21
      TabOrder = 18
      Text = '-3'
    end
    object EdtDiagTens4: TEdit
      Left = 80
      Top = 1056
      Width = 25
      Height = 21
      TabOrder = 19
    end
    object EdtDiagTens5: TEdit
      Left = 104
      Top = 1056
      Width = 25
      Height = 21
      TabOrder = 20
      Text = '0'
    end
    object EdtDiagTens6: TEdit
      Left = 128
      Top = 1056
      Width = 25
      Height = 21
      TabOrder = 21
    end
    object EdtDiagDur1: TEdit
      Left = 8
      Top = 1080
      Width = 25
      Height = 21
      TabOrder = 22
      Text = '0.5'
    end
    object EdtDiagDur2: TEdit
      Left = 32
      Top = 1080
      Width = 25
      Height = 21
      TabOrder = 23
      Text = '1.5'
    end
    object EdtDiagDur3: TEdit
      Left = 56
      Top = 1080
      Width = 25
      Height = 21
      TabOrder = 24
      Text = '1'
    end
    object EdtDiagDur4: TEdit
      Left = 80
      Top = 1080
      Width = 25
      Height = 21
      TabOrder = 25
      Text = '1.5'
    end
    object EdtDiagDur5: TEdit
      Left = 104
      Top = 1080
      Width = 25
      Height = 21
      TabOrder = 26
      Text = '0.5'
    end
    object EdtDiagDur6: TEdit
      Left = 128
      Top = 1080
      Width = 25
      Height = 21
      TabOrder = 27
      Text = '2'
    end
    object ChkDiagAct1: TCheckBox
      Left = 160
      Top = 1056
      Width = 17
      Height = 17
      Caption = 'ChkDiagAct1'
      Checked = True
      State = cbChecked
      TabOrder = 28
    end
    object ChkDiagAct2: TCheckBox
      Left = 160
      Top = 1072
      Width = 17
      Height = 17
      Caption = 'ChkDiagAct1'
      Checked = True
      State = cbChecked
      TabOrder = 29
    end
    object ChkDiagAct3: TCheckBox
      Left = 160
      Top = 1088
      Width = 17
      Height = 17
      Caption = 'ChkDiagAct1'
      Checked = True
      State = cbChecked
      TabOrder = 30
    end
    object ChkDiagInv1: TCheckBox
      Left = 176
      Top = 1056
      Width = 17
      Height = 17
      Caption = 'ChkDiagAct1'
      TabOrder = 31
    end
    object ChkDiagInv2: TCheckBox
      Left = 176
      Top = 1072
      Width = 17
      Height = 17
      Caption = 'ChkDiagAct1'
      TabOrder = 32
    end
    object ChkDiagInv3: TCheckBox
      Left = 176
      Top = 1088
      Width = 17
      Height = 17
      Caption = 'ChkDiagAct1'
      TabOrder = 33
    end
    object ChkEpreuve: TCheckBox
      Left = 208
      Top = 1072
      Width = 17
      Height = 17
      Caption = 'ChkEpreuve'
      TabOrder = 34
      OnClick = ChkEpreuveClick
    end
    object ChkDiagCyc: TCheckBox
      Left = 192
      Top = 1072
      Width = 17
      Height = 17
      Caption = 'ChkDiagCyc'
      TabOrder = 35
    end
    object ChkBoxUdp: TCheckBox
      Left = 272
      Top = 1056
      Width = 17
      Height = 17
      TabOrder = 36
      OnClick = ChkBoxUdpClick
    end
    object ChkFileLoi: TCheckBox
      Left = 272
      Top = 1072
      Width = 17
      Height = 17
      TabOrder = 37
      OnClick = ChkFileLoiClick
    end
    object ChkBoxCeint: TCheckBox
      Left = 272
      Top = 1088
      Width = 17
      Height = 17
      Caption = 'ChkBoxCeint'
      Enabled = False
      TabOrder = 38
    end
    object GroupBox1: TGroupBox
      Left = 253
      Top = 8
      Width = 233
      Height = 105
      Caption = 'Tapis roulant'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 39
      object Warning_TR: TLabel
        Left = 17
        Top = 72
        Width = 100
        Height = 20
        Caption = 'Warning_TR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Lblvitesse: TLabeledEdit
        Left = 16
        Top = 39
        Width = 97
        Height = 21
        EditLabel.Width = 68
        EditLabel.Height = 13
        EditLabel.Caption = 'Vitesse (km/h)'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 0
      end
    end
    object group_video: TGroupBox
      Left = 253
      Top = 117
      Width = 233
      Height = 92
      Caption = 'Gains RetroProjection RV'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 40
      object lbltangage: TLabel
        Left = 193
        Top = 18
        Width = 5
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblRoulis: TLabel
        Left = 193
        Top = 37
        Width = 5
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblpompage: TLabel
        Left = 193
        Top = 54
        Width = 5
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblvit: TLabel
        Left = 193
        Top = 70
        Width = 5
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 24
        Top = 19
        Width = 43
        Height = 13
        Caption = 'Tangage'
      end
      object Label27: TLabel
        Left = 25
        Top = 36
        Width = 29
        Height = 13
        Caption = 'Roulis'
      end
      object Label28: TLabel
        Left = 25
        Top = 51
        Width = 45
        Height = 13
        Caption = 'Pompage'
      end
      object Label29: TLabel
        Left = 26
        Top = 67
        Width = 34
        Height = 13
        Caption = 'Vitesse'
      end
      object TrackBarTangage: TTrackBar
        Left = 72
        Top = 20
        Width = 113
        Height = 13
        Max = 100
        Orientation = trHorizontal
        Frequency = 10
        Position = 10
        SelEnd = 0
        SelStart = 0
        TabOrder = 0
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsNone
        OnChange = TrackBarTangageChange
      end
      object TrackBarRoulis: TTrackBar
        Left = 72
        Top = 36
        Width = 113
        Height = 13
        Max = 100
        Orientation = trHorizontal
        Frequency = 10
        Position = 10
        SelEnd = 0
        SelStart = 0
        TabOrder = 1
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsNone
        OnChange = TrackBarRoulisChange
      end
      object TrackBarPompage: TTrackBar
        Left = 72
        Top = 52
        Width = 113
        Height = 13
        Max = 100
        Orientation = trHorizontal
        Frequency = 10
        Position = 10
        SelEnd = 0
        SelStart = 0
        TabOrder = 2
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsNone
        OnChange = TrackBarPompageChange
      end
      object TrackBarVitesse: TTrackBar
        Left = 72
        Top = 68
        Width = 113
        Height = 13
        Max = 100
        Orientation = trHorizontal
        Frequency = 10
        Position = 10
        SelEnd = 0
        SelStart = 0
        TabOrder = 3
        ThumbLength = 12
        TickMarks = tmBottomRight
        TickStyle = tsNone
        OnChange = TrackBarVitesseChange
      end
    end
    object GroupBoxCom: TGroupBox
      Left = 252
      Top = 214
      Width = 233
      Height = 155
      Caption = 'Communication Sujet'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 41
      object Memo1: TMemo
        Left = 16
        Top = 24
        Width = 201
        Height = 81
        MaxLength = 200
        TabOrder = 0
      end
      object SendBtn: TButton
        Left = 16
        Top = 120
        Width = 75
        Height = 25
        Caption = 'Envoi'
        TabOrder = 1
        OnClick = SendBtnClick
      end
      object CheckBox1: TCheckBox
        Left = 112
        Top = 128
        Width = 97
        Height = 17
        Caption = 'WARNING'
        TabOrder = 2
      end
    end
    object Group_tests: TGroupBox
      Left = 251
      Top = 374
      Width = 233
      Height = 675
      Caption = 'Tests pr'#233'programm'#233's'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 42
      object Label30: TLabel
        Left = 8
        Top = 576
        Width = 125
        Height = 13
        Caption = 'Commentaires additionnels'
      end
      object decompte: TLabel
        Left = 149
        Top = 560
        Width = 72
        Height = 24
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = '0123'
        Color = clBlack
        Font.Charset = OEM_CHARSET
        Font.Color = clYellow
        Font.Height = -27
        Font.Name = 'Terminal'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
      end
      object Memo2: TMemo
        Left = 2
        Top = 592
        Width = 229
        Height = 81
        Align = alBottom
        TabOrder = 0
      end
      object BtnVicon: TBitBtn
        Left = 64
        Top = 24
        Width = 121
        Height = 25
        Caption = '&Armement VICON'
        TabOrder = 1
        OnClick = BtnViconClick
        Kind = bkIgnore
      end
      object GB_Rouils: TGroupBox
        Left = 8
        Top = 56
        Width = 217
        Height = 105
        Caption = 'Essais Roulis'
        Color = clSkyBlue
        ParentColor = False
        TabOrder = 2
        object Label31: TLabel
          Left = 16
          Top = 18
          Width = 46
          Height = 13
          Caption = 'Amplitude'
        end
        object Label32: TLabel
          Left = 80
          Top = 18
          Width = 51
          Height = 13
          Caption = 'Fr'#233'quence'
        end
        object Label33: TLabel
          Left = 32
          Top = 59
          Width = 91
          Height = 13
          Caption = 'Bande fr'#233'quentielle'
        end
        object Button_test1: TButton
          Left = 154
          Top = 32
          Width = 57
          Height = 17
          Caption = 'Sinus'
          Enabled = False
          TabOrder = 0
          OnClick = Button_test1Click
        end
        object Button_test2: TButton
          Left = 154
          Top = 75
          Width = 57
          Height = 17
          Caption = 'Al'#233'atoire'
          Enabled = False
          TabOrder = 1
          OnClick = Button_test2Click
        end
        object CBRAmp: TComboBox
          Left = 16
          Top = 32
          Width = 49
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = '0'
          Items.Strings = (
            '0'
            '4'
            '8')
        end
        object CBRFreq: TComboBox
          Left = 87
          Top = 33
          Width = 50
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = '0.25'
          Items.Strings = (
            '0.25'
            '0.5'
            '0.7'
            '1')
        end
        object CBRalea: TComboBox
          Left = 48
          Top = 73
          Width = 64
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 4
          Text = '0.25 - 1'
          Items.Strings = (
            '0.25 - 1'
            '0.25 - 5'
            '0.25 - 10')
        end
        object BitBtn1: TBitBtn
          Left = 141
          Top = 32
          Width = 11
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = '&Aide'
          ParentBiDiMode = False
          TabOrder = 5
          OnClick = BitBtn1Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000120B0000120B00001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
            3333333333333663333333330000333333364463333333333333644633333333
            00003333333E6643333333333333E66433333333000033333333E66333333333
            33333E6633333333000033333333333333333333333333333333333300003333
            3333446333333333333334463333333300003333333666433333333333336664
            3333333300003333333E6643333333333333E6643333333300003333333E6664
            333333333333E66643333333000033333333E6664333333333333E6664333333
            0000333333333E6664333333333333E66643333300003333344333E666433333
            3344333E66643333000033336664333E6643333336664333E664333300003333
            E6664446664333333E66644466643333000033333E6666666663333333E66666
            666633330000333333EE666666333333333EE66666633333000033333333EEEE
            E333333333333EEEEE3333330000333333333333333333333333333333333333
            0000}
        end
        object BitBtn2: TBitBtn
          Left = 141
          Top = 74
          Width = 11
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = '&Aide'
          ParentBiDiMode = False
          TabOrder = 6
          OnClick = BitBtn2Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000120B0000120B00001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
            3333333333333663333333330000333333364463333333333333644633333333
            00003333333E6643333333333333E66433333333000033333333E66333333333
            33333E6633333333000033333333333333333333333333333333333300003333
            3333446333333333333334463333333300003333333666433333333333336664
            3333333300003333333E6643333333333333E6643333333300003333333E6664
            333333333333E66643333333000033333333E6664333333333333E6664333333
            0000333333333E6664333333333333E66643333300003333344333E666433333
            3344333E66643333000033336664333E6643333336664333E664333300003333
            E6664446664333333E66644466643333000033333E6666666663333333E66666
            666633330000333333EE666666333333333EE66666633333000033333333EEEE
            E333333333333EEEEE3333330000333333333333333333333333333333333333
            0000}
        end
      end
      object GBTangage: TGroupBox
        Left = 8
        Top = 168
        Width = 217
        Height = 105
        Caption = 'Essais Tangage'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 3
        object Label34: TLabel
          Left = 16
          Top = 18
          Width = 46
          Height = 13
          Caption = 'Amplitude'
        end
        object Label35: TLabel
          Left = 80
          Top = 18
          Width = 51
          Height = 13
          Caption = 'Fr'#233'quence'
        end
        object Label36: TLabel
          Left = 32
          Top = 59
          Width = 91
          Height = 13
          Caption = 'Bande fr'#233'quentielle'
        end
        object Button_test3: TButton
          Left = 154
          Top = 32
          Width = 57
          Height = 17
          Caption = 'Sinus'
          Enabled = False
          TabOrder = 0
          OnClick = Button_test3Click
        end
        object Button_test4: TButton
          Left = 154
          Top = 75
          Width = 57
          Height = 17
          Caption = 'Al'#233'atoire'
          Enabled = False
          TabOrder = 1
          OnClick = Button_test4Click
        end
        object CBTAmp: TComboBox
          Left = 16
          Top = 32
          Width = 49
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = '4'
          Items.Strings = (
            '4'
            '8')
        end
        object CBTFreq: TComboBox
          Left = 87
          Top = 33
          Width = 50
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = '0.25'
          Items.Strings = (
            '0.25'
            '0.5'
            '0.7'
            '1')
        end
        object CBTalea: TComboBox
          Left = 48
          Top = 73
          Width = 64
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 4
          Text = '0.25 - 1'
          Items.Strings = (
            '0.25 - 1'
            '0.25 - 5'
            '0.25 - 10')
        end
        object BitBtn3: TBitBtn
          Left = 141
          Top = 32
          Width = 11
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = '&Aide'
          ParentBiDiMode = False
          TabOrder = 5
          OnClick = BitBtn3Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000120B0000120B00001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
            3333333333333663333333330000333333364463333333333333644633333333
            00003333333E6643333333333333E66433333333000033333333E66333333333
            33333E6633333333000033333333333333333333333333333333333300003333
            3333446333333333333334463333333300003333333666433333333333336664
            3333333300003333333E6643333333333333E6643333333300003333333E6664
            333333333333E66643333333000033333333E6664333333333333E6664333333
            0000333333333E6664333333333333E66643333300003333344333E666433333
            3344333E66643333000033336664333E6643333336664333E664333300003333
            E6664446664333333E66644466643333000033333E6666666663333333E66666
            666633330000333333EE666666333333333EE66666633333000033333333EEEE
            E333333333333EEEEE3333330000333333333333333333333333333333333333
            0000}
        end
        object BitBtn4: TBitBtn
          Left = 141
          Top = 74
          Width = 11
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = '&Aide'
          ParentBiDiMode = False
          TabOrder = 6
          OnClick = BitBtn4Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000120B0000120B00001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
            3333333333333663333333330000333333364463333333333333644633333333
            00003333333E6643333333333333E66433333333000033333333E66333333333
            33333E6633333333000033333333333333333333333333333333333300003333
            3333446333333333333334463333333300003333333666433333333333336664
            3333333300003333333E6643333333333333E6643333333300003333333E6664
            333333333333E66643333333000033333333E6664333333333333E6664333333
            0000333333333E6664333333333333E66643333300003333344333E666433333
            3344333E66643333000033336664333E6643333336664333E664333300003333
            E6664446664333333E66644466643333000033333E6666666663333333E66666
            666633330000333333EE666666333333333EE66666633333000033333333EEEE
            E333333333333EEEEE3333330000333333333333333333333333333333333333
            0000}
        end
      end
      object GBPompage: TGroupBox
        Left = 8
        Top = 280
        Width = 217
        Height = 105
        Caption = 'Essais Pompage'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 4
        object Label37: TLabel
          Left = 16
          Top = 18
          Width = 46
          Height = 13
          Caption = 'Amplitude'
        end
        object Label38: TLabel
          Left = 80
          Top = 18
          Width = 51
          Height = 13
          Caption = 'Fr'#233'quence'
        end
        object Label39: TLabel
          Left = 32
          Top = 59
          Width = 91
          Height = 13
          Caption = 'Bande fr'#233'quentielle'
        end
        object Button_test5: TButton
          Left = 154
          Top = 32
          Width = 57
          Height = 17
          Caption = 'Sinus'
          Enabled = False
          TabOrder = 0
          OnClick = Button_test5Click
        end
        object Button_test6: TButton
          Left = 154
          Top = 75
          Width = 57
          Height = 17
          Caption = 'Al'#233'atoire'
          Enabled = False
          TabOrder = 1
          OnClick = Button_test6Click
        end
        object CBPAmp: TComboBox
          Left = 16
          Top = 32
          Width = 49
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = '4'
          Items.Strings = (
            '4'
            '8')
        end
        object CBPFreq: TComboBox
          Left = 87
          Top = 33
          Width = 50
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = '0.25'
          Items.Strings = (
            '0.25'
            '0.5'
            '0.7'
            '1')
        end
        object CBPalea: TComboBox
          Left = 48
          Top = 73
          Width = 64
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 4
          Text = '0.25 - 1'
          Items.Strings = (
            '0.25 - 1'
            '0.25 - 5'
            '0.25 - 10')
        end
        object BitBtn5: TBitBtn
          Left = 141
          Top = 32
          Width = 11
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = '&Aide'
          ParentBiDiMode = False
          TabOrder = 5
          OnClick = BitBtn5Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000120B0000120B00001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
            3333333333333663333333330000333333364463333333333333644633333333
            00003333333E6643333333333333E66433333333000033333333E66333333333
            33333E6633333333000033333333333333333333333333333333333300003333
            3333446333333333333334463333333300003333333666433333333333336664
            3333333300003333333E6643333333333333E6643333333300003333333E6664
            333333333333E66643333333000033333333E6664333333333333E6664333333
            0000333333333E6664333333333333E66643333300003333344333E666433333
            3344333E66643333000033336664333E6643333336664333E664333300003333
            E6664446664333333E66644466643333000033333E6666666663333333E66666
            666633330000333333EE666666333333333EE66666633333000033333333EEEE
            E333333333333EEEEE3333330000333333333333333333333333333333333333
            0000}
        end
        object BitBtn6: TBitBtn
          Left = 141
          Top = 74
          Width = 11
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = '&Aide'
          ParentBiDiMode = False
          TabOrder = 6
          OnClick = BitBtn6Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000120B0000120B00001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
            3333333333333663333333330000333333364463333333333333644633333333
            00003333333E6643333333333333E66433333333000033333333E66333333333
            33333E6633333333000033333333333333333333333333333333333300003333
            3333446333333333333334463333333300003333333666433333333333336664
            3333333300003333333E6643333333333333E6643333333300003333333E6664
            333333333333E66643333333000033333333E6664333333333333E6664333333
            0000333333333E6664333333333333E66643333300003333344333E666433333
            3344333E66643333000033336664333E6643333336664333E664333300003333
            E6664446664333333E66644466643333000033333E6666666663333333E66666
            666633330000333333EE666666333333333EE66666633333000033333333EEEE
            E333333333333EEEEE3333330000333333333333333333333333333333333333
            0000}
        end
      end
      object GBCombine: TGroupBox
        Left = 8
        Top = 392
        Width = 217
        Height = 161
        Caption = 'Essais Combin'#233's'
        Color = clInactiveCaptionText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 5
        object Label40: TLabel
          Left = 16
          Top = 18
          Width = 46
          Height = 13
          Caption = 'Amplitude'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 80
          Top = 18
          Width = 51
          Height = 13
          Caption = 'Fr'#233'quence'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 16
          Top = 66
          Width = 46
          Height = 13
          Caption = 'Amplitude'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 81
          Top = 66
          Width = 51
          Height = 13
          Caption = 'Fr'#233'quence'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 144
          Top = 34
          Width = 40
          Height = 13
          Caption = 'ROULIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 144
          Top = 82
          Width = 52
          Height = 13
          Caption = 'TANGAGE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 57
          Top = 106
          Width = 55
          Height = 13
          Caption = 'D'#233'phasage'
        end
        object Button_test7: TButton
          Left = 154
          Top = 123
          Width = 57
          Height = 17
          Caption = 'Sinus'
          Enabled = False
          TabOrder = 0
          OnClick = Button_test7Click
        end
        object CBCRAmp: TComboBox
          Left = 16
          Top = 32
          Width = 49
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = '1'
          Items.Strings = (
            '1'
            '2'
            '4'
            '6')
        end
        object CBCRFreq: TComboBox
          Left = 87
          Top = 33
          Width = 50
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = '0.25'
          Items.Strings = (
            '0.25'
            '0.5'
            '0.7'
            '1')
        end
        object CBCTAmp: TComboBox
          Left = 16
          Top = 81
          Width = 49
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = '1'
          Items.Strings = (
            '1'
            '2'
            '4'
            '6')
        end
        object CBCTFreq: TComboBox
          Left = 86
          Top = 81
          Width = 51
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 4
          Text = '0.25'
          Items.Strings = (
            '0.25'
            '0.5'
            '0.7'
            '1')
        end
        object CBCphi: TComboBox
          Left = 54
          Top = 121
          Width = 51
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 5
          Text = '0'
          Items.Strings = (
            '0'
            '45'
            '90')
        end
        object BitBtn7: TBitBtn
          Left = 141
          Top = 123
          Width = 11
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = '&Aide'
          ParentBiDiMode = False
          TabOrder = 6
          OnClick = BitBtn7Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000120B0000120B00001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
            3333333333333663333333330000333333364463333333333333644633333333
            00003333333E6643333333333333E66433333333000033333333E66333333333
            33333E6633333333000033333333333333333333333333333333333300003333
            3333446333333333333334463333333300003333333666433333333333336664
            3333333300003333333E6643333333333333E6643333333300003333333E6664
            333333333333E66643333333000033333333E6664333333333333E6664333333
            0000333333333E6664333333333333E66643333300003333344333E666433333
            3344333E66643333000033336664333E6643333336664333E664333300003333
            E6664446664333333E66644466643333000033333E6666666663333333E66666
            666633330000333333EE666666333333333EE66666633333000033333333EEEE
            E333333333333EEEEE3333330000333333333333333333333333333333333333
            0000}
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 1107
    Width = 1838
    Height = 18
    Panels = <
      item
        Text = 'Pierre LEMERLE 23/05/2022'
        Width = 150
      end
      item
        Text = 'pierre.lemerle@inrs.fr'
        Width = 50
      end>
    SimplePanel = False
    SimpleText = 'Pierre LEMERLE 23/03/08'
  end
  object RSTimerAsserv1: TRSTimer
    Left = 232
    Top = 120
    Width = 32
    Height = 32
    OnTimer = RSTimerAsserv1Timer
    ControlData = {010002004F0300004F03000040000000000300000001}
  end
  object RSTimerAsserv2: TRSTimer
    Left = 232
    Top = 152
    Width = 32
    Height = 32
    OnTimer = RSTimerAsserv2Timer
    ControlData = {010002004F0300004F03000040000000000300000001}
  end
  object RSTimerAsserv3: TRSTimer
    Left = 232
    Top = 184
    Width = 32
    Height = 32
    OnTimer = RSTimerAsserv3Timer
    ControlData = {010002004F0300004F03000040000000000300000001}
  end
  object RSTimerParc: TRSTimer
    Left = 48
    Top = 288
    Width = 32
    Height = 32
    OnTimer = RSTimerParcTimer
    ControlData = {010002004F0300004F03000040000000001400000001}
  end
  object RSTimerUdp: TRSTimer
    Left = 80
    Top = 288
    Width = 32
    Height = 32
    OnTimer = RSTimerUdpTimer
    ControlData = {010002004F0300004F03000040000000000300000000}
  end
  object RSTimerEntreeLogique: TRSTimer
    Left = 984
    Top = 184
    Width = 32
    Height = 32
    OnTimer = RSTimerEntreeLogiqueTimer
    ControlData = {010002004F0300004F03000040000000000300000001}
  end
  object GLScene1: TGLScene
    Left = 8
    Top = 176
    object GLDummyCube1: TGLDummyCube
      CubeSize = 1
      object GLDummyCube2: TGLDummyCube
        Position.Coordinates = {00000000000000009A99993E0000803F}
        CubeSize = 1
      end
    end
    object GLPlane1: TGLPlane
      Material.MaterialLibrary = GLMaterialLibrary1
      Material.LibMaterialName = 'LibMaterial'
      Height = 100
      Width = 100
      XTiles = 300
      YTiles = 300
      NoZWrite = False
    end
    object GLCamera1: TGLCamera
      DepthOfView = 1000
      FocalLength = 200
      NearPlaneBias = 0.100000001490116
      TargetObject = GLDummyCube2
      Position.Coordinates = {0000004000000040000000400000803F}
      Direction.Coordinates = {00000000000080BF0000000000000000}
      Up.Coordinates = {00000000000000000000803F00000000}
      object GLLightSource1: TGLLightSource
        ConstAttenuation = 1
        Position.Coordinates = {0000000000000000000040400000803F}
        SpotCutOff = 180
      end
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    FixedDeltaTime = 0.01
    OnProgress = GLCadencer1Progress
    Left = 72
    Top = 176
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Materials = <
      item
        Name = 'LibMaterial'
        Material.Texture.Image.Picture.Data = {
          0A544A504547496D6167654A0F0000FFD8FFE000104A46494600010101004800
          480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
          090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
          24221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1EFFC00011080080008003012200021101031101
          FFC4001A000003010101010000000000000000000002030405010006FFC4003D
          100002010302010A040305080300000000010203000411122131051322415161
          718191A11432B1C12342D115526292F0337282A2B2C2E1F15374E2FFC4001801
          010101010100000000000000000000000102000306FFC4002311000202010403
          0003010000000000000000010211121341516103213123528171FFDA000C0301
          0002110311003F00F8366E9692C41CF0D2B9A5CC9ABA2FD200ED963F7E152E6F
          B38FC16EF6527EAD42E6F5BA245B8DBF70FD335E5D47B3D3B9745283194D2E40
          E182BF635C7D88255D58F01A758FA54447296A2A5AD42F7237DDA81A4BE53847
          80E76D5A08FA1156A3D93974682BEA0774DB639FBF57BD106054EA0EAA7BC1DB
          CB35981F94436656B673C06633951DC739FEBAA883DE101B5448C7A80276F5E3
          DC2B3859B23424D0F92A7391C460E7D3EF4137493762FD833B78567F39CA0321
          65439EA209C7BD137C720D5F111A8233B47B795187619745815D306360A471D2
          00A6319587CF953D785DFBF8D66335D805898411C480C338F3F6AA2037061591
          5954B0048DCFDE97114CBA36753A4C84E4ED93D55E6695480C59BAB208FF00BA
          934DCF480953ABA5A58827CCD0A0B919CCB183C364DCEFFDECD4628AB2ED4E36
          7C1CF5119DABB93A318D89C768FD2A28E3BD0C489F273FF8CEDE98AF1F8F122A
          F4190F5F36763BEFC6B62B90BE8B90ED843C7F702F0F4A3463F95D9CF0D2A06D
          E351C6D38620B12DF9488C803D0D0B7C597DA66507B469FA9A1C6C6C7B9DCA91
          C0F034A3A7A867B071F4A99B946D8F49410BFBDA76F3ECAE1BDB704E4B6A1C40
          46CFD3C2AF068335C95028070D852E4CEA38007F5DB4BF8DB6EA67FE4228BE32
          C8820973B6C4C6C7ED5A9F06C972700392303B2BDA73C718A43F29588DB50EC0
          4823ED497E54B40E713A67AC0DB356A127B139C56E5E11B1A883807C28954923
          18C76E37ACE4E56B173ABE21091C30A4FB6334EFDA166074A5383B1D593F4159
          C24B6329C5EE3A68BF09B28A4EE08C757F5D54DB4C0B784AEF841F310070F138
          F4A9A5BD80C6CB80490400724D7ADF94EC9218A3374CACA0060C1B3EA4FDAA5C
          655F05495972200724AC79EA4427DF87B51E4E005D4540DF510BF6CD4C2FAD5C
          1684990FEFE96207F28A11CA101035DDB395E221818E3B3761B54B849EC5648A
          D820009C03918E3F5C8144C00181903183924FD01A8E3BFB4739569581DF2CCF
          D21DB851BD31AF6C811AF739DB16C47BB54B83E0D94791A39AC61891E83EB8A3
          5D04E00576C8F954E7FCB9A99EF20D2652D205FE28D801E61284F28D89E93CAE
          CA372799720799C0F6A709706C92DCE0B598805629081BEAC1603CFF00FAA24B
          6D4D9C691D65C8D47BB6D80FAD775395558EE2603AC3306C7A1AEC5CDC409321
          9189DB7519F7A5B61484A945511C88CA5783E8254FDF3C3AB1B57A48D981E992
          A471D3B0F3DB14F6BA958918D23B1003EE76A5EBE74EEA36DC1CEA3FA0A5583A
          24960241E8AEA618040C79F80EDEBF4A136C0851A000CC5571D847EA335636C3
          1A4904F0D592DE27B3BA875807537139C1CF0F0AB52618A224B40CEA39B53B7C
          A471C711E5C3FA34F8E1E93613241C1C0DD761EF8C755511C82352EAA0E069D4
          4E14787FDD7A3DE5E78A867C7CEDB7B6C287296E2A2900B12156748419176D3C
          D103C7069513C533322BC0181C30D5BE7C2B403DC1E0F3AFF704647DFEB4135A
          87756B8591997F33328CFA542957D171E0996308F86689DC8D873A41C782824F
          AD7951D8E2385C6919F93A27D74EF4CE6921669206546230725483EE28B9D964
          8F0E6263FC381E9D234DEE8D44CC1C3B04D21B3BE81A987B1FAD0A7C415C7C35
          C12789658FECE29D0036ECDF844EFB6572DE6DD63C73547C42E0091114F7499C
          52E4F60496E4E2D2552B70DCDA1519CBED8F463F7AE22F39908C59871318C8C7
          6EA383EF44F6C8EC2632B100E77C32F9ED46CEB24657A781C0C671F7AD66A09A
          CEE33BDCE9ECD312B11E99A59E4EB867C2BB3678314619F45FBD6CC7CD00CEA9
          2C98DBA4F1AE0F91C8A07B88CE5494F092453F53F6AE5A92D8EB8231DB929CBE
          8695B9DECCA961E4483ED4079266642DCF870B91C7511E236C56C4923735D3D2
          B19D8EC74FAB605224B8223D6FA95782B6AD3C76D8F11E40D52F24897E38A328
          727B3E156562A4654A9DBEFE99A1B2B18EE04ACAF23E890A021C1040C55F2699
          0912EA663C759C7B75F9E2B9C9EAB1F3E1D9BFB53B13A7A87564D5BF23A21415
          938E4E0AC31CE13D64C807DA99F06898E6DE46277C860319FAD5C5134ECE4677
          F9F87A50A609E84A36F98B124E2A351B3AE9C4985A205D31C8FB9DF014AFBAD1
          2D9B07082E00CEE731AE07B0AAF58C6EE3B887D87AD77A0CDC51F6C0CF6799A8
          7391584495AD57074CC40036D3800FD2BC2C981C8B8B903AC127F5AAC22E3663
          E00138F21462339CB024F5020FE9466CDA6888D991D1964D5D7D3418F1E14CF8
          541A7123024600076F6AACE57645D233B85C835C31BBB6E5B48DF7AD9C8CFC71
          22FD9CCC4113484F03D3618F1CD11B05C17134A41E3AE5CE3D785523988DF4BC
          CBBFE5CE28F9B4D5A97528EE507CF856CE418444C77304A035DA10318DEC199C
          0ECCE3EE6BAD79C9F1E5A249D08180458B023CF155BB216E2A0711D0EAF1AEA7
          34772D18EF3539746FE982B7F0C7316992F2E5B3B3185CE91D8015DABD15EAC9
          2BC925BDDE41FC3CC0C028EECF9D6DC82DE4DCCF1760C52C2C49C2587C756D5D
          351704E2F93152EA58DCB25BDCB4BD221B98383D87C715DB3BD98AC925C4132C
          ACE491CD91D407503D95B227B661913DA301C40905034D67F96446EAC464B7B0
          15B52D551947B225BC03F291B6490AE3142BCA76F2318E1BC432671A743E73FC
          B572B063F856372C78E59740F5269177C97737770923A450A28230A7277EFC0C
          D65285FB1796C00B8913779159BBADDB6A06BB9981CCF91D86DD8E7D056A456D
          0C100432B90BB0D4F5C12D8038132EAEC0D8FBD4E6B81A7C99BF10090C5F4F84
          2DB1F315D8EEEDF3A9A45CFF00EB3E3D34D68178DDBF02096561B8206C7CC902
          9462E507274D946013C5E519F41B7BD6C93FA6F6895F94AC908E72ED5070C186
          45CFF9696DCA363CE7362EE3246F9CCABF6AB3F635E5C656E794A2857A96DE1C
          03E249A6D8720727DA36D1C7291D6EA36EFA73F125D87E464FF1B10034B4B228
          E3947C7BA1A197942251D0F8876EB020727FDB5A9325AC43A724298EA62052E3
          B8E4E5658C4F6C5CFCAA0E091DDDB519AFD4A6AB70DADA2CF4D23D4DBE45B3B6
          7CC023DCD0C9C9D6F22FE25BC1BF5F32CBF6A5B5997CE6694AA9D898D06FD87A
          26B8D6B36348BA708075C6B9CF8E054AFF004DFC09793EC9083F0B6B91C32983
          EB8A6AC76E4E816F182381488B63FCB514965721815BD74EDF940F718A6AD849
          81AAEA5901DF23467C3714B49FD6657C15736E4284D0A7AC9B6615EC68035B12
          73D48003E19A97F6787665692541DE501F0D9689793AD839D5777B1E463523A8
          FA0A297252BE06AB47A8FE332F73C800FAD78C7AD8928CEA7F7759C1ECD81C52
          12D444D86BBBA9547CA5643A8F8822B97B6D0A5B4D70979233A46CCAB211D120
          76F5F98A7156193AF851CC82495B15D437C987EE40AE6ABA46C2C4A17A800A0F
          BBD66A1B9F98DD3953DC31EC00F7A38E27208124EBFDD65FF6E6970A0C8BE479
          4AE099758F98096153E78CD79509E0603DB9B9C9F300549CD9037BABD0A36399
          08FF00562BAB6AAC76BAE50C1ED9323FD46A5243ECB324B60E483BE12091F1E7
          4B6B632AB62D5E40773AE0607D1D8508B152BB4B31F1D7BFB52C725C72393249
          29C701CCBB7D56B7A33C8A05ABC1D31670238DF9C291EDEAF914C0D2E311C96E
          7B4295DBC7A7481C976C015E76E9476F3327D9689793628F759EF187608D87D8
          50E83D84CC538263B0EAA169DB816233C70D8F6ACE8AF215889E946A09D44A90
          0776F40B76AEACE8AE62078EC01EFDEBAE9B273340CACBC321BAC139C8F2A079
          9B4F48BE093C4E31F5A823B9561A951F07ADD74AFE869866572742EA23F73714
          E0C732B33B644718000E272757A5135C4B90076600CF1ACD79D13E78A6F2527E
          94C4B88E550D1EA718C9D3827EB5B0A36657F12C5B788F6636349E52BF54B19C
          059326361A548C6E3DE931DE5BABF31AA4573B8D4363E049A1BF92392D64888F
          C575223195CF03B0DE98C29AB44B97A29050E0AC898238E4B67CF393EB441786
          A6DFB38E7D8D660B962C11DD873A7A3AD4024F660FFCD1C42653CE4D6B292389
          45527E82A9C014CD3542C701DBBC2AB0F7C8A2E6FABF0FBB5019359DCE5C36E2
          D6454DCE06907CC6E6885C30905B4892F3A46428917F5151832D4D16E9C9C844
          E3C4441B1FA53304B10CC991BED105CFAF0A8637918B20B798329E965748F239
          C1A58BF2AA664566807459B52E73D83BFBA8C1B339D1AEA502805718F2FEBC6B
          DA61240D2E7B8B9FD6B316F1C8522098A39E89401B7EFC138A2264438F847727
          72A34B0F6C9A34C3306386F15E3CDB3346BC0018C638B671E74F79A628D98E20
          1B6CB5C804F9F1068CC0198BCB123B63ADF247AD0C4EA50BAAB22A8FCCA40FF9
          AAB4C9A2774BD50AFCCDAAC6D91A9E4233E071BD2FE1E58CE1208502FCA79D38
          CF663BFF00ACD3C91932A13148FF009D348CFF00886E281C0923549A62D02718
          D14AB1EFD7C4FF005C6AD009D3CA0A9F2E9D59C176CA278646714A823962B905
          2446B99C70048C01D47635A32CECC7408D46C02EB6D5B756EBF7C572051048CC
          5C96600950761E4B9CF816AD6E8D44F2DA5C46FCE2DB4225230C4E4E7BBC2A7B
          9474B5549ACA27889064D321CE7AB4D694B2A226B258E3888D55307B7724D28C
          8C3A42054723FB4DC9F1CB607A509B33480368D140232B1E8EA1236AC786D53C
          D23DB5BAAC2CCEC87A08ACDC7B37CED4C7093B10C7E23FC448FE50349DE9F099
          A043A0150388454420789CD3680E25C4F346165E6EDD48CB160F863D9BFF00CD
          2ECD258629235932A58B168D303FD27DA9E4CC5C02BB7F100DE84014C6E79880
          0360769000F5A9B2A84AC6265E6D912E1B3B1129D5E3807EC286EE397E256479
          3E18C600048E1E78ECDB7A79D6464B2803A88AEAE420C30503E5C0C01ED593F6
          6AB478C2250AC7071B978E4620F570DEA39A19F2F0432F3618E5839D000EED80
          AB14E4369C1037E8E9A3392ACDCD963D7B8049AC9D1A8FFFD9}
        Material.Texture.Disabled = False
        Tag = 0
      end>
    Left = 40
    Top = 176
  end
  object HKS: THKStreams
    Compressed = True
    Encrypted = True
    Key = 'theodor'
    Left = 104
    Top = 176
  end
  object TimerJoy: TTimer
    Interval = 10
    OnTimer = TimerJoyTimer
    Left = 8
    Top = 208
  end
  object TimeTopTour1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimeTopTour1Timer
    Left = 80
    Top = 40
  end
  object TimePosPot1: TTimer
    Enabled = False
    Interval = 30
    OnTimer = TimePosPot1Timer
    Left = 48
    Top = 40
  end
  object TimeOut1: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = TimeOut1Timer
    Left = 16
    Top = 40
  end
  object TimeAsser1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimeAsser1Timer
    Left = 144
    Top = 40
  end
  object TimePosPot2: TTimer
    Enabled = False
    Interval = 30
    OnTimer = TimePosPot2Timer
    Left = 48
    Top = 72
  end
  object TimePosPot3: TTimer
    Enabled = False
    Interval = 30
    OnTimer = TimePosPot3Timer
    Left = 48
    Top = 104
  end
  object TimeOut2: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = TimeOut2Timer
    Left = 16
    Top = 72
  end
  object TimeOut3: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = TimeOut3Timer
    Left = 16
    Top = 104
  end
  object TimeTopTour2: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimeTopTour2Timer
    Left = 80
    Top = 72
  end
  object TimeTopTour3: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimeTopTour3Timer
    Left = 80
    Top = 104
  end
  object TimeAsser2: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimeAsser2Timer
    Left = 144
    Top = 72
  end
  object TimeAsser3: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimeAsser3Timer
    Left = 144
    Top = 104
  end
  object TimeZeroPf1: TTimer
    Enabled = False
    Interval = 670
    OnTimer = TimeZeroPf1Timer
    Left = 112
    Top = 40
  end
  object TimeZeroPf2: TTimer
    Enabled = False
    Interval = 670
    OnTimer = TimeZeroPf2Timer
    Left = 112
    Top = 72
  end
  object TimeZeroPf3: TTimer
    Enabled = False
    Interval = 670
    OnTimer = TimeZeroPf3Timer
    Left = 112
    Top = 104
  end
  object IdUDPServer1: TIdUDPServer
    Active = True
    BufferSize = 250
    Bindings = <>
    DefaultPort = 8090
    OnUDPRead = UDPServerUDPRead
    Left = 8
    Top = 256
  end
  object IdAntiFreeze1: TIdAntiFreeze
    IdleTimeOut = 100
    Left = 48
    Top = 256
  end
  object TimerVentilo: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerVentiloTimer
    Left = 96
    Top = 256
  end
  object IdUDPClient1: TIdUDPClient
    Active = True
    BufferSize = 128
    Host = '192.168.126.110'
    Port = 8090
    Left = 1176
    Top = 120
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 968
    Top = 216
  end
  object Timer_test: TTimer
    Interval = 100
    OnTimer = Timer_testTimer
    Left = 1096
    Top = 848
  end
  object VICON_ON: TTimer
    Enabled = False
    Interval = 100
    OnTimer = VICON_ONTimer
    Left = 1144
    Top = 848
  end
  object VICON_OFF: TTimer
    Enabled = False
    Interval = 100
    OnTimer = VICON_OFFTimer
    Left = 1144
    Top = 880
  end
end
