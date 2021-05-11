object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 161
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 64
    Top = 83
    Width = 182
    Height = 13
    Alignment = taCenter
    Caption = 'El resultado de colocarle los puntos es'
  end
  object Label1: TLabel
    Left = 115
    Top = 36
    Width = 84
    Height = 13
    Alignment = taCenter
    Caption = 'Escriba el numero'
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 321
    Height = 29
    Align = alTop
    Alignment = taCenter
    Caption = 'Colocar Puntos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 157
  end
  object Resultado: TEdit
    Left = 96
    Top = 102
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object BtnGenerar: TButton
    Left = 120
    Top = 129
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 1
    OnClick = BtnGenerarClick
  end
  object Numero: TEdit
    Left = 96
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
  end
end
