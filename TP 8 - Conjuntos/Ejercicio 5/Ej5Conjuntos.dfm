object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 205
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 35
    Width = 505
    Height = 162
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 89
    Height = 21
    Caption = 'Cargar aleatorio'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 103
    Top = 8
    Width = 89
    Height = 21
    Caption = 'Cargar ejemplo'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 198
    Top = 8
    Width = 89
    Height = 21
    Caption = 'Mostra conjuntos'
    TabOrder = 3
    WordWrap = True
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 423
    Top = 8
    Width = 91
    Height = 21
    Caption = 'Confirmar'
    TabOrder = 4
    OnClick = Button4Click
  end
  object ComboBox1: TComboBox
    Left = 293
    Top = 8
    Width = 124
    Height = 21
    ItemIndex = 0
    TabOrder = 5
    Text = 'A '#8838'  B'
    Items.Strings = (
      'A '#8838'  B'
      'B '#8838'  A'
      'A '#8838'  C'
      'C '#8838'  A'
      'B '#8838'  C'
      'C '#8838'  B')
  end
end
