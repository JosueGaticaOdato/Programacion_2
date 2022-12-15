object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 491
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object ComboBox1: TComboBox
    Left = 16
    Top = 21
    Width = 121
    Height = 23
    ItemIndex = 0
    TabOrder = 0
    Text = 'Chocolate'
    Items.Strings = (
      'Chocolate'
      'CremaAmericana'
      'Frutilla'
      'Lim'#243'n')
  end
  object Button1: TButton
    Left = 16
    Top = 64
    Width = 265
    Height = 25
    Caption = 'Aumentar cantidad'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 160
    Top = 21
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'Edit1'
  end
  object Button2: TButton
    Left = 16
    Top = 152
    Width = 265
    Height = 25
    Caption = 'Consultar si alcanza helado'
    TabOrder = 3
  end
  object Button3: TButton
    Left = 16
    Top = 192
    Width = 265
    Height = 25
    Caption = 'Combinaciones posibles'
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 248
    Width = 97
    Height = 17
    Caption = 'Chocolate'
    TabOrder = 5
  end
  object CheckBox2: TCheckBox
    Left = 176
    Top = 248
    Width = 97
    Height = 17
    Caption = 'CremaAmericana'
    TabOrder = 6
  end
  object CheckBox3: TCheckBox
    Left = 16
    Top = 280
    Width = 97
    Height = 17
    Caption = 'Frutilla'
    TabOrder = 7
  end
  object CheckBox4: TCheckBox
    Left = 176
    Top = 280
    Width = 97
    Height = 17
    Caption = 'Lim'#243'n'
    TabOrder = 8
  end
  object Button4: TButton
    Left = 16
    Top = 312
    Width = 265
    Height = 25
    Caption = 'Crear helado'
    TabOrder = 9
  end
  object Button5: TButton
    Left = 16
    Top = 104
    Width = 265
    Height = 25
    Caption = 'Mostrar cantidades disponibles'
    TabOrder = 10
  end
  object Memo1: TMemo
    Left = 16
    Top = 351
    Width = 265
    Height = 122
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 11
  end
end
