object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 311
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 58
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Cargar Cola aleatoria'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 8
    Top = 55
    Width = 96
    Height = 41
    Caption = 'Mostrar cola'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 102
    Width = 198
    Height = 195
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object c: TButton
    Left = 110
    Top = 55
    Width = 96
    Height = 41
    Caption = 'Eliminar repeticiones'
    TabOrder = 3
    WordWrap = True
    OnClick = cClick
  end
end
