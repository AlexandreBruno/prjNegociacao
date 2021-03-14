object CadastroProdutores: TCadastroProdutores
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtores'
  ClientHeight = 559
  ClientWidth = 818
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 524
    Width = 818
    Height = 35
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 621
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
    Width = 818
    Height = 185
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
    object DBEdit1: TDBEdit
      Left = 24
      Top = 43
      Width = 121
      Height = 19
      DataField = 'ID'
      DataSource = DataModulePrincipal.DataSourceProdutor
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 107
      Width = 425
      Height = 19
      DataField = 'NOME'
      DataSource = DataModulePrincipal.DataSourceProdutor
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 185
    Width = 818
    Height = 339
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 814
      Height = 335
      Align = alClient
      DataSource = DataModulePrincipal.DataSourceListaProdutorCredito
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
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISTRIBUIDORNOME'
          Width = 669
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Visible = True
        end>
    end
  end
end
