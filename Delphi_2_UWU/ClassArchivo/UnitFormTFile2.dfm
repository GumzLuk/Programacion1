object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Memo1: TMemo
    Left = 104
    Top = 72
    Width = 385
    Height = 233
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 16
    object Archivo1: TMenuItem
      Caption = 'Archivo'
      object Archivo2: TMenuItem
        Caption = 'Abrir'
        OnClick = Archivo2Click
      end
      object guardar1: TMenuItem
        Caption = 'Guardar'
        OnClick = guardar1Click
      end
      object Colocarcadenaentxt1: TMenuItem
        Caption = 'Colocar cadena en txt'
        OnClick = Colocarcadenaentxt1Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 200
    Top = 184
  end
  object OpenDialog1: TOpenDialog
    Left = 336
    Top = 184
  end
end