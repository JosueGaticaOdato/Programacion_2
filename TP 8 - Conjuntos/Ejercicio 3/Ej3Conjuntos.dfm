object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 161
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Memo1: TMemo
    Left = 216
    Top = 16
    Width = 441
    Height = 121
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object btnCargar: TButton
    Left = 8
    Top = 16
    Width = 193
    Height = 25
    Caption = 'Cargar conjuntos'
    TabOrder = 1
    OnClick = btnCargarClick
  end
  object btnMostrar: TButton
    Left = 8
    Top = 63
    Width = 193
    Height = 25
    Caption = 'Mostrar conjuntos'
    TabOrder = 2
    OnClick = btnMostrarClick
  end
  object btnVocalesConsonantes: TButton
    Left = 8
    Top = 112
    Width = 193
    Height = 25
    Caption = 'Separar vocales de consonantes'
    TabOrder = 3
    OnClick = btnVocalesConsonantesClick
  end
end
