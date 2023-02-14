object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 277
  ClientWidth = 635
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
    Left = 24
    Top = 10
    Width = 49
    Height = 13
    Caption = 'Candidato'
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 83
    Height = 13
    Caption = ' Numero de mesa'
  end
  object Label3: TLabel
    Left = 24
    Top = 102
    Width = 34
    Height = 13
    Caption = 'Distrito'
  end
  object Label4: TLabel
    Left = 24
    Top = 148
    Width = 43
    Height = 13
    Caption = 'Provincia'
  end
  object Label5: TLabel
    Left = 24
    Top = 197
    Width = 90
    Height = 13
    Caption = 'Votos en esa mesa'
  end
  object Label6: TLabel
    Left = 360
    Top = 221
    Width = 29
    Height = 13
    Caption = 'Mesa:'
  end
  object Button1: TButton
    Left = 48
    Top = 243
    Width = 75
    Height = 25
    Caption = 'Cargar voto'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Candidato: TEdit
    Left = 24
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Candidato'
  end
  object Mesa: TEdit
    Left = 24
    Top = 75
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Mesa'
  end
  object Distrito: TEdit
    Left = 24
    Top = 121
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Distrito'
  end
  object Provincia: TEdit
    Left = 24
    Top = 167
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Provincia'
  end
  object Votos: TEdit
    Left = 24
    Top = 216
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Votos'
  end
  object Memo1: TMemo
    Left = 168
    Top = 8
    Width = 449
    Height = 209
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 6
  end
  object Button2: TButton
    Left = 232
    Top = 232
    Width = 89
    Height = 37
    Caption = 'Lista de votos por candidato'
    TabOrder = 7
    WordWrap = True
  end
  object Edit1: TEdit
    Left = 360
    Top = 240
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'Edit1'
  end
  object Button3: TButton
    Left = 520
    Top = 232
    Width = 89
    Height = 37
    Caption = 'Emision de votos'
    TabOrder = 9
  end
end
