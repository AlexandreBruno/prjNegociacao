unit UCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TCadastroProdutos = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Panel2: TPanel;
    ButtonCancelar: TButton;
    ButtonConfirmar: TButton;
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroProdutos: TCadastroProdutos;

implementation

{$R *.dfm}

uses uDataModulePrincipal;

procedure TCadastroProdutos.ButtonCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TCadastroProdutos.ButtonConfirmarClick(Sender: TObject);
var
    codigo: Integer;
begin
    if DataModulePrincipal.QueryProdutoID.Value = -1 then
    begin
        DataModulePrincipal.QueryCodigo.Close;
        DataModulePrincipal.QueryCodigo.SQL.Text := 'select max(ID) CODIGO FROM PRODUTO ';
        DataModulePrincipal.QueryCodigo.Open;

        if DataModulePrincipal.QueryCodigo.FieldByName('CODIGO').Value = null then
            codigo := 0
        else
            codigo := DataModulePrincipal.QueryCodigo.FieldByName('CODIGO').Value;
        codigo := codigo+1;
        DataModulePrincipal.QueryProdutoID.Value := codigo;
    end;
    DataModulePrincipal.QueryProduto.Post;
    DataModulePrincipal.QueryProduto.ApplyUpdates(0);
    Close;
end;

procedure TCadastroProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataModulePrincipal.QueryProduto.Close;
    Action := caFree;
end;

end.
