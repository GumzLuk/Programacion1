object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'MATRIZ'
  ClientHeight = 489
  ClientWidth = 765
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 232
    Top = 30
    Width = 9
    Height = 21
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 153
    Top = 30
    Width = 57
    Height = 21
    Caption = 'Filas  :='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 329
    Top = 30
    Width = 99
    Height = 21
    Caption = 'Columnas  :='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 456
    Top = 30
    Width = 9
    Height = 21
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 136
    Top = 72
    Width = 537
    Height = 273
    FixedCols = 0
    FixedRows = 0
    GridLineWidth = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
    StyleName = 'Windows'
  end
  object Button1: TButton
    Left = 8
    Top = 136
    Width = 113
    Height = 25
    Caption = 'Nro Fila/Columna'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 208
    Width = 113
    Height = 25
    Caption = 'Cargar Matriz'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 272
    Width = 115
    Height = 25
    Caption = 'Descargar Matriz'
    TabOrder = 3
    OnClick = Button3Click
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 40
    object MenuP1: TMenuItem
      Caption = 'MenuP'
      object verMatriz1: TMenuItem
        Caption = 'ver Matriz'
        OnClick = verMatriz1Click
      end
      object cargaaleatoria1: TMenuItem
        Caption = 'carga aleatoria'
        OnClick = cargaaleatoria1Click
      end
      object CargarUnoaUno1: TMenuItem
        Caption = 'Cargar Uno a Uno'
        OnClick = CargarUnoaUno1Click
      end
      object MenuP2: TMenuItem
        Caption = 'get Filas'
        OnClick = MenuP2Click
      end
      object ObtenerColumnas1: TMenuItem
        Caption = 'get Columnas'
        OnClick = ObtenerColumnas1Click
      end
      object Redimensionar1: TMenuItem
        Caption = 'Redimensionar'
        OnClick = Redimensionar1Click
      end
    end
    object procedimiento1: TMenuItem
      Caption = 'procedimientos'
      object modCelda1: TMenuItem
        Caption = 'modCelda'
        OnClick = modCelda1Click
      end
      object insertFila1: TMenuItem
        Caption = 'insertFila'
        OnClick = insertFila1Click
      end
      object modCelda2: TMenuItem
        Caption = 'insertColumna'
        OnClick = modCelda2Click
      end
      object elimColumna1: TMenuItem
        Caption = 'elimColumna'
        OnClick = elimColumna1Click
      end
      object elimColumna2: TMenuItem
        Caption = 'elimFila'
        OnClick = elimColumna2Click
      end
      object IntercambiarFila1: TMenuItem
        Caption = 'IntercambiarFila'
        OnClick = IntercambiarFila1Click
      end
      object IntercambiarColumna1: TMenuItem
        Caption = 'IntercambiarColumna'
        OnClick = IntercambiarColumna1Click
      end
      object exchangeCeldas1: TMenuItem
        Caption = 'exchangeCeldas'
        OnClick = exchangeCeldas1Click
      end
      object QuickSortFila1: TMenuItem
        Caption = 'QuickSortFila'
        OnClick = QuickSortFila1Click
      end
    end
    object funciones1: TMenuItem
      Caption = 'funciones'
      object MaxNMatriz1: TMenuItem
        Caption = 'MaxNMatriz'
        OnClick = MaxNMatriz1Click
      end
    end
    object series1: TMenuItem
      Caption = 'series'
      object series2: TMenuItem
        Caption = 'SerieNormalPAF'
        OnClick = series2Click
      end
      object SerieSerpiente1: TMenuItem
        Caption = 'SerieSerpiente'
        OnClick = SerieSerpiente1Click
      end
      object SerieCuadradoHaciaAbajo1: TMenuItem
        Caption = 'SerieCuadradoHaciaAbajo'
        OnClick = SerieCuadradoHaciaAbajo1Click
      end
      object SerieSerpienteR1: TMenuItem
        Caption = 'SerieSerpienteR'
        OnClick = SerieSerpienteR1Click
      end
    end
  end
end