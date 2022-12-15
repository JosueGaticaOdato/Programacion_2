object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 405
  ClientWidth = 656
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
  object btnMostrarYCargar: TButton
    Left = 8
    Top = 16
    Width = 170
    Height = 25
    Caption = 'Mostrar colas'
    TabOrder = 0
    OnClick = btnMostrarYCargarClick
  end
  object Memo1: TMemo
    Left = 208
    Top = 14
    Width = 393
    Height = 383
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object btnMostrarOrden: TButton
    Left = 8
    Top = 56
    Width = 170
    Height = 25
    Caption = 'Orden en que fueron atendidos'
    TabOrder = 2
    OnClick = btnMostrarOrdenClick
  end
end
