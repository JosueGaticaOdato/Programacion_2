object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 332
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 231
    Width = 48
    Height = 13
    Caption = 'Elemento:'
  end
  object Label2: TLabel
    Left = 173
    Top = 231
    Width = 42
    Height = 13
    Caption = 'Posicion:'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 90
    Height = 42
    Caption = 'Cargar aleatorio ambas colas'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 105
    Top = 8
    Width = 212
    Height = 145
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 56
    Width = 91
    Height = 17
    Caption = 'Mostrar Cola 1'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 104
    Width = 91
    Height = 49
    Caption = 'Concatenar'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 269
    Width = 91
    Height = 49
    Caption = 'Chequear si existe elemento'
    TabOrder = 4
    WordWrap = True
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 223
    Top = 269
    Width = 94
    Height = 49
    Caption = 'Eliminar elemento'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 116
    Top = 269
    Width = 94
    Height = 49
    Caption = 'Agregar elemento'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 159
    Width = 91
    Height = 49
    Caption = 'Contar elementos'
    TabOrder = 7
    WordWrap = True
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 116
    Top = 159
    Width = 91
    Height = 49
    Caption = 'Copia'
    TabOrder = 8
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 227
    Top = 159
    Width = 91
    Height = 49
    Caption = 'Invertir'
    TabOrder = 9
    OnClick = Button9Click
  end
  object Edit1: TEdit
    Left = 94
    Top = 228
    Width = 51
    Height = 21
    TabOrder = 10
  end
  object Edit2: TEdit
    Left = 227
    Top = 228
    Width = 66
    Height = 21
    TabOrder = 11
  end
  object Button10: TButton
    Left = 8
    Top = 79
    Width = 91
    Height = 17
    Caption = 'Mostrar Cola 2'
    TabOrder = 12
    OnClick = Button10Click
  end
end
