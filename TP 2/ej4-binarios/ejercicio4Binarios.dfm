object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 4'
  ClientHeight = 320
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 37
    Width = 126
    Height = 13
    Alignment = taCenter
    Caption = 'Ingrese un n'#250'mero binario'
  end
  object Label2: TLabel
    Left = 64
    Top = 100
    Width = 134
    Height = 13
    Alignment = taCenter
    Caption = 'Ingrese otro n'#250'mero binario'
  end
  object Memo1: TMemo
    Left = 280
    Top = 8
    Width = 329
    Height = 291
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object binario1: TEdit
    Left = 64
    Top = 64
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object binario2: TEdit
    Left = 64
    Top = 123
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object btnSuma: TButton
    Left = 48
    Top = 169
    Width = 75
    Height = 25
    Caption = 'Suma binaria'
    TabOrder = 3
    OnClick = btnSumaClick
  end
  object btnResta: TButton
    Left = 143
    Top = 169
    Width = 75
    Height = 25
    Caption = 'Resta Binaria'
    TabOrder = 4
    OnClick = btnRestaClick
  end
  object btnConversion1: TButton
    Left = 15
    Top = 208
    Width = 108
    Height = 25
    Caption = 'Conversion Binario 1'
    TabOrder = 5
    OnClick = btnConversion1Click
  end
  object btnAND: TButton
    Left = 15
    Top = 256
    Width = 75
    Height = 25
    Caption = 'AND'
    TabOrder = 6
    OnClick = btnANDClick
  end
  object btnOR: TButton
    Left = 96
    Top = 256
    Width = 75
    Height = 25
    Caption = 'OR'
    TabOrder = 7
    OnClick = btnORClick
  end
  object btnXOR: TButton
    Left = 177
    Top = 256
    Width = 75
    Height = 25
    Caption = 'XOR'
    TabOrder = 8
    OnClick = btnXORClick
  end
  object btnConversion2: TButton
    Left = 143
    Top = 208
    Width = 109
    Height = 25
    Caption = 'Conversion Binario 2'
    TabOrder = 9
    OnClick = btnConversion2Click
  end
end
