object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 349
  ClientWidth = 194
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 177
    Height = 25
    Caption = 'Cargar pila aleatoria'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button4: TButton
    Left = 8
    Top = 39
    Width = 177
    Height = 25
    Caption = 'Mostrar pila'
    TabOrder = 1
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 8
    Top = 97
    Width = 177
    Height = 25
    Caption = 'Eliminar ocurrencias'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 159
    Width = 177
    Height = 182
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 8
    Top = 70
    Width = 177
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object Button3: TButton
    Left = 8
    Top = 128
    Width = 177
    Height = 25
    Caption = 'Eliminar ocurrencias recursiva'
    TabOrder = 5
    OnClick = Button3Click
  end
end
