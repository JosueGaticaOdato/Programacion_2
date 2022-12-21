object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 4'
  ClientHeight = 264
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 451
    Height = 33
    Align = alTop
    Alignment = taCenter
    Caption = 'Cuadrado Latino'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 194
  end
  object Label2: TLabel
    Left = 8
    Top = 77
    Width = 144
    Height = 13
    Alignment = taCenter
    Caption = 'Determinar Tama'#241'o (Max. 10)'
  end
  object Memo1: TMemo
    Left = 160
    Top = 40
    Width = 283
    Height = 220
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 16
    Top = 104
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 1
    Text = 'Tama'#241'o'
  end
  object Button1: TButton
    Left = 16
    Top = 144
    Width = 121
    Height = 49
    Caption = 'Generar y mostrar'
    TabOrder = 2
    OnClick = Button1Click
  end
end
