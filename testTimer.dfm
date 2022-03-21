object Form1: TForm1
  Left = 1324
  Top = 290
  Width = 279
  Height = 162
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GaugeStDur: TGauge
    Left = 40
    Top = 64
    Width = 201
    Height = 9
    BackColor = clLime
    ForeColor = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxValue = 45
    ParentFont = False
    Progress = 0
    ShowText = False
  end
  object LblStDurMax: TLabel
    Left = 200
    Top = 73
    Width = 41
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '7.85  '
    Color = clMoneyGreen
    ParentColor = False
  end
  object LblStDurMin: TLabel
    Left = 160
    Top = 73
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
    Top = 73
    Width = 41
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '7.85  '
    Color = clMoneyGreen
    ParentColor = False
  end
  object LblStDurMoy: TLabel
    Left = 80
    Top = 73
    Width = 41
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '5.63  '
    Color = clActiveBorder
    ParentColor = False
  end
  object LblStDurMes: TLabel
    Left = 40
    Top = 73
    Width = 41
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '7.85  '
    Color = clMoneyGreen
    ParentColor = False
  end
  object LblStDurUnt: TLabel
    Left = 10
    Top = 76
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
  object RSTimer1: TRSTimer
    Left = 96
    Top = 8
    Width = 32
    Height = 32
    OnTimer = RSTimer1Timer
    ControlData = {010002004F0300004F03000040000000000300000001}
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 16
    Top = 8
  end
  object AsyncTimer1: TAsyncTimer
    Interval = 5
    OnTimer = AsyncTimer1Timer
    ThreadPriority = tpNormal
    Left = 56
    Top = 8
  end
end
