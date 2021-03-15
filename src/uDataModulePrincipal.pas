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
    DataSourceListaNegociacao: TDataSource;
    DataSourceListaNegociacaoItem: TDataSource;
    QueryListaNegociacaoItem: TFDQuery;
    QueryListaNegociacaoItemID_NEGOCIACAO: TIntegerField;
    QueryListaNegociacaoItemSEQUENCIA: TIntegerField;
    QueryListaNegociacaoItemQUANTIDADE: TIntegerField;
    QueryListaNegociacaoItemVALOR_UNITARIO: TFMTBCDField;
    QueryListaNegociacaoItemVALOR_TOTAL: TFMTBCDField;
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
    QueryListaNegociacaoNOMEDISTRIBUIDOR: TStringField;
    QueryListaNegociacaoNOMEPRODUTOR: TStringField;
    QueryListaNegociacaoID: TIntegerField;
    QueryListaNegociacaoID_PRODUTOR: TIntegerField;
    QueryListaNegociacaoID_DISTRIBUIDOR: TIntegerField;
    QueryListaNegociacaoSTATUS: TStringField;
    QueryListaNegociacaoVALOR: TFMTBCDField;
    QueryProdutorCalc: TFDQuery;
    QueryProdutorCalcID: TIntegerField;
    QueryProdutorCalcNOME: TStringField;
    QueryProdutoCalc: TFDQuery;
    QueryProdutoCalcID: TIntegerField;
    QueryProdutoCalcNOME: TStringField;
    QueryProdutoCalcVALOR: TFMTBCDField;
    QueryListaNegociacaoItemNOMEPRODUTO: TStringField;
    QueryListaNegociacaoItemID_PRODUTO: TIntegerField;
    QueryValorProdutorDistribuidor: TFDQuery;
    QueryValorNegociado: TFDQuery;
    QueryValorNegociadoVALORNEGOCIADO: TFMTBCDField;
    DataSourceValorProdutorDistribuidor: TDataSource;
    DataSourceValorNegociado: TDataSource;
    QueryValorProdutorDistribuidorVALORLIMITE: TFMTBCDField;
    QueryNegociacaoDATA: TDateField;
    procedure QueryDistribuidorAfterInsert(DataSet: TDataSet);
    procedure QueryProdutoAfterInsert(DataSet: TDataSet);
    procedure QueryListaProdutorCreditoCalcFields(DataSet: TDataSet);
    procedure QueryProdutorBeforePost(DataSet: TDataSet);
    procedure QueryProdutorBeforeDelete(DataSet: TDataSet);
    procedure QueryNegociacaoAfterInsert(DataSet: TDataSet);
    procedure QueryListaNegociacaoCalcFields(DataSet: TDataSet);
    procedure QueryListaNegociacaoItemCalcFields(DataSet: TDataSet);
    procedure QueryNegociacaoBeforePost(DataSet: TDataSet);
    procedure QueryValorProdutorDistribuidorBeforeOpen(DataSet: TDataSet);
    procedure QueryNegociacaoAfterOpen(DataSet: TDataSet);
    procedure QueryListaNegociacaoItemAfterPost(DataSet: TDataSet);
    procedure QueryListaNegociacaoItemQUANTIDADEValidate(Sender: TField);
    procedure QueryListaNegociacaoItemID_PRODUTOValidate(Sender: TField);
    procedure QueryNegociacaoID_PRODUTORValidate(Sender: TField);
    procedure QueryListaNegociacaoItemBeforeOpen(DataSet: TDataSet);
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

procedure TDataModulePrincipal.QueryListaNegociacaoCalcFields(
  DataSet: TDataSet);
begin
    if not QueryListaNegociacaoID_DISTRIBUIDOR.AsString.IsEmpty then
    begin
        DataModulePrincipal.QueryDistribuidorCalc.Close;
        DataModulePrincipal.QueryDistribuidorCalc.Params[0].Value := QueryListaNegociacaoID_DISTRIBUIDOR.Value;
        DataModulePrincipal.QueryDistribuidorCalc.Open;

        QueryListaNegociacaoNOMEDISTRIBUIDOR.AsString := DataModulePrincipal.QueryDistribuidorCalcNOME.AsString;
        DataModulePrincipal.QueryDistribuidorCalc.Close;
    end;

    if not QueryListaNegociacaoID_PRODUTOR.AsString.IsEmpty then
    begin
        DataModulePrincipal.QueryProdutorCalc.Close;
        DataModulePrincipal.QueryProdutorCalc.Params[0].Value := QueryListaNegociacaoID_PRODUTOR.Value;
        DataModulePrincipal.QueryProdutorCalc.Open;

        QueryListaNegociacaoNOMEPRODUTOR.AsString := DataModulePrincipal.QueryProdutorCalcNOME.AsString;
        DataModulePrincipal.QueryProdutorCalc.Close;
    end;
end;

procedure TDataModulePrincipal.QueryListaNegociacaoItemAfterPost(
  DataSet: TDataSet);
begin
    QueryNegociacaoVALOR.value := 0;
    QueryListaNegociacaoItem.First;
    while not QueryListaNegociacaoItem.Eof do
    begin
        QueryNegociacaoVALOR.value := QueryNegociacaoVALOR.value + QueryListaNegociacaoItemVALOR_TOTAL.Value;
        QueryListaNegociacaoItem.Next;
    end;
    QueryListaNegociacaoItem.First;
end;

procedure TDataModulePrincipal.QueryListaNegociacaoItemBeforeOpen(
  DataSet: TDataSet);
begin
    QueryListaNegociacaoItem.Params[0].Value := QueryNegociacaoID.Value;
end;

procedure TDataModulePrincipal.QueryListaNegociacaoItemCalcFields(
  DataSet: TDataSet);
begin
    if not QueryListaNegociacaoItemID_PRODUTO.AsString.IsEmpty then
    begin
        DataModulePrincipal.QueryProdutoCalc.Close;
        DataModulePrincipal.QueryProdutoCalc.Params[0].Value := QueryListaNegociacaoItemID_PRODUTO.Value;
        DataModulePrincipal.QueryProdutoCalc.Open;

        QueryListaNegociacaoItemNOMEPRODUTO.Value := DataModulePrincipal.QueryProdutoCalcNOME.AsString;
        DataModulePrincipal.QueryProdutorCalc.Close;
    end;
end;

procedure TDataModulePrincipal.QueryListaNegociacaoItemID_PRODUTOValidate(
  Sender: TField);
begin
    QueryProduto.Close;
    QueryProduto.Params[0].Value := QueryListaNegociacaoItemID_PRODUTO.value;
    QueryProduto.Open;

    if not QueryProduto.IsEmpty then
        QueryListaNegociacaoItemVALOR_UNITARIO.Value := QueryProdutoVALOR.Value;

    QueryProduto.Close;
end;

procedure TDataModulePrincipal.QueryListaNegociacaoItemQUANTIDADEValidate(
  Sender: TField);
begin
    QueryListaNegociacaoItemVALOR_TOTAL.Value := QueryListaNegociacaoItemVALOR_UNITARIO.Value * QueryListaNegociacaoItemQUANTIDADE.Value;
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

procedure TDataModulePrincipal.QueryNegociacaoAfterInsert(DataSet: TDataSet);
begin
    QueryNegociacaoID.Value := -1;
    QueryNegociacaoSTATUS.Value := 'Pendente';
    QueryNegociacaoVALOR.Value := 0;
end;

procedure TDataModulePrincipal.QueryNegociacaoAfterOpen(DataSet: TDataSet);
begin
    QueryValorProdutorDistribuidor.Close;
    QueryValorProdutorDistribuidor.Open;
    QueryValorNegociado.Close;
    QueryValorNegociado.Open;

    QueryListaNegociacaoItem.Close;
    QueryListaNegociacaoItem.Open;
end;

procedure TDataModulePrincipal.QueryNegociacaoBeforePost(DataSet: TDataSet);
begin
    if QueryNegociacaoVALOR.AsString.IsEmpty then
        QueryNegociacaoVALOR.Value := 0;
end;

procedure TDataModulePrincipal.QueryNegociacaoID_PRODUTORValidate(
  Sender: TField);
begin
    QueryValorProdutorDistribuidor.Close;
    QueryValorProdutorDistribuidor.Open;
    QueryValorNegociado.Close;
    QueryValorNegociado.Open;
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

procedure TDataModulePrincipal.QueryValorProdutorDistribuidorBeforeOpen(
  DataSet: TDataSet);
begin
    QueryValorProdutorDistribuidor.Params[0].Value := QueryNegociacaoID_PRODUTOR.value;
    QueryValorProdutorDistribuidor.Params[1].Value := QueryNegociacaoID_DISTRIBUIDOR.value;

    QueryValorNegociado.Params[0].Value := QueryNegociacaoID_PRODUTOR.value;
    QueryValorNegociado.Params[1].Value := QueryNegociacaoID_DISTRIBUIDOR.value;
end;

end.
