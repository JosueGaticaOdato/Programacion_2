object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 376
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Tarjeta: TEdit
    Left = 8
    Top = 8
    Width = 185
    Height = 23
    TabOrder = 0
    Text = '1386'
  end
  object Button1: TButton
    Left = 8
    Top = 37
    Width = 398
    Height = 25
    Caption = 'Cargar y validad'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Fecha: TDateTimePicker
    Left = 220
    Top = 8
    Width = 186
    Height = 23
    Date = 44948.000000000000000000
    Time = 0.213576666668814100
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 8
    Top = 128
    Width = 398
    Height = 241
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object Button2: TButton
    Left = 8
    Top = 68
    Width = 400
    Height = 25
    Caption = 'Obtener entidad emisora'
    TabOrder = 4
    OnClick = Button2Click
  end
end
