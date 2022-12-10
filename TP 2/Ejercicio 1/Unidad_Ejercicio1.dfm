object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 389
  ClientWidth = 176
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object N1: TEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'Numero 1'
    OnChange = N1Change
  end
  object N2: TEdit
    Left = 24
    Top = 72
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'Numero 2'
    OnChange = N2Change
  end
  object Button1: TButton
    Left = 24
    Top = 120
    Width = 121
    Height = 25
    Caption = 'Suma'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 160
    Width = 121
    Height = 25
    Caption = 'Resta'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 200
    Width = 121
    Height = 25
    Caption = 'Producto'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 240
    Width = 121
    Height = 25
    Caption = 'Division'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 24
    Top = 271
    Width = 121
    Height = 25
    Caption = 'Potencia'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 24
    Top = 302
    Width = 121
    Height = 25
    Caption = 'Comparar'
    TabOrder = 7
    OnClick = Button6Click
  end
  object Resultado: TEdit
    Left = 24
    Top = 351
    Width = 121
    Height = 23
    Alignment = taCenter
    TabOrder = 8
    Text = 'Resultado'
  end
end
