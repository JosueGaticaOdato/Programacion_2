object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 197
  ClientWidth = 465
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
    Left = 64
    Top = 13
    Width = 41
    Height = 13
    Caption = 'Numero:'
  end
  object Label2: TLabel
    Left = 64
    Top = 77
    Width = 36
    Height = 13
    Caption = 'Bomba:'
  end
  object Memo1: TMemo
    Left = 176
    Top = 8
    Width = 272
    Height = 169
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 24
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 49
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 3
    OnClick = Button1Click
  end
end
