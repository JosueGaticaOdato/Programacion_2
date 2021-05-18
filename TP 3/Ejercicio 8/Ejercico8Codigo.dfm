object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 137
  ClientWidth = 287
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
  object Cadena: TEdit
    Left = 8
    Top = 9
    Width = 185
    Height = 25
    TabOrder = 0
    Text = 'Cadena'
  end
  object Memo1: TMemo
    Left = 8
    Top = 40
    Width = 271
    Height = 89
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssHorizontal
    TabOrder = 1
  end
  object Generar: TButton
    Left = 204
    Top = 8
    Width = 75
    Height = 26
    Caption = 'Generar'
    TabOrder = 2
    OnClick = GenerarClick
  end
end
