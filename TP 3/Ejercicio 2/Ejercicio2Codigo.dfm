object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 189
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 364
    Height = 24
    Align = alTop
    Alignment = taCenter
    Caption = 'Maximo Comun Divisor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = -42
    ExplicitWidth = 411
  end
  object Label3: TLabel
    Left = 263
    Top = 39
    Width = 46
    Height = 13
    Caption = 'Numero 2'
  end
  object Label4: TLabel
    Left = 47
    Top = 39
    Width = 46
    Height = 13
    Caption = 'Numero 1'
  end
  object Numero1: TEdit
    Left = 8
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1'
  end
  object btnMCD: TButton
    Left = 78
    Top = 104
    Width = 75
    Height = 25
    Caption = 'MCD'
    TabOrder = 1
    OnClick = btnMCDClick
  end
  object Numero2: TEdit
    Left = 224
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '1'
  end
  object MCDEdit: TEdit
    Left = 78
    Top = 160
    Width = 189
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 192
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Producto'
    TabOrder = 4
    OnClick = Button1Click
  end
end
