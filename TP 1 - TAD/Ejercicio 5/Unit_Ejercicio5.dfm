object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 424
  ClientWidth = 188
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DatePicker1: TDatePicker
    Left = 19
    Top = 16
    Height = 41
    Date = 38332.000000000000000000
    DateFormat = 'd/m/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 19
    Top = 120
    Width = 150
    Height = 23
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 19
    Top = 191
    Width = 150
    Height = 25
    Caption = 'Restar dias'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 19
    Top = 160
    Width = 150
    Height = 25
    Caption = 'Sumar dias'
    TabOrder = 3
    OnClick = Button2Click
  end
  object DatePicker2: TDatePicker
    Left = 19
    Top = 248
    Height = 41
    Date = 44906.000000000000000000
    DateFormat = 'd/m/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
  end
  object Button3: TButton
    Left = 19
    Top = 312
    Width = 150
    Height = 25
    Caption = 'Diferencia de dias'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 19
    Top = 343
    Width = 150
    Height = 25
    Caption = 'Comparar fechas'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 19
    Top = 79
    Width = 150
    Height = 25
    Caption = #191'Bisiesto?'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Edit2: TEdit
    Left = 19
    Top = 385
    Width = 150
    Height = 23
    TabOrder = 8
    Text = 'Resultados'
  end
end
