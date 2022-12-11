object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 490
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Edit1: TEdit
    Left = 16
    Top = 16
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 152
    Top = 16
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'Edit2'
  end
  object CheckBox1: TCheckBox
    Left = 282
    Top = 19
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 385
    Top = 8
    Width = 64
    Height = 42
    Caption = 'Generar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 56
    Width = 441
    Height = 281
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object Button2: TButton
    Left = 16
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Sumatoria'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 97
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Promedio'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 282
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Maximo'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 374
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Minimo'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Edit3: TEdit
    Left = 128
    Top = 398
    Width = 211
    Height = 23
    TabOrder = 9
    Text = 'Edit3'
  end
  object Button6: TButton
    Left = 8
    Top = 427
    Width = 218
    Height = 25
    Caption = 'Separador'
    TabOrder = 10
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 232
    Top = 427
    Width = 217
    Height = 25
    Caption = 'Escalar'
    TabOrder = 11
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 192
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 12
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 8
    Top = 458
    Width = 439
    Height = 25
    Caption = 'Crear nuevo vector y hacer la suma miembro a miembro'
    TabOrder = 13
    OnClick = Button9Click
  end
end
