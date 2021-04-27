object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 286
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 0
    Text = 'Decimal'
  end
  object Button1: TButton
    Left = 16
    Top = 51
    Width = 121
    Height = 25
    Caption = 'Convertir'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 115
    Width = 121
    Height = 25
    Caption = 'Convertir'
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 16
    Top = 88
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 3
    Text = 'Binario'
  end
  object Button3: TButton
    Left = 16
    Top = 179
    Width = 121
    Height = 25
    Caption = 'Convertir'
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 16
    Top = 152
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 5
    Text = 'Hexadecimal'
  end
  object Button4: TButton
    Left = 16
    Top = 243
    Width = 121
    Height = 25
    Caption = 'Convertir'
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 16
    Top = 216
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 7
    Text = 'Octal'
  end
  object Memo1: TMemo
    Left = 160
    Top = 24
    Width = 241
    Height = 244
    Lines.Strings = (
      'Memo1')
    TabOrder = 8
  end
end
