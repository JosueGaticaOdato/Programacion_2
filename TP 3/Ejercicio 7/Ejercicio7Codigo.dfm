object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 7'
  ClientHeight = 155
  ClientWidth = 394
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
    Left = 14
    Top = 29
    Width = 129
    Height = 13
    Caption = 'Indique el nivel de Reunion'
  end
  object Nivel_Reunion: TEdit
    Left = 18
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object BtnGenerar: TButton
    Left = 40
    Top = 91
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 1
    OnClick = BtnGenerarClick
  end
  object Memo1: TMemo
    Left = 160
    Top = 8
    Width = 226
    Height = 139
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
end
