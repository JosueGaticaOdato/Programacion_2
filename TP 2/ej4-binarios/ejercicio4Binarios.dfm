object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 344
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 27
    Top = 32
    Width = 126
    Height = 13
    Caption = 'Ingrese un n'#250'mero binario'
  end
  object Label2: TLabel
    Left = 27
    Top = 106
    Width = 134
    Height = 13
    Caption = 'Ingrese otro n'#250'mero binario'
  end
  object Memo1: TMemo
    Left = 208
    Top = 29
    Width = 297
    Height = 177
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object binario1: TEdit
    Left = 32
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object binario2: TEdit
    Left = 32
    Top = 125
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnSuma: TButton
    Left = 32
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Suma binaria'
    TabOrder = 3
    OnClick = btnSumaClick
  end
end