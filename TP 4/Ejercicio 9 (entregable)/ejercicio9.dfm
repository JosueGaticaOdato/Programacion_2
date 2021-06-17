object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 432
  ClientWidth = 540
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
    Left = 8
    Top = 27
    Width = 38
    Height = 13
    Caption = 'Patente'
  end
  object Label2: TLabel
    Left = 8
    Top = 101
    Width = 88
    Height = 13
    Caption = 'Estado de la multa'
  end
  object Label3: TLabel
    Left = 8
    Top = 155
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object Label4: TLabel
    Left = 8
    Top = 216
    Width = 38
    Height = 13
    Caption = 'Importe'
  end
  object Label5: TLabel
    Left = 216
    Top = 287
    Width = 100
    Height = 13
    Caption = 'Consulte por su auto'
  end
  object Memo1: TMemo
    Left = 176
    Top = 8
    Width = 225
    Height = 273
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object EditPatente: TEdit
    Left = 8
    Top = 51
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object opcionesEstados: TComboBox
    Left = 0
    Top = 120
    Width = 145
    Height = 21
    TabOrder = 2
    Items.Strings = (
      'Pendiente'
      'Abonada'
      'Anulada')
  end
  object fechaPicker: TDateTimePicker
    Left = 8
    Top = 182
    Width = 145
    Height = 21
    Date = 44364.000000000000000000
    Time = 0.901170567129156600
    TabOrder = 3
  end
  object EditImporte: TEdit
    Left = 8
    Top = 255
    Width = 145
    Height = 21
    TabOrder = 4
  end
  object btnTotal: TButton
    Left = 89
    Top = 344
    Width = 104
    Height = 25
    Caption = 'Total adeudado'
    TabOrder = 5
    OnClick = btnTotalClick
  end
  object btnMayorCant: TButton
    Left = 422
    Top = 37
    Width = 105
    Height = 49
    Caption = 'Vehiculo con mayor cantidad de infracciones'
    TabOrder = 6
    WordWrap = True
    OnClick = btnMayorCantClick
  end
  object btnMayorDeuda: TButton
    Left = 422
    Top = 180
    Width = 105
    Height = 49
    Caption = 'Vehiculo con la mayor deuda'
    TabOrder = 7
    WordWrap = True
    OnClick = btnMayorDeudaClick
  end
  object btnSinDeuda: TButton
    Left = 422
    Top = 106
    Width = 105
    Height = 49
    Caption = 'Vehiculo sin deudas'
    TabOrder = 8
    WordWrap = True
    OnClick = btnSinDeudaClick
  end
  object editConsulta: TEdit
    Left = 216
    Top = 306
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object btnGuardar: TButton
    Left = 25
    Top = 282
    Width = 90
    Height = 25
    Caption = 'Ingresar multa'
    TabOrder = 10
    OnClick = btnGuardarClick
  end
  object btnMultaReciente: TButton
    Left = 335
    Top = 344
    Width = 99
    Height = 25
    Caption = 'Multa m'#225's reciente'
    TabOrder = 11
    OnClick = btnMultaRecienteClick
  end
  object btnMultaAntigua: TButton
    Left = 216
    Top = 344
    Width = 99
    Height = 25
    Caption = 'Multa m'#225's Antig'#252'a'
    TabOrder = 12
    OnClick = btnMultaAntiguaClick
  end
end
