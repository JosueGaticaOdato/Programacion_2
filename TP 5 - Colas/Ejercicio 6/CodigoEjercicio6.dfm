object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 6'
  ClientHeight = 205
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtnCarga: TButton
    Left = 8
    Top = 8
    Width = 83
    Height = 41
    Caption = 'Cargar colas aleatorias'
    TabOrder = 0
    WordWrap = True
    OnClick = BtnCargaClick
  end
  object BtnIguales: TButton
    Left = 275
    Top = 8
    Width = 83
    Height = 41
    Caption = #191'Son iguales?'
    TabOrder = 1
    OnClick = BtnIgualesClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 55
    Width = 350
    Height = 142
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object BtnMostrar: TButton
    Left = 186
    Top = 8
    Width = 83
    Height = 41
    Caption = 'Mostrar colas'
    TabOrder = 3
    OnClick = BtnMostrarClick
  end
  object BtnCargaEjmplo: TButton
    Left = 97
    Top = 8
    Width = 83
    Height = 41
    Caption = 'Cargar ejemplo'
    TabOrder = 4
    OnClick = BtnCargaEjmploClick
  end
end
