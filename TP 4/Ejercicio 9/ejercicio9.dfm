object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 514
  ClientWidth = 713
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
    Left = 32
    Top = 104
    Width = 38
    Height = 13
    Caption = 'Patente'
  end
  object Button1: TButton
    Left = 40
    Top = 56
    Width = 105
    Height = 33
    Caption = 'Cargar Lista'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 216
    Top = 62
    Width = 425
    Height = 409
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 24
    Top = 123
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 160
    Width = 145
    Height = 21
    TabOrder = 3
    Text = 'ComboBox1'
    Items.Strings = (
      'Pendiente'
      'Abonada'
      'Anulada')
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 232
    Width = 186
    Height = 21
    Date = 44354.000000000000000000
    Time = 0.901170567129156600
    TabOrder = 4
  end
  object Button2: TButton
    Left = 0
    Top = 288
    Width = 105
    Height = 25
    Caption = 'Calcular deudas'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 120
    Top = 290
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit2'
  end
end
