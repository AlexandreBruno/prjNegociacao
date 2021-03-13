unit uDataModulePrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModulePrincipal = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QueryDistribuidor: TFDQuery;
    QueryProdutor: TFDQuery;
    QueryProduto: TFDQuery;
    QueryNegociacao: TFDQuery;
    DataSourceDistribuidor: TDataSource;
    DataSourceProdutor: TDataSource;
    DataSourceProduto: TDataSource;
    DataSourceNegociacao: TDataSource;
    DataSourceNegociacaoItem: TDataSource;
    QueryNegociacaoItem: TFDQuery;
    QueryProdutorCredito: TFDQuery;
    DataSourceProdutorCredito: TDataSource;
    QueryNegociacaoItemID_NEGOCIACAO: TIntegerField;
    QueryNegociacaoItemSEQUENCIA: TIntegerField;
    QueryNegociacaoItemQUANTIDADE: TIntegerField;
    QueryNegociacaoItemVALOR_UNITARIO: TFMTBCDField;
    QueryNegociacaoItemVALOR_TOTAL: TFMTBCDField;
    QueryNegociacaoItemID_PRODUTO: TIntegerField;
    QueryNegociacaoID: TIntegerField;
    QueryNegociacaoID_PRODUTOR: TIntegerField;
    QueryNegociacaoID_DISTRIBUIDOR: TIntegerField;
    QueryNegociacaoSTATUS: TStringField;
    QueryNegociacaoVALOR: TFMTBCDField;
    QueryProdutorID: TIntegerField;
    QueryProdutorNOME: TStringField;
    QueryDistribuidorID: TIntegerField;
    QueryDistribuidorNOME: TStringField;
    QueryDistribuidorCNPJ: TStringField;
    QueryListaDistribuidor: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    DataSourceListaDistribuidor: TDataSource;
    QueryListaProdutor: TFDQuery;
    IntegerField3: TIntegerField;
    StringField5: TStringField;
    DataSourceListaProdutor: TDataSource;
    QueryListaProdutorCredito: TFDQuery;
    DataSourceListaProdutorCredito: TDataSource;
    QueryProdutorCreditoID: TIntegerField;
    QueryProdutorCreditoID_PRODUTOR: TIntegerField;
    QueryProdutorCreditoID_DISTRIBUIDOR: TIntegerField;
    QueryProdutorCreditoVALOR: TIntegerField;
    QueryListaProdutorCreditoID: TIntegerField;
    QueryListaProdutorCreditoID_PRODUTOR: TIntegerField;
    QueryListaProdutorCreditoID_DISTRIBUIDOR: TIntegerField;
    QueryListaProdutorCreditoVALOR: TIntegerField;
    QueryProdutoID: TIntegerField;
    QueryProdutoNOME: TStringField;
    QueryProdutoVALOR: TFMTBCDField;
    QueryListaProduto: TFDQuery;
    IntegerField2: TIntegerField;
    StringField3: TStringField;
    FMTBCDField1: TFMTBCDField;
    DataSourceListaProduto: TDataSource;
    QueryListaNegociacao: TFDQuery;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField4: TStringField;
    FMTBCDField2: TFMTBCDField;
    DataSource1: TDataSource;
    DataSourceListaNegociacaoItem: TDataSource;
    QueryListaNegociacaoItem: TFDQuery;
    QueryListaNegociacaoItemID_NEGOCIACAO: TIntegerField;
    QueryListaNegociacaoItemSEQUENCIA: TIntegerField;
    QueryListaNegociacaoItemQUANTIDADE: TIntegerField;
    QueryListaNegociacaoItemVALOR_UNITARIO: TFMTBCDField;
    QueryListaNegociacaoItemVALOR_TOTAL: TFMTBCDField;
    QueryListaNegociacaoItemID_PRODUTO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulePrincipal: TDataModulePrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
