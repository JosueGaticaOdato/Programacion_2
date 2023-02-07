object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 195
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 177
    Height = 25
    Caption = 'Cargar pilas aleatorias'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button4: TButton
    Left = 8
    Top = 39
    Width = 177
    Height = 25
    Caption = 'Mostrar pilas'
    TabOrder = 1
    OnClick = Button4Click
  end
  object Button3: TButton
    Left = 8
    Top = 70
    Width = 177
    Height = 25
    Caption = 'Chequear si son iguales'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 101
    Width = 177
    Height = 190
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
end
