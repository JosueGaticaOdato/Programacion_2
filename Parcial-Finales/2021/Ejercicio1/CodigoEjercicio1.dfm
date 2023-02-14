object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 151
  ClientWidth = 530
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
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 33
    Caption = 'Cargar lista al azar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 113
    Width = 121
    Height = 33
    Caption = 'Ejecutar funcion'
    TabOrder = 1
    OnClick = Button2Click
  end
  object N: TEdit
    Left = 8
    Top = 86
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'N'
  end
  object Memo1: TMemo
    Left = 135
    Top = 8
    Width = 387
    Height = 138
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object Button3: TButton
    Left = 8
    Top = 47
    Width = 121
    Height = 33
    Caption = 'Mostrar lista'
    TabOrder = 4
    OnClick = Button3Click
  end
end
