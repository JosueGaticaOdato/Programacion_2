object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 166
  ClientWidth = 233
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
    Left = 21
    Top = 11
    Width = 41
    Height = 13
    Caption = 'Numero:'
  end
  object Numero: TEdit
    Left = 80
    Top = 8
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'Numero'
  end
  object Memo1: TMemo
    Left = 8
    Top = 43
    Width = 217
    Height = 78
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Comprobar: TButton
    Left = 72
    Top = 133
    Width = 75
    Height = 25
    Caption = 'Comprobar'
    TabOrder = 2
    OnClick = ComprobarClick
  end
end
