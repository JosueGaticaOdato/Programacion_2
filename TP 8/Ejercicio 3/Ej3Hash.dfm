object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Button1
  Caption = 'Form1'
  ClientHeight = 449
  ClientWidth = 757
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
    Left = 32
    Top = 111
    Width = 145
    Height = 13
    Caption = 'Ingrese el c'#243'digo del producto'
  end
  object Label2: TLabel
    Left = 34
    Top = 157
    Width = 143
    Height = 13
    Caption = 'Ingrese el precio del producto'
  end
  object Label3: TLabel
    Left = 32
    Top = 203
    Width = 146
    Height = 13
    Caption = 'Ingrese el detalle del producto'
  end
  object Label4: TLabel
    Left = 32
    Top = 248
    Width = 139
    Height = 13
    Caption = 'Ingrese el stock del producto'
  end
  object Label5: TLabel
    Left = 36
    Top = 357
    Width = 238
    Height = 13
    Caption = 'Ingrese el c'#243'digo del producto que quiere eliminar'
  end
  object Button1: TButton
    Left = 32
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object btnCargar: TButton
    Left = 32
    Top = 80
    Width = 123
    Height = 25
    Caption = 'Cargar producto'
    TabOrder = 1
    OnClick = btnCargarClick
  end
  object btnMostrar: TButton
    Left = 32
    Top = 308
    Width = 121
    Height = 25
    Caption = 'Mostrar archivo'
    TabOrder = 2
    OnClick = btnMostrarClick
  end
  object btnEliminar: TButton
    Left = 36
    Top = 416
    Width = 123
    Height = 25
    Caption = 'Eliminar producto'
    TabOrder = 3
    OnClick = btnEliminarClick
  end
  object Memo1: TMemo
    Left = 248
    Top = 34
    Width = 393
    Height = 281
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object editCodigo: TEdit
    Left = 32
    Top = 130
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object editPrecio: TEdit
    Left = 32
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object editDetalle: TEdit
    Left = 32
    Top = 222
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object editStock: TEdit
    Left = 34
    Top = 265
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object editEliminar: TEdit
    Left = 36
    Top = 376
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object Button2: TButton
    Left = 345
    Top = 337
    Width = 97
    Height = 56
    Caption = 'Porcentaje de ocupacion de la tabla'
    TabOrder = 10
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 465
    Top = 338
    Width = 97
    Height = 54
    Caption = 'Claves en la ZO vs Claves cargadas'
    TabOrder = 11
    WordWrap = True
    OnClick = Button3Click
  end
end
