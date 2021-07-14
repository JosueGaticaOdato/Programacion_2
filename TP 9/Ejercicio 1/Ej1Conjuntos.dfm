object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 306
  ClientWidth = 715
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
    Left = 24
    Top = 226
    Width = 365
    Height = 18
    Caption = 'Ingrese el elemento para saber si pertenece al conjunto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnMostrar: TButton
    Left = 8
    Top = 26
    Width = 153
    Height = 25
    Caption = 'Mostrar conjuntos'
    TabOrder = 0
    OnClick = btnMostrarClick
  end
  object Memo1: TMemo
    Left = 176
    Top = 24
    Width = 531
    Height = 193
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btnUnion: TButton
    Left = 8
    Top = 72
    Width = 153
    Height = 25
    Caption = 'Uni'#243'n de conjuntos'
    TabOrder = 2
    OnClick = btnUnionClick
  end
  object btnInterseccion: TButton
    Left = 8
    Top = 120
    Width = 153
    Height = 25
    Caption = 'Intersecci'#243'n de conjuntos'
    TabOrder = 3
    OnClick = btnInterseccionClick
  end
  object btnDiferencia: TButton
    Left = 8
    Top = 168
    Width = 153
    Height = 25
    Caption = 'Diferencia de conjuntos'
    TabOrder = 4
    OnClick = btnDiferenciaClick
  end
  object btnPertenencia: TButton
    Left = 8
    Top = 272
    Width = 153
    Height = 25
    Caption = 'Pertenencia'
    TabOrder = 5
    OnClick = btnPertenenciaClick
  end
  object editElemento: TEdit
    Left = 24
    Top = 245
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object checkBoxC1: TCheckBox
    Left = 208
    Top = 276
    Width = 97
    Height = 17
    Caption = 'Conjunto 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object checkBoxC2: TCheckBox
    Left = 311
    Top = 276
    Width = 97
    Height = 17
    Caption = 'Conjunto 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
end
