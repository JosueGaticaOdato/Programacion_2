object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 329
    Height = 129
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 8
    Top = 143
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'Tama'#241'o'
  end
  object Button1: TButton
    Left = 150
    Top = 143
    Width = 187
    Height = 25
    Caption = 'Generar Matriz Cuadrada'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 205
    Width = 329
    Height = 23
    TabOrder = 3
    Text = 'Diagonal Principal'
  end
  object Button2: TButton
    Left = 8
    Top = 174
    Width = 329
    Height = 25
    Caption = 'Diagonal Principal'
    TabOrder = 4
    OnClick = Button2Click
  end
end
