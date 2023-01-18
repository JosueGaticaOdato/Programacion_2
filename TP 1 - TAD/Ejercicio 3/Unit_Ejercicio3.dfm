object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 351
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Memo1: TMemo
    Left = 208
    Top = 8
    Width = 329
    Height = 334
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 133
    Width = 185
    Height = 25
    Caption = 'Diagonal Principal'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 195
    Width = 185
    Height = 25
    Caption = 'Maxima fila'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 164
    Width = 185
    Height = 25
    Caption = 'Diagonal opuesta'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 226
    Width = 185
    Height = 25
    Caption = 'Maxima columna'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 9
    Top = 317
    Width = 185
    Height = 25
    Caption = 'Multiplicar escalar'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 9
    Top = 286
    Width = 185
    Height = 25
    Caption = 'Buscar'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Edit1: TEdit
    Left = 9
    Top = 257
    Width = 185
    Height = 23
    TabOrder = 7
    Text = 'Edit1'
  end
  object Button7: TButton
    Left = 8
    Top = 8
    Width = 187
    Height = 25
    Caption = 'Cargar'
    TabOrder = 8
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 8
    Top = 39
    Width = 187
    Height = 26
    Caption = 'Mostrar'
    TabOrder = 9
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 8
    Top = 71
    Width = 186
    Height = 25
    Caption = 'Sumar con otra matriz'
    TabOrder = 10
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 8
    Top = 102
    Width = 186
    Height = 25
    Caption = 'Multiplicar con otra matriz'
    TabOrder = 11
    OnClick = Button10Click
  end
end
