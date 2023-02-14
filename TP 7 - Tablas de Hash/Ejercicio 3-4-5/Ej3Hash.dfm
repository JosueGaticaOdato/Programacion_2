object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 321
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 145
    Height = 13
    Caption = 'Ingrese el c'#243'digo del producto'
  end
  object Label2: TLabel
    Left = 10
    Top = 54
    Width = 143
    Height = 13
    Caption = 'Ingrese el precio del producto'
  end
  object Label3: TLabel
    Left = 8
    Top = 100
    Width = 146
    Height = 13
    Caption = 'Ingrese el detalle del producto'
  end
  object Label4: TLabel
    Left = 8
    Top = 145
    Width = 139
    Height = 13
    Caption = 'Ingrese el stock del producto'
  end
  object Label5: TLabel
    Left = 16
    Top = 288
    Width = 238
    Height = 13
    Caption = 'Ingrese el c'#243'digo del producto que quiere eliminar'
  end
  object btnCargar: TButton
    Left = 8
    Top = 196
    Width = 123
    Height = 25
    Caption = 'Cargar producto'
    TabOrder = 0
    OnClick = btnCargarClick
  end
  object btnMostrar: TButton
    Left = 8
    Top = 244
    Width = 121
    Height = 25
    Caption = 'Mostrar archivo'
    TabOrder = 1
  end
  object btnEliminar: TButton
    Left = 414
    Top = 283
    Width = 123
    Height = 25
    Caption = 'Eliminar producto'
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 176
    Top = 8
    Width = 393
    Height = 213
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object editCodigo: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object editPrecio: TEdit
    Left = 8
    Top = 73
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object editDetalle: TEdit
    Left = 8
    Top = 119
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object editStock: TEdit
    Left = 10
    Top = 162
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object editEliminar: TEdit
    Left = 276
    Top = 285
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object Button2: TButton
    Left = 149
    Top = 244
    Width = 204
    Height = 25
    Caption = 'Porcentaje de ocupacion de la tabla'
    TabOrder = 9
    WordWrap = True
  end
  object Button3: TButton
    Left = 373
    Top = 244
    Width = 196
    Height = 25
    Caption = 'Claves en la ZO vs Claves cargadas'
    TabOrder = 10
    WordWrap = True
  end
end
