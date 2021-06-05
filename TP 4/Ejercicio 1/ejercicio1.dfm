object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 589
  ClientWidth = 836
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
  object Memo1: TMemo
    Left = 208
    Top = 24
    Width = 577
    Height = 545
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnMostrar: TButton
    Left = 24
    Top = 104
    Width = 145
    Height = 41
    Caption = 'Mostrar lista al revez'
    TabOrder = 1
    OnClick = btnMostrarClick
  end
  object btnMayor: TButton
    Left = 24
    Top = 168
    Width = 145
    Height = 41
    Caption = 'Mayor de los datos'
    TabOrder = 2
    OnClick = btnMayorClick
  end
  object Button1: TButton
    Left = 24
    Top = 40
    Width = 145
    Height = 41
    Caption = 'Cargar Lista Aleatoria'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 232
    Width = 145
    Height = 41
    Caption = 'Minimo y Repeticion'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 296
    Width = 145
    Height = 41
    Caption = 'Promedio'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 448
    Width = 145
    Height = 41
    Caption = 'Generar numeros Unicos'
    TabOrder = 6
  end
end
