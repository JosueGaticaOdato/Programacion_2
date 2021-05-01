object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 799
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
    Left = 16
    Top = 152
    Width = 166
    Height = 16
    Caption = 'Ingresa la patente de tu auto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 232
    Top = 48
    Width = 457
    Height = 369
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 48
    Width = 169
    Height = 33
    Caption = 'Guardar auto'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 104
    Width = 169
    Height = 33
    Caption = 'Retirar auto'
    TabOrder = 2
  end
  object Patente: TEdit
    Left = 16
    Top = 176
    Width = 169
    Height = 21
    TabOrder = 3
  end
end
