object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FORMULARIO'
  ClientHeight = 441
  ClientWidth = 712
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 88
    Top = 177
    Width = 80
    Height = 17
    Caption = 'DIMENSION'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 232
    Top = 177
    Width = 114
    Height = 17
    Caption = 'CARGAR VECTOR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 408
    Top = 177
    Width = 126
    Height = 17
    Caption = 'MOSTRAR VECTOR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 72
    Top = 265
    Width = 139
    Height = 17
    Caption = 'CARGAR ALEATORIA}'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 56
    Top = 104
    Width = 593
    Height = 51
    Color = clAppWorkSpace
    ColCount = 1
    DefaultColWidth = 40
    FixedColor = clMoneyGreen
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 93
    Top = 200
    Width = 75
    Height = 25
    Caption = 'ok'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 248
    Top = 200
    Width = 75
    Height = 25
    Caption = 'cargar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 440
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 93
    Top = 288
    Width = 75
    Height = 25
    Caption = 'cargar'
    TabOrder = 4
    OnClick = Button4Click
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 32
    object Menu1: TMenuItem
      Caption = 'Menu'
      object cambiardimension1: TMenuItem
        Caption = 'cambiar dimension'
        OnClick = cambiardimension1Click
      end
      object obtenerdimension1: TMenuItem
        Caption = 'obtener dimension'
        OnClick = obtenerdimension1Click
      end
      object vistadelvector1: TMenuItem
        Caption = 'vista del vector'
        OnClick = vistadelvector1Click
      end
    end
    object procedimientos1: TMenuItem
      Caption = 'procedimientos'
      object insertElement1: TMenuItem
        Caption = 'insertElement'
        OnClick = insertElement1Click
      end
      object insertElement2: TMenuItem
        Caption = 'modElement'
        OnClick = insertElement2Click
      end
      object elimElement1: TMenuItem
        Caption = 'elimElement'
        OnClick = elimElement1Click
      end
      object Ex1: TMenuItem
        Caption = 'exchangeElement'
        OnClick = Ex1Click
      end
      object N1: TMenuItem
        Caption = 'exchangeSort'
        OnClick = N1Click
      end
      object sortSeleccion1: TMenuItem
        Caption = 'selectionSort'
        OnClick = sortSeleccion1Click
      end
      object sortBurbuja1: TMenuItem
        Caption = 'bubbleSort'
        OnClick = sortBurbuja1Click
      end
      object shellSort1: TMenuItem
        Caption = 'shellSort'
        OnClick = shellSort1Click
      end
      object MergeSort1: TMenuItem
        Caption = 'MergeSort'
        OnClick = MergeSort1Click
      end
      object QuickSort1: TMenuItem
        Caption = 'QuickSort'
        OnClick = QuickSort1Click
      end
      object Mezcla2Vectores1: TMenuItem
        Caption = 'Mezcla2Vectores'
        OnClick = Mezcla2Vectores1Click
      end
      object OrdPrimoNoPrimo1: TMenuItem
        Caption = 'OrdPrimoNoPrimo'
        OnClick = OrdPrimoNoPrimo1Click
      end
      object exchangeSortFrecuencia1: TMenuItem
        Caption = 'exchangeSortFrecuencia'
        OnClick = exchangeSortFrecuencia1Click
      end
    end
    object funciones1: TMenuItem
      Caption = 'funciones'
      object getElement1: TMenuItem
        Caption = 'getElement'
      end
      object busqLineal1: TMenuItem
        Caption = 'busqLineal'
        OnClick = busqLineal1Click
      end
      object busqLinealOrdAsc1: TMenuItem
        Caption = 'busqLinealOrdAsc'
        OnClick = busqLinealOrdAsc1Click
      end
      object busqBinaria1: TMenuItem
        Caption = 'busqBinaria'
        OnClick = busqBinaria1Click
      end
      object frecDNum1: TMenuItem
        Caption = 'frecDNum'
        OnClick = frecDNum1Click
      end
      object numMAxFrec1: TMenuItem
        Caption = 'numMaxFrec'
        OnClick = numMAxFrec1Click
      end
      object EsFracc1: TMenuItem
        Caption = 'EsFraccion'
        OnClick = EsFracc1Click
      end
      object vectorDePrimos1: TMenuItem
        Caption = 'vectorDePrimos'
        OnClick = vectorDePrimos1Click
      end
      object vectorDeNoPrimos1: TMenuItem
        Caption = 'vectorDeNoPrimos'
        OnClick = vectorDeNoPrimos1Click
      end
    end
  end
end