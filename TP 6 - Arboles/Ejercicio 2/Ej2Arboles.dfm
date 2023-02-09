object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = btnCargar
  Caption = 'Form1'
  ClientHeight = 416
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object btnCargar: TButton
    Left = 8
    Top = 8
    Width = 139
    Height = 33
    Caption = 'Cargar Arbol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnCargarClick
  end
  object Memo1: TMemo
    Left = 168
    Top = 8
    Width = 417
    Height = 400
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btnMostrar: TButton
    Left = 8
    Top = 47
    Width = 139
    Height = 33
    Caption = 'Mostrar Arbol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnMostrarClick
  end
  object btnPadre: TButton
    Left = 8
    Top = 86
    Width = 139
    Height = 33
    Caption = 'Indicar padre'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnPadreClick
  end
  object btnHijos: TButton
    Left = 8
    Top = 125
    Width = 139
    Height = 33
    Caption = 'Indicar Hijos'
    TabOrder = 4
    OnClick = btnHijosClick
  end
  object btnHermanos: TButton
    Left = 8
    Top = 164
    Width = 139
    Height = 33
    Caption = 'Indicar Hermanos'
    TabOrder = 5
    OnClick = btnHermanosClick
  end
  object btnNivel: TButton
    Left = 8
    Top = 203
    Width = 139
    Height = 33
    Caption = 'Indicar Nivel'
    TabOrder = 6
    OnClick = btnNivelClick
  end
  object btnAltura: TButton
    Left = 8
    Top = 242
    Width = 139
    Height = 33
    Caption = 'Indicar Altura'
    TabOrder = 7
    OnClick = btnAlturaClick
  end
  object btnNodosNivel: TButton
    Left = 8
    Top = 281
    Width = 139
    Height = 33
    Caption = 'Nodos con el mismo nivel'
    TabOrder = 8
    OnClick = btnNodosNivelClick
  end
  object Button1: TButton
    Left = 8
    Top = 320
    Width = 60
    Height = 49
    Caption = 'Cargar Arbol 2 Distinto'
    TabOrder = 9
    WordWrap = True
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 87
    Top = 320
    Width = 60
    Height = 49
    Caption = 'Cargar Arbol 2 Igual'
    TabOrder = 10
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 375
    Width = 139
    Height = 33
    Caption = #191'Son equivalentes?'
    TabOrder = 11
    OnClick = Button3Click
  end
end
