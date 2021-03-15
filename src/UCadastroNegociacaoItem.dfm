object CadastroNegociacaoItem: TCadastroNegociacaoItem
  Left = 0
  Top = 0
  Caption = 'Item da Negocia'#231#227'o'
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
    Width = 66
    Height = 19
    Caption = 'Sequ'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 328
    Top = 174
    Width = 69
    Height = 19
    Caption = 'Valor Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 78
    Width = 50
    Height = 19
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 174
    Width = 89
    Height = 19
    Caption = 'Valor Unit'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 160
    Top = 174
    Width = 76
    Height = 19
    Caption = 'Quantidade'
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
    DataField = 'SEQUENCIA'
    DataSource = DataModulePrincipal.DataSourceListaNegociacaoItem
    Enabled = False
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 328
    Top = 195
    Width = 121
    Height = 19
    DataField = 'VALOR_TOTAL'
    DataSource = DataModulePrincipal.DataSourceListaNegociacaoItem
    Enabled = False
    TabOrder = 2
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 24
    Top = 99
    Width = 425
    Height = 21
    DataField = 'ID_PRODUTO'
    DataSource = DataModulePrincipal.DataSourceListaNegociacaoItem
    KeyField = 'ID'
    ListField = 'NOME'
    ListSource = DataModulePrincipal.DataSourceListaProduto
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 24
    Top = 195
    Width = 121
    Height = 21
    DataField = 'VALOR_UNITARIO'
    DataSource = DataModulePrincipal.DataSourceListaNegociacaoItem
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 160
    Top = 195
    Width = 121
    Height = 21
    DataField = 'QUANTIDADE'
    DataSource = DataModulePrincipal.DataSourceListaNegociacaoItem
    TabOrder = 5
  end
end
