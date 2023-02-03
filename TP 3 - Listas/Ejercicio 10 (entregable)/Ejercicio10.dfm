object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 255
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Edit1: TEdit
    Left = 8
    Top = 16
    Width = 121
    Height = 23
    TabOrder = 0
    Text = '142,35'
  end
  object Memo1: TMemo
    Left = 8
    Top = 138
    Width = 257
    Height = 109
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button1: TButton
    Left = 144
    Top = 14
    Width = 121
    Height = 25
    Caption = 'Cargar numero'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 45
    Width = 257
    Height = 25
    Caption = 'Mostrar numeros'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 76
    Width = 122
    Height = 25
    Caption = 'Suma'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 144
    Top = 76
    Width = 121
    Height = 25
    Caption = 'Resta'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 107
    Width = 121
    Height = 25
    Caption = 'Multiplicacion'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 144
    Top = 107
    Width = 121
    Height = 25
    Caption = 'Division'
    TabOrder = 7
    OnClick = Button6Click
  end
end
