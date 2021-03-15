object CadastroNegociacao: TCadastroNegociacao
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtores'
  ClientHeight = 652
  ClientWidth = 978
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 617
    Width = 978
    Height = 35
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 781
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 978
    Height = 313
    Align = alTop
    BevelKind = bkFlat
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
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
      Top = 70
      Width = 40
      Height = 19
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 286
      Width = 32
      Height = 19
      Caption = 'Itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 118
      Width = 76
      Height = 19
      Caption = 'Distribuidor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 166
      Width = 55
      Height = 19
      Caption = 'Produtor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 214
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
    object DBEdit1: TDBEdit
      Left = 24
      Top = 43
      Width = 121
      Height = 19
      DataField = 'ID'
      DataSource = DataModulePrincipal.DataSourceNegociacao
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 91
      Width = 121
      Height = 19
      DataField = 'STATUS'
      DataSource = DataModulePrincipal.DataSourceNegociacao
      Enabled = False
      TabOrder = 1
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 24
      Top = 139
      Width = 425
      Height = 19
      DataField = 'ID_DISTRIBUIDOR'
      DataSource = DataModulePrincipal.DataSourceNegociacao
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = DataModulePrincipal.DataSourceListaDistribuidor
      TabOrder = 2
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 24
      Top = 187
      Width = 425
      Height = 19
      DataField = 'ID_PRODUTOR'
      DataSource = DataModulePrincipal.DataSourceNegociacao
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = DataModulePrincipal.DataSourceListaProdutor
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 235
      Width = 121
      Height = 19
      DataField = 'VALOR'
      DataSource = DataModulePrincipal.DataSourceNegociacao
      Enabled = False
      TabOrder = 4
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 313
    Width = 978
    Height = 304
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 974
      Height = 300
      Align = alClient
      DataSource = DataModulePrincipal.DataSourceListaNegociacaoItem
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnKeyDown = DBGrid1KeyDown
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'SEQUENCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEPRODUTO'
          Width = 523
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_UNITARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Visible = True
        end>
    end
  end
end
