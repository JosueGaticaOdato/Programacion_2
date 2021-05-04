object Ejercicio9: TEjercicio9
  Left = 0
  Top = 0
  Caption = 'Ejercicio 9'
  ClientHeight = 298
  ClientWidth = 593
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
    Width = 593
    Height = 24
    Align = alTop
    Alignment = taCenter
    Caption = 'Caja Registradora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 8
  end
  object Label2: TLabel
    Left = 48
    Top = 38
    Width = 40
    Height = 16
    Caption = 'Billetes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 488
    Top = 38
    Width = 51
    Height = 16
    Caption = 'Monedas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 27
    Top = 234
    Width = 111
    Height = 16
    Caption = 'Calcular vuelto de: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 144
    Top = 38
    Width = 297
    Height = 171
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object BtnBilletes: TButton
    Left = 32
    Top = 160
    Width = 81
    Height = 25
    Caption = 'Cargar Billete'
    TabOrder = 1
    OnClick = BtnBilletesClick
  end
  object BtnMoneda: TButton
    Left = 472
    Top = 160
    Width = 89
    Height = 25
    Caption = 'Cargar Moneda'
    TabOrder = 2
    OnClick = BtnMonedaClick
  end
  object Carga_Moneda: TEdit
    Left = 458
    Top = 77
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 3
    Text = 'Carga_Moneda'
  end
  object Carga_Billlete: TEdit
    Left = 8
    Top = 77
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 4
    Text = 'Carga_Billlete'
  end
  object CantidadB: TEdit
    Left = 8
    Top = 114
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 5
    Text = 'CantidadB'
  end
  object btnSaldo: TButton
    Left = 392
    Top = 245
    Width = 121
    Height = 26
    Caption = 'Estado y Saldo'
    TabOrder = 6
    OnClick = btnSaldoClick
  end
  object CantidadM: TEdit
    Left = 458
    Top = 115
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 7
    Text = 'CantidadB'
  end
  object Edit1: TEdit
    Left = 144
    Top = 231
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'Edit1'
  end
  object btnVuelto: TButton
    Left = 96
    Top = 258
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 9
  end
end
