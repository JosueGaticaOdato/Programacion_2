object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 224
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 69
    Height = 15
    Caption = 'Parmoniosaa'
  end
  object Memo1: TMemo
    Left = 8
    Top = 72
    Width = 409
    Height = 144
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 216
    Top = 8
    Width = 195
    Height = 58
    Caption = 'Generar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 40
    Width = 202
    Height = 26
    TabOrder = 2
    Text = 'Numero'
  end
end
