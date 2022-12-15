object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 173
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 139
    Top = 44
    Width = 84
    Height = 13
    Alignment = taCenter
    Caption = 'Escriba el numero'
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 375
    Height = 29
    Align = alTop
    Alignment = taCenter
    Caption = 'Serie de Fibonacci'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 192
  end
  object Label3: TLabel
    Left = 56
    Top = 91
    Width = 262
    Height = 13
    Caption = 'El resultado de la serie de Fibonacci en ese numero es:'
  end
  object Numero: TEdit
    Left = 120
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Resultado: TEdit
    Left = 120
    Top = 110
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BtnGenerar: TButton
    Left = 144
    Top = 137
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 2
    OnClick = BtnGenerarClick
  end
end
