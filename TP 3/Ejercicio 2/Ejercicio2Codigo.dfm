object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 183
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
  object Label1: TLabel
    Left = 24
    Top = 147
    Width = 246
    Height = 13
    Caption = 'El maximo comun divisor entre esos dos numero es:'
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 447
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
    ExplicitWidth = 204
  end
  object Label3: TLabel
    Left = 305
    Top = 39
    Width = 46
    Height = 13
    Caption = 'Numero 2'
  end
  object Label4: TLabel
    Left = 89
    Top = 39
    Width = 46
    Height = 13
    Caption = 'Numero 1'
  end
  object Numero1: TEdit
    Left = 50
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1'
  end
  object btnMCD: TButton
    Left = 176
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 1
    OnClick = btnMCDClick
  end
  object Numero2: TEdit
    Left = 266
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '1'
  end
  object MCDEdit: TEdit
    Left = 276
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 3
  end
end
