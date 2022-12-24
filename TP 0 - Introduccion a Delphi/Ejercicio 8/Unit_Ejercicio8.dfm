object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 445
  ClientWidth = 930
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
    Width = 913
    Height = 385
    ColCount = 14
    TabOrder = 0
  end
  object Button1: TButton
    Left = 376
    Top = 399
    Width = 169
    Height = 44
    Caption = 'Cargar datos del TXT'
    TabOrder = 1
    OnClick = Button1Click
  end
end
