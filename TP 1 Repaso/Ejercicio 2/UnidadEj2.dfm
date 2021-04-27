object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 2'
  ClientHeight = 290
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 555
    Height = 24
    Align = alTop
    Alignment = taCenter
    Caption = 'Ejercicio 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 91
  end
  object Label2: TLabel
    Left = 64
    Top = 30
    Width = 72
    Height = 13
    Align = alCustom
    Alignment = taCenter
    Caption = 'Escribir cadena'
  end
  object Memo1: TMemo
    Left = 216
    Top = 30
    Width = 331
    Height = 252
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 8
    Top = 55
    Width = 202
    Height = 21
    Alignment = taCenter
    TabOrder = 1
    Text = 'Hola Mundo Cruel y Despiadado'
  end
  object Button1: TButton
    Left = 51
    Top = 90
    Width = 113
    Height = 25
    Caption = 'Solo Mayusculas'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 51
    Top = 121
    Width = 113
    Height = 25
    Caption = 'Solo Minusculas'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 51
    Top = 152
    Width = 113
    Height = 25
    Caption = 'Sin Espacios'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 51
    Top = 183
    Width = 113
    Height = 25
    Caption = 'Invertida sin espacios'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 51
    Top = 214
    Width = 113
    Height = 25
    Caption = 'Cantidad caractreres'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 51
    Top = 245
    Width = 113
    Height = 25
    Caption = 'Ocurrencias'
    TabOrder = 7
    OnClick = Button6Click
  end
end
