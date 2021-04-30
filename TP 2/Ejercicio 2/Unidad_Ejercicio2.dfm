object Ejercicio2: TEjercicio2
  Left = 0
  Top = 0
  Caption = 'Ejercicio2'
  ClientHeight = 370
  ClientWidth = 646
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
    Left = 8
    Top = 24
    Width = 194
    Height = 13
    Alignment = taCenter
    Caption = 'Determinar tama'#241'o del vector:'
  end
  object Label2: TLabel
    Left = 8
    Top = 93
    Width = 194
    Height = 13
    Alignment = taCenter
    Caption = 'Determinar minimo valor:'
  end
  object Label3: TLabel
    Left = 8
    Top = 168
    Width = 194
    Height = 13
    Alignment = taCenter
    Caption = 'Determinar  maximo valor:'
  end
  object Button1: TButton
    Left = 64
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 0
  end
  object Tamaño: TEdit
    Left = 40
    Top = 51
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 1
    Text = '1'
  end
  object Memo1: TMemo
    Left = 208
    Top = 21
    Width = 417
    Height = 324
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Minimo: TEdit
    Left = 40
    Top = 128
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 3
    Text = '1'
  end
  object Maximo: TEdit
    Left = 40
    Top = 200
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 4
    Text = '1'
  end
end
