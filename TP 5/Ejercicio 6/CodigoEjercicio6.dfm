object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 380
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
  object Label1: TLabel
    Left = 80
    Top = 77
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label2: TLabel
    Left = 73
    Top = 122
    Width = 38
    Height = 13
    Caption = 'Posicion'
  end
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
  object Memo1: TMemo
    Left = 191
    Top = 8
    Width = 181
    Height = 187
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 8
    Top = 96
    Width = 177
    Height = 21
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 8
    Top = 142
    Width = 177
    Height = 21
    TabOrder = 4
  end
  object Button2: TButton
    Left = 8
    Top = 169
    Width = 177
    Height = 25
    Caption = 'Insertar'
    TabOrder = 5
    OnClick = Button2Click
  end
end
