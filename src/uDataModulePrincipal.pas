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
    DataSourceListaDistribuidor: TDataSource;
    QueryListaProdutor: TFDQuery;
    DataSourceListaProdutor: TDataSource;
    QueryListaProdutorCredito: TFDQuery;
    DataSourceListaProdutorCredito: TDataSource;
    QueryProdutorCreditoID: TIntegerField;
    QueryProdutorCreditoID_PRODUTOR: TIntegerField;
    QueryProdutorCreditoID_DISTRIBUIDOR: TIntegerField;
    QueryListaProdutorCreditoID: TIntegerField;
    QueryListaProdutorCreditoID_PRODUTOR: TIntegerField;
    QueryListaProdutorCreditoID_DISTRIBUIDOR: TIntegerField;
    QueryProdutoID: TIntegerField;
    QueryProdutoNOME: TStringField;
    QueryProdutoVALOR: TFMTBCDField;
    QueryListaProduto: TFDQuery;
    DataSourceListaProduto: TDataSource;
    QueryListaNegociacao: TFDQuery;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField4: TStringField;
    FMTBCDField2: TFMTBCDField;
    DataSourceListaNegociacao: TDataSource;
    DataSourceListaNegociacaoItem: TDataSource;
    QueryListaNegociacaoItem: TFDQuery;
    QueryListaNegociacaoItemID_NEGOCIACAO: TIntegerField;
    QueryListaNegociacaoItemSEQUENCIA: TIntegerField;
    QueryListaNegociacaoItemQUANTIDADE: TIntegerField;
    QueryListaNegociacaoItemVALOR_UNITARIO: TFMTBCDField;
    QueryListaNegociacaoItemVALOR_TOTAL: TFMTBCDField;
    QueryListaNegociacaoItemID_PRODUTO: TIntegerField;
    QueryListaDistribuidorID: TIntegerField;
    QueryListaDistribuidorNOME: TStringField;
    QueryListaDistribuidorCNPJ: TStringField;
    QueryCodigo: TFDQuery;
    QueryCodigoCODIGO: TIntegerField;
    QueryListaProdutoID: TIntegerField;
    QueryListaProdutoNOME: TStringField;
    QueryListaProdutoVALOR: TFMTBCDField;
    QueryListaProdutorID: TIntegerField;
    QueryListaProdutorNOME: TStringField;
    QueryListaProdutorCreditoDISTRIBUIDORNOME: TStringField;
    QueryDistribuidorCalc: TFDQuery;
    QueryDistribuidorCalcID: TIntegerField;
    QueryDistribuidorCalcNOME: TStringField;
    QueryDistribuidorCalcCNPJ: TStringField;
    QueryProdutorCreditoVALOR: TFMTBCDField;
    QueryListaProdutorCreditoVALOR: TFMTBCDField;
    procedure QueryDistribuidorAfterInsert(DataSet: TDataSet);
    procedure QueryProdutoAfterInsert(DataSet: TDataSet);
    procedure QueryListaProdutorCreditoCalcFields(DataSet: TDataSet);
    procedure QueryProdutorBeforePost(DataSet: TDataSet);
    procedure QueryProdutorBeforeDelete(DataSet: TDataSet);
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

procedure TDataModulePrincipal.QueryDistribuidorAfterInsert(DataSet: TDataSet);
begin
    QueryDistribuidorID.Value := -1;
end;

procedure TDataModulePrincipal.QueryListaProdutorCreditoCalcFields(
  DataSet: TDataSet);
begin
    if not QueryListaProdutorCreditoID_DISTRIBUIDOR.AsString.IsEmpty then
    begin
        DataModulePrincipal.QueryDistribuidorCalc.Close;
        DataModulePrincipal.QueryDistribuidorCalc.Params[0].Value := QueryListaProdutorCreditoID_DISTRIBUIDOR.Value;
        DataModulePrincipal.QueryDistribuidorCalc.Open;

        QueryListaProdutorCreditoDISTRIBUIDORNOME.Value := DataModulePrincipal.QueryDistribuidorCalcNOME.AsString;
        DataModulePrincipal.QueryDistribuidorCalc.Close;
    end;
end;

procedure TDataModulePrincipal.QueryProdutoAfterInsert(DataSet: TDataSet);
begin
    QueryProdutoID.Value := -1;
end;

procedure TDataModulePrincipal.QueryProdutorBeforeDelete(DataSet: TDataSet);
begin
    DataModulePrincipal.QueryListaProdutorCredito.Close;
    DataModulePrincipal.QueryListaProdutorCredito.Params[0].Value := DataModulePrincipal.QueryProdutorID.Value;
    DataModulePrincipal.QueryListaProdutorCredito.Open;

    DataModulePrincipal.QueryListaProdutorCredito.First;
    while not DataModulePrincipal.QueryListaProdutorCredito.Eof do
    begin
        if NOT DataModulePrincipal.QueryListaProdutorCreditoID_PRODUTOR.AsString.IsEmpty then
        begin
            DataModulePrincipal.QueryProdutorCredito.Close;
            DataModulePrincipal.QueryProdutorCredito.Params[0].value := DataModulePrincipal.QueryListaProdutorCreditoID.Value;
            DataModulePrincipal.QueryProdutorCredito.Params[1].value := DataModulePrincipal.QueryListaProdutorCreditoID_PRODUTOR.Value;
            DataModulePrincipal.QueryProdutorCredito.Open;
            DataModulePrincipal.QueryListaProdutorCredito.Delete;
            DataModulePrincipal.QueryListaProdutorCredito.ApplyUpdates(0);
        end;

        DataModulePrincipal.QueryListaProdutorCredito.Next;
    end;
    DataModulePrincipal.QueryListaProdutorCredito.Close;
end;

procedure TDataModulePrincipal.QueryProdutorBeforePost(DataSet: TDataSet);
begin
    DataModulePrincipal.QueryListaProdutorCredito.First;
    while not DataModulePrincipal.QueryListaProdutorCredito.Eof do
    begin
        if DataModulePrincipal.QueryListaProdutorCreditoID_PRODUTOR.AsString.IsEmpty then
        begin
            DataModulePrincipal.QueryListaProdutorCredito.Edit;
            DataModulePrincipal.QueryListaProdutorCreditoID_PRODUTOR.value := QueryProdutorID.Value;
            DataModulePrincipal.QueryListaProdutorCredito.Post;
        end;

        DataModulePrincipal.QueryListaProdutorCredito.Next;
    end;
end;

end.
