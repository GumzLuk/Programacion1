object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 264
    Top = 56
    Width = 40
    Height = 13
    Caption = 'TEXTO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'SimSun'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 248
    Top = 187
    Width = 72
    Height = 13
    Caption = 'RESULTADO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'SimSun'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 136
    Top = 80
    Width = 305
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 136
    Top = 208
    Width = 305
    Height = 23
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 80
    object Menuprincipal1: TMenuItem
      Caption = 'Menu principal'
      object CargarTexto1: TMenuItem
        Caption = 'Cargar Texto'
        OnClick = CargarTexto1Click
      end
      object CargarTexto2: TMenuItem
        Caption = 'Mostrar Texto'
        OnClick = CargarTexto2Click
      end
      object insertChar1: TMenuItem
        Caption = ' insertChar'
        OnClick = insertChar1Click
      end
      object ElimCha1: TMenuItem
        Caption = ' ElimChar'
        OnClick = ElimCha1Click
      end
      object modChar1: TMenuItem
        Caption = 'modChar'
        OnClick = modChar1Click
      end
      object InsertPalDerecha1: TMenuItem
        Caption = 'addPalDerecha'
        OnClick = InsertPalDerecha1Click
      end
      object addPalabraIzquierda1: TMenuItem
        Caption = 'addPalabraIzquierda'
        OnClick = addPalabraIzquierda1Click
      end
      object Nrodepalabras1: TMenuItem
        Caption = 'Nro de palabras'
        OnClick = Nrodepalabras1Click
      end
      object Obtenerpalabraxposicion1: TMenuItem
        Caption = 'Obtener palabra x posicion'
        OnClick = Obtenerpalabraxposicion1Click
      end
      object obtenerlongitud1: TMenuItem
        Caption = 'obtener longitud'
        OnClick = obtenerlongitud1Click
      end
      object EliminarCharsXPos1: TMenuItem
        Caption = 'EliminarCharsXPos'
        OnClick = EliminarCharsXPos1Click
      end
    end
    object Ejercicios1: TMenuItem
      Caption = 'Ejercicios'
      object Ejercicios2: TMenuItem
        Caption = 'Contar vocales'
        OnClick = Ejercicios2Click
      end
      object Nrodepalabras2: TMenuItem
        Caption = 'Palabras que terminan en vocal'
        OnClick = Nrodepalabras2Click
      end
      object Palabrasquecomiencenenconsonante1: TMenuItem
        Caption = 'Palabras que comiencen en consonante'
        OnClick = Palabrasquecomiencenenconsonante1Click
      end
      object Obtenerpalabrasiguiente1: TMenuItem
        Caption = 'Obtener palabra siguiente'
        OnClick = Obtenerpalabrasiguiente1Click
      end
      object Palabrasquecomiencenytermineenconsonante1: TMenuItem
        Caption = 'Palabras que comiencen y termine en consonante '
        OnClick = Palabrasquecomiencenytermineenconsonante1Click
      end
      object mover1: TMenuItem
        Caption = 'moverPosX'
        OnClick = mover1Click
      end
      object insertarpalabra1: TMenuItem
        Caption = 'insertar palabra'
        OnClick = insertarpalabra1Click
      end
      object Palabramenorxalfaabet1: TMenuItem
        Caption = 'Palabra menor x alfabet'
        OnClick = Palabramenorxalfaabet1Click
      end
      object eliminarxposicionpalabra1: TMenuItem
        Caption = 'eliminar x posicion palabra'
        OnClick = eliminarxposicionpalabra1Click
      end
      object ModPalXPos1: TMenuItem
        Caption = 'ModPalabraXPos'
        OnClick = ModPalXPos1Click
      end
      object SubCadXPos1: TMenuItem
        Caption = 'SubCadXPos'
        OnClick = SubCadXPos1Click
      end
    end
    object examen1: TMenuItem
      Caption = 'examen'
      object examen2: TMenuItem
        Caption = 'examen'
        OnClick = examen2Click
      end
      object comprabarsiesnu1: TMenuItem
        Caption = 'comprabar si es nu'
        OnClick = comprabarsiesnu1Click
      end
      object examen41: TMenuItem
        Caption = 'examen 4'
        OnClick = examen41Click
      end
      object Examen51: TMenuItem
        Caption = 'Examen 5'
        OnClick = Examen51Click
      end
    end
    object prueba1: TMenuItem
      Caption = 'auxi'
      object copy1: TMenuItem
        Caption = 'copy'
        OnClick = copy1Click
      end
      object EstaLaSubCad1: TMenuItem
        Caption = 'EstaLaSubCad'
        OnClick = EstaLaSubCad1Click
      end
      object PosDePalConSubCad1: TMenuItem
        Caption = 'PosDePalConSubCad'
        OnClick = PosDePalConSubCad1Click
      end
      object getHora1: TMenuItem
        Caption = 'getHora'
        OnClick = getHora1Click
      end
      object probarLongitud1: TMenuItem
        Caption = 'probarLongitud'
        OnClick = probarLongitud1Click
      end
      object MayPosPal1: TMenuItem
        Caption = 'MayPosPal'
        OnClick = MayPosPal1Click
      end
      object IgualLong1: TMenuItem
        Caption = 'IgualLong'
        OnClick = IgualLong1Click
      end
      object alterar1: TMenuItem
        Caption = 'alterar'
        OnClick = alterar1Click
      end
      object posComoNExamen1: TMenuItem
        Caption = 'posComoNExamen'
        OnClick = posComoNExamen1Click
      end
      object MayXParametros1: TMenuItem
        Caption = 'MayXParametros'
        OnClick = MayXParametros1Click
      end
      object IntercambiarPosDPal1: TMenuItem
        Caption = 'IntercambiarPosDPal'
        OnClick = IntercambiarPosDPal1Click
      end
      object MayXAlfabetParametros1: TMenuItem
        Caption = 'MayXAlfabetParametros'
        OnClick = MayXAlfabetParametros1Click
      end
    end
    object auxi21: TMenuItem
      Caption = 'auxi2'
      object auxi22: TMenuItem
        Caption = 'ordenarXOrdAlfabetico'
        OnClick = auxi22Click
      end
      object redondeo1: TMenuItem
        Caption = 'redondeo'
        OnClick = redondeo1Click
      end
      object sacarFraccion1: TMenuItem
        Caption = 'sacarFraccion'
        OnClick = sacarFraccion1Click
      end
    end
  end
end