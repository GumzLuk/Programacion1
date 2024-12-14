object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'VECTOR LISTA'
  ClientHeight = 503
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  DesignSize = (
    778
    503)
  TextHeight = 15
  object Registro: TLabel
    Left = 208
    Top = 27
    Width = 49
    Height = 15
    Caption = 'Registro :'
  end
  object Label1: TLabel
    Left = 208
    Top = 56
    Width = 50
    Height = 15
    Caption = 'Nombre :'
  end
  object Label2: TLabel
    Left = 208
    Top = 85
    Width = 46
    Height = 15
    Caption = 'Materia :'
  end
  object Label3: TLabel
    Left = 208
    Top = 114
    Width = 54
    Height = 15
    Caption = 'Semestre :'
  end
  object Label4: TLabel
    Left = 208
    Top = 143
    Width = 32
    Height = 15
    Caption = 'Nota :'
  end
  object NotasGrid: TStringGrid
    Left = 32
    Top = 186
    Width = 609
    Height = 224
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    ColCount = 6
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    GridLineWidth = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goFixedRowDefAlign]
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 272
    Top = 24
    Width = 201
    Height = 23
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 272
    Top = 53
    Width = 201
    Height = 23
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 272
    Top = 82
    Width = 201
    Height = 23
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 272
    Top = 111
    Width = 201
    Height = 23
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 272
    Top = 140
    Width = 201
    Height = 23
    TabOrder = 5
  end
  object Button1: TButton
    Left = 552
    Top = 139
    Width = 153
    Height = 25
    Caption = 'adicionar'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 592
    Top = 80
    Width = 97
    Height = 25
    Caption = 'mostrar vector'
    TabOrder = 7
    OnClick = Button2Click
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 48
    object Menu1: TMenuItem
      Caption = 'Metodos'
    end
    object procedimientos1: TMenuItem
      Caption = 'procedimientos'
    end
    object procedimientos2: TMenuItem
      Caption = 'funciones'
      object promedioEstudiante1: TMenuItem
        Caption = 'promedioEstudiante'
        OnClick = promedioEstudiante1Click
      end
    end
  end
end
