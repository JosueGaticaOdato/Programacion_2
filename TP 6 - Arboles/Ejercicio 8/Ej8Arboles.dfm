object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 370
  ClientWidth = 744
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
    Left = 46
    Top = 103
    Width = 75
    Height = 13
    Caption = 'Ingrese el CUIT'
  end
  object Label2: TLabel
    Left = 46
    Top = 146
    Width = 107
    Height = 13
    Caption = 'Ingrese la raz'#243'n social'
  end
  object Label3: TLabel
    Left = 46
    Top = 197
    Width = 90
    Height = 13
    Caption = 'Ingrese el domicilio'
  end
  object Label4: TLabel
    Left = 49
    Top = 296
    Width = 82
    Height = 13
    Caption = 'Ingrese el celular'
  end
  object Label5: TLabel
    Left = 49
    Top = 250
    Width = 91
    Height = 13
    Caption = 'Ingrese el tel'#233'fono'
  end
  object btnMostrar: TButton
    Left = 40
    Top = 32
    Width = 105
    Height = 25
    Caption = 'Mostrar archivo'
    TabOrder = 0
    OnClick = btnMostrarClick
  end
  object Memo1: TMemo
    Left = 312
    Top = 34
    Width = 377
    Height = 295
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object btnCargar: TButton
    Left = 40
    Top = 72
    Width = 105
    Height = 25
    Caption = 'Cargar'
    TabOrder = 2
    OnClick = btnCargarClick
  end
  object editCuit: TEdit
    Left = 46
    Top = 122
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object editRazon: TEdit
    Left = 46
    Top = 165
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object editDomicilio: TEdit
    Left = 46
    Top = 223
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object editTelefono: TEdit
    Left = 49
    Top = 269
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object editCelular: TEdit
    Left = 49
    Top = 315
    Width = 121
    Height = 21
    TabOrder = 7
  end
end
