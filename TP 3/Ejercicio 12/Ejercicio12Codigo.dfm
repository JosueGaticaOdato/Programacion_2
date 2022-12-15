object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 177
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 90
    Height = 13
    Caption = 'Ingresar Numeros:'
  end
  object Label2: TLabel
    Left = 8
    Top = 95
    Width = 126
    Height = 13
    Caption = 'Ingrese cantidad a sumar:'
  end
  object Numero: TEdit
    Left = 12
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 140
    Top = 8
    Width = 267
    Height = 161
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Ingresar: TButton
    Left = 34
    Top = 57
    Width = 75
    Height = 25
    Caption = 'Ingresar'
    TabOrder = 2
    OnClick = IngresarClick
  end
  object Cantidad: TEdit
    Left = 8
    Top = 114
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Calcular: TButton
    Left = 34
    Top = 141
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 4
    OnClick = CalcularClick
  end
end
