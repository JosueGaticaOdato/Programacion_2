object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 180
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 21
    Width = 142
    Height = 13
    Caption = 'Cantidad contagiados del dia:'
  end
  object Label1: TLabel
    Left = 16
    Top = 84
    Width = 179
    Height = 13
    Caption = 'Cantidad contagiados del dia anterior'
  end
  object CN: TEdit
    Left = 16
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'CN'
  end
  object CNmenos: TEdit
    Left = 8
    Top = 103
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object Memo1: TMemo
    Left = 209
    Top = 8
    Width = 208
    Height = 164
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 16
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
end
