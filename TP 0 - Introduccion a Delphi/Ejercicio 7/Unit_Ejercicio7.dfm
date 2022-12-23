object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 377
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Codigo: TEdit
    Left = 18
    Top = 48
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'Codigo'
  end
  object Button1: TButton
    Left = 18
    Top = 272
    Width = 121
    Height = 25
    Caption = 'Ingresar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 168
    Top = 39
    Width = 460
    Height = 320
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Razon: TEdit
    Left = 18
    Top = 88
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'Razon Social'
  end
  object Domicilio: TEdit
    Left = 18
    Top = 128
    Width = 121
    Height = 23
    TabOrder = 4
    Text = 'Domicilio'
  end
  object Localidad: TEdit
    Left = 18
    Top = 168
    Width = 121
    Height = 23
    TabOrder = 5
    Text = 'Localidad'
  end
  object TE: TEdit
    Left = 18
    Top = 208
    Width = 121
    Height = 23
    TabOrder = 6
    Text = 'TE'
  end
  object Mail: TEdit
    Left = 18
    Top = 243
    Width = 121
    Height = 23
    TabOrder = 7
    Text = 'Mail'
  end
  object Filtra: TEdit
    Left = 168
    Top = 8
    Width = 225
    Height = 23
    TabOrder = 8
    Text = 'FIltrar'
  end
  object Button2: TButton
    Left = 416
    Top = 8
    Width = 212
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 9
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 18
    Top = 303
    Width = 121
    Height = 25
    Caption = 'Borrar (Por codigo)'
    TabOrder = 10
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 18
    Top = 334
    Width = 121
    Height = 25
    Caption = 'Modificar'
    TabOrder = 11
    OnClick = Button5Click
  end
  object Button3: TButton
    Left = 18
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Mostrar todo'
    TabOrder = 12
    OnClick = Button3Click
  end
end
