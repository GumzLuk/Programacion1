object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 490
  ClientWidth = 764
  Color = clBisque
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 192
    Top = 48
    Width = 71
    Height = 17
    Caption = 'Nro. Filas : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 269
    Top = 50
    Width = 7
    Height = 17
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 454
    Top = 48
    Width = 7
    Height = 17
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 344
    Top = 48
    Width = 104
    Height = 17
    Caption = 'Nro. Columnas : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 152
    Top = 88
    Width = 457
    Height = 249
    FixedCols = 0
    FixedRows = 0
    GridLineWidth = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Button1: TButton
    Left = 8
    Top = 160
    Width = 122
    Height = 25
    Caption = 'Nro filas/columnas'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 208
    Width = 121
    Height = 25
    Caption = 'Cargar Matriz'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 256
    Width = 121
    Height = 25
    Caption = 'Descargar matriz'
    TabOrder = 3
    OnClick = Button3Click
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 16
    object Matriz1: TMenuItem
      Caption = 'Metodos'
      object verMatriz1: TMenuItem
        Caption = 'ver Matriz'
        OnClick = verMatriz1Click
      end
      object Matriz2: TMenuItem
        Caption = 'Cargar uno a uno'
        OnClick = Matriz2Click
      end
      object CargaAleatoria1: TMenuItem
        Caption = 'Carga Aleatoria'
        OnClick = CargaAleatoria1Click
      end
    end
    object procedimientos1: TMenuItem
      Caption = 'procedimientos'
      object CargarCadenaPalabras1: TMenuItem
        Caption = 'CargarCadenaPalabras'
        OnClick = CargarCadenaPalabras1Click
      end
      object CargarPalabrasEnMatriz1: TMenuItem
        Caption = 'CargarPalabrasEnMatriz'
        OnClick = CargarPalabrasEnMatriz1Click
      end
    end
    object Metodos1: TMenuItem
      Caption = 'funciones'
      object SacarCharsIzquierda1: TMenuItem
        Caption = 'GetCharLeft'
        OnClick = SacarCharsIzquierda1Click
      end
      object GetCharRigh1: TMenuItem
        Caption = 'GetCharRight'
        OnClick = GetCharRigh1Click
      end
      object GetCharUp2: TMenuItem
        Caption = 'GetCharDown'
        OnClick = GetCharUp2Click
      end
      object GetCharUp1: TMenuItem
        Caption = 'GetCharUp'
        OnClick = GetCharUp1Click
      end
      object ExistePalabra1: TMenuItem
        Caption = 'Existe Palabra'
        OnClick = ExistePalabra1Click
      end
      object estaVacio1: TMenuItem
        Caption = 'estaVacioFila'
        OnClick = estaVacio1Click
      end
      object estaVacioFila1: TMenuItem
        Caption = '.estaVacioColumna'
        OnClick = estaVacioFila1Click
      end
      object cabeEnMatrizDerecha1: TMenuItem
        Caption = 'cabeEnMatrizDerecha'
        OnClick = cabeEnMatrizDerecha1Click
      end
      object cabeEnMatrizAbajo1: TMenuItem
        Caption = 'cabeEnMatrizAbajo'
        OnClick = cabeEnMatrizAbajo1Click
      end
    end
  end
end