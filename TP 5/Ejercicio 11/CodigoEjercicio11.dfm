object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 11'
  ClientHeight = 293
  ClientWidth = 273
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
  object Label4: TLabel
    Left = 47
    Top = 39
    Width = 46
    Height = 13
    Caption = 'Numero 1'
  end
  object Label3: TLabel
    Left = 177
    Top = 39
    Width = 46
    Height = 13
    Caption = 'Numero 2'
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 273
    Height = 24
    Align = alTop
    Alignment = taCenter
    Caption = 'Maximo Comun Divisor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = -16
    ExplicitWidth = 296
  end
  object Numero1: TEdit
    Left = 8
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1'
  end
  object Numero2: TEdit
    Left = 146
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object btnMCD: TButton
    Left = 96
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 2
    OnClick = btnMCDClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 116
    Width = 259
    Height = 165
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
