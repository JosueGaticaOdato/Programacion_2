object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 273
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 72
    Top = 119
    Width = 142
    Height = 13
    Caption = 'Cantidad contagiados del dia:'
  end
  object Label3: TLabel
    Left = 72
    Top = 57
    Width = 89
    Height = 13
    Caption = 'Cargar dia (1 a n):'
  end
  object CN: TEdit
    Left = 72
    Top = 138
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'CN'
  end
  object Memo1: TMemo
    Left = 256
    Top = 8
    Width = 281
    Height = 257
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Dia: TEdit
    Left = 72
    Top = 76
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Cargar: TButton
    Left = 72
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Cargar'
    TabOrder = 3
    OnClick = CargarClick
  end
  object Button1: TButton
    Left = 24
    Top = 224
    Width = 209
    Height = 25
    Caption = 'Mostrar cantidad de casos'
    TabOrder = 4
    OnClick = Button1Click
  end
end
