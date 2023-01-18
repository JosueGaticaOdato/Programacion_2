object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 4'
  ClientHeight = 393
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 126
    Height = 13
    Alignment = taCenter
    Caption = 'Ingrese un n'#250'mero binario'
  end
  object Label2: TLabel
    Left = 29
    Top = 77
    Width = 134
    Height = 13
    Alignment = taCenter
    Caption = 'Ingrese otro n'#250'mero binario'
  end
  object Label3: TLabel
    Left = 29
    Top = 132
    Width = 48
    Height = 13
    Alignment = taCenter
    Caption = 'Resultado'
  end
  object Label4: TLabel
    Left = 72
    Top = 300
    Width = 143
    Height = 13
    Alignment = taCenter
    Caption = 'Convertir de Decimal a Binario'
  end
  object Label5: TLabel
    Left = 72
    Top = 201
    Width = 143
    Height = 13
    Alignment = taCenter
    Caption = 'Convertir de Binario a Decimal'
  end
  object Label6: TLabel
    Left = 135
    Top = 234
    Width = 36
    Height = 13
    Caption = '------->'
  end
  object Label7: TLabel
    Left = 133
    Top = 327
    Width = 36
    Height = 13
    Caption = '------->'
  end
  object binario1: TEdit
    Left = 29
    Top = 43
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object binario2: TEdit
    Left = 29
    Top = 96
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object btnSuma: TButton
    Left = 197
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Suma binaria'
    TabOrder = 2
    OnClick = btnSumaClick
  end
  object btnResta: TButton
    Left = 197
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Resta Binaria'
    TabOrder = 3
    OnClick = btnRestaClick
  end
  object btnConversion1: TButton
    Left = 91
    Top = 266
    Width = 108
    Height = 25
    Caption = 'Conversion Binario'
    TabOrder = 4
    OnClick = btnConversion1Click
  end
  object btnAND: TButton
    Left = 197
    Top = 87
    Width = 75
    Height = 25
    Caption = 'AND'
    TabOrder = 5
    OnClick = btnANDClick
  end
  object btnOR: TButton
    Left = 197
    Top = 118
    Width = 75
    Height = 25
    Caption = 'OR'
    TabOrder = 6
    OnClick = btnORClick
  end
  object btnXOR: TButton
    Left = 197
    Top = 149
    Width = 75
    Height = 25
    Caption = 'XOR'
    TabOrder = 7
    OnClick = btnXORClick
  end
  object btnConversion2: TButton
    Left = 90
    Top = 351
    Width = 109
    Height = 25
    Caption = 'Conversion Decimal'
    TabOrder = 8
    OnClick = btnConversion2Click
  end
  object Result: TEdit
    Left = 29
    Top = 151
    Width = 145
    Height = 21
    TabOrder = 9
  end
  object CBinario: TEdit
    Left = 8
    Top = 231
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object CDecimal: TEdit
    Left = 8
    Top = 324
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object ResultBD: TEdit
    Left = 171
    Top = 231
    Width = 121
    Height = 21
    TabOrder = 12
  end
  object ResultDB: TEdit
    Left = 171
    Top = 324
    Width = 121
    Height = 21
    TabOrder = 13
  end
end
