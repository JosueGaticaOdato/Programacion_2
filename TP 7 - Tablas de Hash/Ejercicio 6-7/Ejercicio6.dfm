object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 262
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 99
    Height = 15
    Caption = 'Cantidad de claves'
  end
  object Label2: TLabel
    Left = 8
    Top = 59
    Width = 45
    Height = 15
    Caption = 'Rango A'
  end
  object Label3: TLabel
    Left = 8
    Top = 109
    Width = 44
    Height = 15
    Caption = 'Rango B'
  end
  object Button1: TButton
    Left = 8
    Top = 168
    Width = 121
    Height = 25
    Caption = 'Crear'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 29
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '1000'
  end
  object Edit2: TEdit
    Left = 8
    Top = 80
    Width = 121
    Height = 23
    TabOrder = 2
    Text = '1'
  end
  object Edit3: TEdit
    Left = 8
    Top = 130
    Width = 121
    Height = 23
    TabOrder = 3
    Text = '1000'
  end
  object Memo1: TMemo
    Left = 144
    Top = 8
    Width = 323
    Height = 247
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object Button2: TButton
    Left = 8
    Top = 199
    Width = 121
    Height = 25
    Caption = 'Buscar'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 230
    Width = 121
    Height = 25
    Caption = 'Limpiar'
    TabOrder = 6
    OnClick = Button3Click
  end
end
