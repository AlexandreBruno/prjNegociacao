unit UCadastroProdutores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadastroProdutores = class(TForm)
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
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure IncluirClick(Sender: TObject);
    procedure AlterarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
  end;

var
  CadastroProdutores: TCadastroProdutores;

implementation

{$R *.dfm}

uses uDataModulePrincipal, UCadastroProdutorCredito;


procedure TCadastroProdutores.IncluirClick(Sender: TObject);
var
    filtro: string;
    maxseq: Integer;
begin
    maxseq := 0;

    //Filtro para nao deixar repetir o distribuidor
    DataModulePrincipal.QueryListaProdutorCredito.DisableControls;
    DataModulePrincipal.QueryListaProdutorCredito.First;
    filtro := '';
    while not DataModulePrincipal.QueryListaProdutorCredito.Eof do
    begin
        if not filtro.IsEmpty then
            filtro := filtro  + ' and ';

        filtro := filtro + ' (ID <>'+DataModulePrincipal.QueryListaProdutorCreditoID_DISTRIBUIDOR.AsString+') ';

        if DataModulePrincipal.QueryListaProdutorCreditoID.Value > maxseq then
            maxseq := DataModulePrincipal.QueryListaProdutorCreditoID.Value;

        DataModulePrincipal.QueryListaProdutorCredito.Next;
    end;

    DataModulePrincipal.QueryListaDistribuidor.Close;
    DataModulePrincipal.QueryListaDistribuidor.SQL.Text := 'SELECT * FROM DISTRIBUIDOR ';
    if not filtro.IsEmpty then
    begin
        DataModulePrincipal.QueryListaDistribuidor.SQL.Add(' WHERE ' + filtro);
    end;
    DataModulePrincipal.QueryListaDistribuidor.Open;
    DataModulePrincipal.QueryListaDistribuidor.First;

    DataModulePrincipal.QueryListaProdutorCredito.First;
    DataModulePrincipal.QueryListaProdutorCredito.EnableControls;

    maxseq := maxseq+1;
    DataModulePrincipal.QueryListaProdutorCredito.Insert;
    DataModulePrincipal.QueryListaProdutorCreditoID.Value := maxseq;
    DataModulePrincipal.QueryListaProdutorCreditoID_PRODUTOR.Value := DataModulePrincipal.QueryProdutorID.Value;

    TCadastroProdutorCredito.Create(Self);
end;

procedure TCadastroProdutores.AlterarClick(Sender: TObject);
var
    filtro: string;
    seqAtual: Integer;
begin
    seqAtual := DataModulePrincipal.QueryListaProdutorCreditoID.Value;

    //Filtro para nao deixar repetir o distribuidor
    DataModulePrincipal.QueryListaProdutorCredito.DisableControls;
    DataModulePrincipal.QueryListaProdutorCredito.First;

    filtro := '';

    while not DataModulePrincipal.QueryListaProdutorCredito.Eof do
    begin
        if seqAtual <> DataModulePrincipal.QueryListaProdutorCreditoID.Value then
        begin
            if not filtro.IsEmpty then
                filtro := filtro  + ' and ';

            filtro := filtro + ' (ID <>'+DataModulePrincipal.QueryListaProdutorCreditoID_DISTRIBUIDOR.AsString+') ';
        end;

        DataModulePrincipal.QueryListaProdutorCredito.Next;
    end;

    DataModulePrincipal.QueryListaDistribuidor.Close;
    if not filtro.IsEmpty then
    begin
        DataModulePrincipal.QueryListaDistribuidor.SQL.Text := 'SELECT * FROM DISTRIBUIDOR WHERE ' + filtro;
    end;
    DataModulePrincipal.QueryListaDistribuidor.Open;
    DataModulePrincipal.QueryListaDistribuidor.First;

    DataModulePrincipal.QueryListaProdutorCredito.First;

    DataModulePrincipal.QueryListaProdutorCredito.First;
    while not DataModulePrincipal.QueryListaProdutorCredito.Eof do
    begin
        if seqAtual = DataModulePrincipal.QueryListaProdutorCreditoID.Value then
        break;

        DataModulePrincipal.QueryListaProdutorCredito.Next;
    end;

    DataModulePrincipal.QueryListaProdutorCredito.EnableControls;

    DataModulePrincipal.QueryListaProdutorCredito.Edit;

    TCadastroProdutorCredito.Create(Self);
end;

procedure TCadastroProdutores.ExcluirClick(Sender: TObject);
begin
    if not DataModulePrincipal.QueryListaProdutorCredito.IsEmpty then
    begin
        if MessageDlg('Tem certeza que deseja Excluir?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = 6 then
            DataModulePrincipal.QueryListaProdutorCredito.Delete;
    end;
end;

procedure TCadastroProdutores.ButtonCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TCadastroProdutores.ButtonConfirmarClick(Sender: TObject);
var
    codigo: Integer;
begin
    if DataModulePrincipal.QueryProdutorID.Value = -1 then
    begin
        DataModulePrincipal.QueryCodigo.Close;
        DataModulePrincipal.QueryCodigo.SQL.Text := 'select max(ID) CODIGO FROM PRODUTOR ';
        DataModulePrincipal.QueryCodigo.Open;

        if DataModulePrincipal.QueryCodigo.FieldByName('CODIGO').Value = null then
            codigo := 0
        else
            codigo := DataModulePrincipal.QueryCodigo.FieldByName('CODIGO').Value;
        codigo := codigo+1;
        DataModulePrincipal.QueryProdutorID.Value := codigo;

        DataModulePrincipal.QueryListaProdutorCredito.First;
        while not DataModulePrincipal.QueryListaProdutorCredito.Eof do
        begin
            DataModulePrincipal.QueryListaProdutorCredito.Edit;
            DataModulePrincipal.QueryListaProdutorCreditoID.Value := DataModulePrincipal.QueryProdutorID.Value;
            DataModulePrincipal.QueryListaProdutorCredito.Post;

            DataModulePrincipal.QueryListaProdutorCredito.Next;
        end;
    end;
    DataModulePrincipal.QueryProdutor.Post;
    DataModulePrincipal.QueryProdutor.ApplyUpdates(0);
    DataModulePrincipal.QueryListaProdutorCredito.ApplyUpdates(0);
    Close;
end;

procedure TCadastroProdutores.DBGrid1DblClick(Sender: TObject);
begin
    AlterarClick(Sender);
end;

procedure TCadastroProdutores.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TCadastroProdutores.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if (ActiveControl is TDBGrid) then
        Key := #0;
    if (Key = #13) then
        Key := #0;
end;

procedure TCadastroProdutores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataModulePrincipal.QueryProdutor.Close;
    DataModulePrincipal.QueryProdutorCredito.Close;
    Action := caFree;
end;

procedure TCadastroProdutores.FormCreate(Sender: TObject);
begin
    DataModulePrincipal.QueryListaProdutorCredito.Close;
    DataModulePrincipal.QueryListaProdutorCredito.Params[0].Value := DataModulePrincipal.QueryProdutorID.Value;
    DataModulePrincipal.QueryListaProdutorCredito.Open;
    DataModulePrincipal.QueryListaProdutorCredito.First;

    DataModulePrincipal.QueryProdutorCredito.Close;
    DataModulePrincipal.QueryProdutorCredito.Params[0].Value := DataModulePrincipal.QueryProdutorID.Value;
    DataModulePrincipal.QueryProdutorCredito.Open;
    DataModulePrincipal.QueryProdutorCredito.First;
end;

end.
