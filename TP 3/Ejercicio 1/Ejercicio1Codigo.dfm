object Ejercicio_1: TEjercicio_1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 1'
  ClientHeight = 171
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 36
    Width = 121
    Height = 13
    Caption = 'Ingrese la palabra:'
  end
  object Palabra: TEdit
    Left = 28
    Top = 68
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Neuquen'
  end
  object BtnPalindromo: TButton
    Left = 38
    Top = 108
    Width = 93
    Height = 25
    Caption = #191'Es palindromo?'
    TabOrder = 1
    OnClick = BtnPalindromoClick
  end
  object Memo1: TMemo
    Left = 176
    Top = 8
    Width = 193
    Height = 155
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
end
