object Ejercicio3: TEjercicio3
  Left = 0
  Top = 0
  Caption = 'Ejercicio3'
  ClientHeight = 186
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 21
    Width = 50
    Height = 13
    Alignment = taCenter
    Caption = 'Numero 1:'
  end
  object Label2: TLabel
    Left = 24
    Top = 125
    Width = 50
    Height = 13
    Alignment = taCenter
    Caption = 'Numero 2:'
  end
  object Label3: TLabel
    Left = 70
    Top = 76
    Width = 22
    Height = 48
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 214
    Top = 66
    Width = 165
    Height = 13
    Caption = 'El resultado de la multiplicacion es:'
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
  object BtnMultiplicar: TButton
    Left = 252
    Top = 134
    Width = 75
    Height = 25
    Caption = 'Multiplicar'
    TabOrder = 3
    OnClick = BtnMultiplicarClick
  end
end
