object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 183
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 176
    Top = 67
    Width = 83
    Height = 15
    Caption = '--------------->'
  end
  object Edit1: TEdit
    Left = 8
    Top = 16
    Width = 422
    Height = 23
    TabOrder = 0
    Text = 'Numero'
  end
  object Button1: TButton
    Left = 176
    Top = 112
    Width = 83
    Height = 25
    Caption = 'Generar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 64
    Width = 145
    Height = 23
    TabOrder = 2
    Text = 'Desde'
    Items.Strings = (
      'Binario'
      'Decimal'
      'Octal'
      'Hexadecimal')
  end
  object ComboBox2: TComboBox
    Left = 285
    Top = 64
    Width = 145
    Height = 23
    TabOrder = 3
    Text = 'Hasta'
    Items.Strings = (
      'Binario'
      'Decimal'
      'Octal'
      'Hexadecimal')
  end
  object Edit2: TEdit
    Left = 8
    Top = 160
    Width = 422
    Height = 23
    TabOrder = 4
    Text = 'Resultado'
  end
end
