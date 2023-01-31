object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 376
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Tarjeta: TEdit
    Left = 8
    Top = 8
    Width = 185
    Height = 23
    TabOrder = 0
    Text = '2121'
  end
  object Button1: TButton
    Left = 8
    Top = 37
    Width = 398
    Height = 25
    Caption = 'Cargar y validad'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Fecha: TDateTimePicker
    Left = 220
    Top = 8
    Width = 186
    Height = 23
    Date = 45313.000000000000000000
    Time = 0.213576666668814100
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 8
    Top = 188
    Width = 398
    Height = 181
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object Button2: TButton
    Left = 8
    Top = 68
    Width = 400
    Height = 25
    Caption = 'Obtener entidad emisora'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 99
    Width = 400
    Height = 25
    Caption = 'Mostrar limites de compra'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Valor: TEdit
    Left = 8
    Top = 130
    Width = 129
    Height = 23
    TabOrder = 6
    Text = 'Valor'
  end
  object Button4: TButton
    Left = 8
    Top = 159
    Width = 398
    Height = 23
    Caption = 'Comprar'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Cuotas: TCheckBox
    Left = 143
    Top = 130
    Width = 83
    Height = 23
    Caption = 'en Cuotas?'
    TabOrder = 8
  end
  object CantCuotas: TComboBox
    Left = 232
    Top = 130
    Width = 176
    Height = 23
    TabOrder = 9
    Text = '1'
    Items.Strings = (
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
  end
end
