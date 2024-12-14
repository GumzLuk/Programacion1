object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FORMULARIO'
  ClientHeight = 431
  ClientWidth = 712
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Visible = True
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
    Left = 8
    Top = 104
    Width = 689
    Height = 51
    ColCount = 1
    DefaultColWidth = 88
    FixedColor = clWindow
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    GridLineWidth = 3
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
        Caption = 'insertElementIzquierda'
        OnClick = insertElement1Click
      end
      object insertElementDerecha1: TMenuItem
        Caption = 'insertElementDerecha'
        OnClick = insertElementDerecha1Click
      end
      object insertElement2: TMenuItem
        Caption = 'modElement'
        OnClick = insertElement2Click
      end
      object elimElement1: TMenuItem
        Caption = 'elimElement'
        OnClick = elimElement1Click
      end
      object addElement1: TMenuItem
        Caption = 'addElement'
        OnClick = addElement1Click
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
      object QuickSortReverse1: TMenuItem
        Caption = 'QuickSortReverse'
        OnClick = QuickSortReverse1Click
      end
      object pasarXParametroNuevosElems1: TMenuItem
        Caption = 'pasarXParametroNuevosElems'
        OnClick = pasarXParametroNuevosElems1Click
      end
    end
    object funciones1: TMenuItem
      Caption = 'funciones'
      object getElement1: TMenuItem
        Caption = 'getElement'
        OnClick = getElement1Click
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
      object FrecDDigEnElem1: TMenuItem
        Caption = 'FrecDDigEnElem'
        OnClick = FrecDDigEnElem1Click
      end
      object ObtDate1: TMenuItem
        Caption = 'ObtDate'
        OnClick = ObtDate1Click
      end
    end
    object ejercicios1: TMenuItem
      Caption = 'ejercicios'
      object ejercicios2: TMenuItem
        Caption = 'OrdenarCeroYNoCero'
        OnClick = ejercicios2Click
      end
    end
  end
end
