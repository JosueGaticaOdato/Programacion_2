object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 489
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 157
    Width = 144
    Height = 30
    Alignment = taCenter
    Caption = 'Arma tu helado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 21
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'Chocolate'
    Items.Strings = (
      'Chocolate'
      'CremaAmericana'
      'Frutilla'
      'Limon')
  end
  object Button1: TButton
    Left = 12
    Top = 64
    Width = 270
    Height = 25
    Caption = 'Aumentar cantidad'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 161
    Top = 21
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'Cantidad'
  end
  object Button2: TButton
    Left = 8
    Top = 258
    Width = 274
    Height = 25
    Caption = 'Consultar si alcanza helado'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 16
    Top = 126
    Width = 266
    Height = 25
    Caption = 'Combinaciones posibles'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Chocolate: TCheckBox
    Left = 40
    Top = 203
    Width = 97
    Height = 17
    Caption = 'Chocolate'
    TabOrder = 5
  end
  object CremaAmericana: TCheckBox
    Left = 143
    Top = 203
    Width = 106
    Height = 17
    Caption = 'Crema Americana'
    TabOrder = 6
  end
  object Frutilla: TCheckBox
    Left = 40
    Top = 235
    Width = 97
    Height = 17
    Caption = 'Frutilla'
    TabOrder = 7
  end
  object Limon: TCheckBox
    Left = 143
    Top = 235
    Width = 97
    Height = 17
    Caption = 'Limon'
    TabOrder = 8
  end
  object Button4: TButton
    Left = 8
    Top = 289
    Width = 274
    Height = 25
    Caption = 'Crear helado'
    TabOrder = 9
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 12
    Top = 95
    Width = 270
    Height = 25
    Caption = 'Mostrar cantidades disponibles'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 320
    Width = 273
    Height = 153
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 11
  end
end
