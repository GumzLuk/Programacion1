object FormSOKOBAN: TFormSOKOBAN
  Left = 0
  Top = 0
  Caption = 'SOKOBAN'
  ClientHeight = 441
  ClientWidth = 720
  Color = clGradientInactiveCaption
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 57
    Height = 25
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 272
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object TimerFigura: TTimer
    Interval = 10
    OnTimer = TimerFiguraTimer
    Left = 432
    Top = 304
  end
end