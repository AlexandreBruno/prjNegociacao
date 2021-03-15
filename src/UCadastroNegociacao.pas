unit UCadastroNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadastroNegociacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ButtonCancelar: TButton;
    ButtonConfirmar: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ValorSaldo, ValorNegociadoAtual, ValorInicialEdicao: Double;

    procedure IncluirClick(Sender: TObject);
    procedure AlterarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
  end;

var
  CadastroNegociacao: TCadastroNegociacao;

implementation

{$R *.dfm}

uses uDataModulePrincipal, UCadastroNegociacaoItem;


procedure TCadastroNegociacao.IncluirClick(Sender: TObject);
var
    filtro: string;
    maxseq: Integer;
begin
    maxseq := 0;

    //Filtro para nao deixar repetir o distribuidor
    DataModulePrincipal.QuerylistaNegociacaoItem.DisableControls;
    DataModulePrincipal.QuerylistaNegociacaoItem.First;
    filtro := '';
    while not DataModulePrincipal.QuerylistaNegociacaoItem.Eof do
    begin
        if not filtro.IsEmpty then
            filtro := filtro  + ' and ';

        filtro := filtro + ' (ID <>'+DataModulePrincipal.QueryListaNegociacaoItemID_PRODUTO.AsString+') ';

        if DataModulePrincipal.QueryListaNegociacaoItemSEQUENCIA.Value > maxseq then
            maxseq := DataModulePrincipal.QueryListaNegociacaoItemSEQUENCIA.Value;

        DataModulePrincipal.QuerylistaNegociacaoItem.Next;
    end;

    DataModulePrincipal.QueryListaProduto.Close;
    DataModulePrincipal.QueryListaProduto.SQL.Text := 'SELECT * FROM PRODUTO ';
    if not filtro.IsEmpty then
    begin
        DataModulePrincipal.QueryListaProduto.SQL.Add(' WHERE ' + filtro);
    end;
    DataModulePrincipal.QueryListaProduto.Open;
    DataModulePrincipal.QueryListaProduto.First;

    DataModulePrincipal.QuerylistaNegociacaoItem.First;
    DataModulePrincipal.QuerylistaNegociacaoItem.EnableControls;

    maxseq := maxseq+1;
    DataModulePrincipal.QuerylistaNegociacaoItem.Insert;
    DataModulePrincipal.QueryListaNegociacaoItemSEQUENCIA.Value := maxseq;
    DataModulePrincipal.QueryListaNegociacaoItemID_NEGOCIACAO.Value := DataModulePrincipal.QueryNegociacaoID.Value;

    TCadastroNegociacaoItem.Create(Self);
end;

procedure TCadastroNegociacao.AlterarClick(Sender: TObject);
var
    filtro: string;
    seqAtual: Integer;
begin
    seqAtual := DataModulePrincipal.QueryListaNegociacaoItemSEQUENCIA.Value;

    //Filtro para nao deixar repetir o distribuidor
    DataModulePrincipal.QueryListaNegociacaoItem.DisableControls;
    DataModulePrincipal.QueryListaNegociacaoItem.First;

    filtro := '';

    while not DataModulePrincipal.QueryListaNegociacaoItem.Eof do
    begin
        if seqAtual <> DataModulePrincipal.QueryListaNegociacaoItemSEQUENCIA.Value then
        begin
            if not filtro.IsEmpty then
                filtro := filtro  + ' and ';

            filtro := filtro + ' (ID <>'+DataModulePrincipal.QueryListaNegociacaoItemID_PRODUTO.AsString+') ';
        end;

        DataModulePrincipal.QueryListaNegociacaoItem.Next;
    end;

    DataModulePrincipal.QueryListaProduto.Close;
    if not filtro.IsEmpty then
    begin
        DataModulePrincipal.QueryListaProduto.SQL.Text := 'SELECT * FROM PRODUTO WHERE ' + filtro;
    end;
    DataModulePrincipal.QueryListaProduto.Open;
    DataModulePrincipal.QueryListaProduto.First;

    DataModulePrincipal.QueryListaNegociacaoItem.First;
    while not DataModulePrincipal.QueryListaNegociacaoItem.Eof do
    begin
        if seqAtual = DataModulePrincipal.QueryListaNegociacaoItemSEQUENCIA.Value then
        break;

        DataModulePrincipal.QueryListaNegociacaoItem.Next;
    end;

    DataModulePrincipal.QueryListaNegociacaoItem.EnableControls;

    DataModulePrincipal.QueryListaNegociacaoItem.Edit;

    TCadastroNegociacaoItem.Create(Self);
end;

procedure TCadastroNegociacao.ExcluirClick(Sender: TObject);
begin
    if not DataModulePrincipal.QueryListaNegociacaoItem.IsEmpty then
    begin
        if MessageDlg('Tem certeza que deseja Excluir?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = 6 then
            DataModulePrincipal.QueryListaNegociacaoItem.Delete;
    end;
end;

procedure TCadastroNegociacao.ButtonCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TCadastroNegociacao.ButtonConfirmarClick(Sender: TObject);
var
    codigo: Integer;
begin
    //Validação do Crédito do Produtor x Distribuidor
    ValorSaldo := DataModulePrincipal.QueryValorProdutorDistribuidorVALORLIMITE.AsFloat;

    //ValorSaldo := ValorSaldo - ValorNegociadoAtual;
    ValorNegociadoAtual := DataModulePrincipal.QueryValorNegociadoVALORNEGOCIADO.AsFloat + DataModulePrincipal.QueryNegociacaoVALOR.AsFloat;

    if (DataModulePrincipal.QueryValorProdutorDistribuidor.IsEmpty) then
        raise Exception.Create('Não existe limite de crédito para o produtor e distribuidor informados!');
    if (ValorSaldo < ValorNegociadoAtual) then
        raise Exception.Create('O Valor do crédito do Produtor é R$ '+formatfloat('#,##0', ValorSaldo)+
        ' e o valor utilizado em todas as negociações aprovadas/concluidas é R$'+
        formatfloat('#,##0', ValorNegociadoAtual) );

    if DataModulePrincipal.QueryNegociacaoID.Value = -1 then
    begin
        DataModulePrincipal.QueryCodigo.Close;
        DataModulePrincipal.QueryCodigo.SQL.Text := 'select max(ID) CODIGO FROM NEGOCIACAO ';
        DataModulePrincipal.QueryCodigo.Open;

        if DataModulePrincipal.QueryCodigo.FieldByName('CODIGO').Value = null then
            codigo := 0
        else
            codigo := DataModulePrincipal.QueryCodigo.FieldByName('CODIGO').Value;
        codigo := codigo+1;
        DataModulePrincipal.QueryNegociacaoID.Value := codigo;
    end;

    DataModulePrincipal.QueryListaNegociacaoItem.First;
    while not DataModulePrincipal.QueryListaNegociacaoItem.Eof do
    begin
        DataModulePrincipal.QueryListaNegociacaoItem.Edit;
        DataModulePrincipal.QueryListaNegociacaoItemID_NEGOCIACAO.Value := DataModulePrincipal.QueryNegociacaoID.Value;
        DataModulePrincipal.QueryListaNegociacaoItem.Post;

        DataModulePrincipal.QueryListaNegociacaoItem.Next;
    end;

    DataModulePrincipal.QueryNegociacao.Post;
    DataModulePrincipal.QueryNegociacao.ApplyUpdates(0);
    DataModulePrincipal.QueryListaNegociacaoItem.ApplyUpdates(0);
    Close;
end;

procedure TCadastroNegociacao.DBGrid1DblClick(Sender: TObject);
begin
    AlterarClick(Sender);
end;

procedure TCadastroNegociacao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_INSERT:
            IncluirClick(Sender);
        VK_RETURN:
            AlterarClick(Sender);
        VK_DELETE:
            ExcluirClick(Sender);
    end;
end;

procedure TCadastroNegociacao.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if (ActiveControl is TDBGrid) then
        Key := #0;
    if (Key = #13) then
        Key := #0;
end;

procedure TCadastroNegociacao.FormActivate(Sender: TObject);
begin
    WindowState := wsMaximized;
    DataModulePrincipal.QueryValorProdutorDistribuidor.Close;
    DataModulePrincipal.QueryValorProdutorDistribuidor.Open;
    DataModulePrincipal.QueryValorNegociado.Close;
    DataModulePrincipal.QueryValorNegociado.Open;
end;

procedure TCadastroNegociacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataModulePrincipal.QueryProdutor.Close;
    DataModulePrincipal.QueryProdutorCredito.Close;
    Action := caFree;
end;

procedure TCadastroNegociacao.FormCreate(Sender: TObject);
begin
    DataModulePrincipal.QueryListaNegociacaoItem.Close;
    DataModulePrincipal.QueryListaNegociacaoItem.Params[0].Value := DataModulePrincipal.QueryNegociacaoItemID_NEGOCIACAO.Value;
    DataModulePrincipal.QueryListaNegociacaoItem.Open;
    DataModulePrincipal.QueryListaNegociacaoItem.First;

    DataModulePrincipal.QueryListaDistribuidor.Close;
    DataModulePrincipal.QueryListaDistribuidor.Open;
    DataModulePrincipal.QueryListaProdutor.Close;
    DataModulePrincipal.QueryListaProdutor.Open;
    ValorInicialEdicao := DataModulePrincipal.QueryNegociacaoVALOR.asFloat;
    if ((DataModulePrincipal.QueryNegociacaoSTATUS.AsString = 'Aprovada') or
        (DataModulePrincipal.QueryNegociacaoSTATUS.AsString = 'Concluir') or
        (DataModulePrincipal.QueryNegociacaoSTATUS.AsString = 'Cancelada')) then
    begin
        DBLookupComboBox2.Enabled := false;
        DBLookupComboBox1.Enabled := false;
        Panel4.Enabled := false;
        ButtonConfirmar.Visible := false;
    end;
end;

end.
