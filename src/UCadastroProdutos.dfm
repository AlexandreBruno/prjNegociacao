object CadastroProdutos: TCadastroProdutos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 22
    Width = 45
    Height = 19
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 86
    Width = 38
    Height = 19
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 158
    Width = 33
    Height = 19
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 264
    Width = 635
    Height = 35
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 438
      Top = 0
      Width = 193
      Height = 31
      Align = alRight
      BevelKind = bkFlat
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object ButtonCancelar: TButton
        Left = 110
        Top = 1
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = ButtonCancelarClick
      end
      object ButtonConfirmar: TButton
        Left = 7
        Top = 1
        Width = 75
        Height = 25
        Caption = 'Confirmar'
        TabOrder = 0
        OnClick = ButtonConfirmarClick
      end
    end
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 43
    Width = 121
    Height = 21
    DataField = 'ID'
    DataSource = DataModulePrincipal.DataSourceProduto
    Enabled = False
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 24
    Top = 107
    Width = 425
    Height = 21
    DataField = 'NOME'
    DataSource = DataModulePrincipal.DataSourceProduto
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 24
    Top = 179
    Width = 257
    Height = 21
    DataField = 'VALOR'
    DataSource = DataModulePrincipal.DataSourceProduto
    TabOrder = 3
  end
end
