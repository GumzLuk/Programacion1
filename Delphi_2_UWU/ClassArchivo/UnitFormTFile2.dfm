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
    Left = 56
    Top = 72
    Width = 521
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
      object CargarArchivo1: TMenuItem
        Caption = 'Cargar Archivo'
        OnClick = CargarArchivo1Click
      end
      object Archivo2: TMenuItem
        Caption = 'Abrir'
        OnClick = Archivo2Click
      end
      object guardar1: TMenuItem
        Caption = 'Guardar'
        OnClick = guardar1Click
      end
      object ActualizarMemo1: TMenuItem
        Caption = 'Actualizar Memo'
        OnClick = ActualizarMemo1Click
      end
    end
    object Procedimientos1: TMenuItem
      Caption = 'Procedimientos'
      object elimPalArchivo1: TMenuItem
        Caption = 'elimPalArchivo'
        OnClick = elimPalArchivo1Click
      end
      object elimLineaTxt1: TMenuItem
        Caption = 'elimLineaTxt'
        OnClick = elimLineaTxt1Click
      end
    end
    object Procedimientos2: TMenuItem
      Caption = 'Funciones'
      object NroLineas1: TMenuItem
        Caption = 'NroLineas'
        OnClick = NroLineas1Click
      end
      object contarPalabras1: TMenuItem
        Caption = 'contarPalabras'
        OnClick = contarPalabras1Click
      end
      object contarLineasvacias1: TMenuItem
        Caption = 'contar Lineas vacias'
        OnClick = contarLineasvacias1Click
      end
      object NroLineaNoVacia1: TMenuItem
        Caption = 'NroLineaNoVacia'
        OnClick = NroLineaNoVacia1Click
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
