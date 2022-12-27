object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 484
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 681
    Height = 409
    ColCount = 10
    RowCount = 1200
    TabOrder = 0
  end
  object Button1: TButton
    Left = 264
    Top = 427
    Width = 137
    Height = 49
    Caption = 'Cargar datos'
    TabOrder = 1
    OnClick = Button1Click
  end
end
