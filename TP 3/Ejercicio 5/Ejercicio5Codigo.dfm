object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 187
  ClientWidth = 392
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
    Top = 21
    Width = 50
    Height = 13
    Alignment = taCenter
    Caption = 'Numero 1:'
  end
  object Label3: TLabel
    Left = 76
    Top = 70
    Width = 15
    Height = 48
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 125
    Width = 50
    Height = 13
    Alignment = taCenter
    Caption = 'Numero 2:'
  end
  object Label5: TLabel
    Left = 169
    Top = 65
    Width = 29
    Height = 48
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 222
    Top = 65
    Width = 138
    Height = 13
    Caption = 'El resultado de la division es:'
  end
  object Numero1: TEdit
    Left = 24
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1'
  end
  object Numero2: TEdit
    Left = 24
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object Resultado: TEdit
    Left = 231
    Top = 85
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object BtnDividir: TButton
    Left = 252
    Top = 134
    Width = 75
    Height = 25
    Caption = 'Dividir'
    TabOrder = 3
    OnClick = BtnDividirClick
  end
end
