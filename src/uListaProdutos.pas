unit uListaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TListaProdutos = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EditProcurar: TEdit;
    Label2: TLabel;
    ComboCampos: TComboBox;
    ComboOrdem: TComboBox;
    Label3: TLabel;
    procedure EditProcurarExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure IncluirClick(Sender: TObject);
    procedure AlterarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
  end;

var
  ListaProdutos: TListaProdutos;

implementation

{$R *.dfm}

uses uDataModulePrincipal, UCadastroProdutos;

procedure TListaProdutos.IncluirClick(Sender: TObject);
begin
    DataModulePrincipal.QueryProduto.Close;
    DataModulePrincipal.QueryProduto.Params[0].Value := -1;
    DataModulePrincipal.QueryProduto.Open;
    DataModulePrincipal.QueryProduto.Append;

    TCadastroProdutos.Create(Self);
end;

procedure TListaProdutos.AlterarClick(Sender: TObject);
begin
    if not DataModulePrincipal.QueryListaProduto.IsEmpty then
    begin
        DataModulePrincipal.QueryProduto.Close;
        DataModulePrincipal.QueryProduto.Params[0].Value := DataModulePrincipal.QueryListaProdutoID.Value;
        DataModulePrincipal.QueryProduto.Open;
        DataModulePrincipal.QueryProduto.Edit;

        TCadastroProdutos.Create(Self);
    end;
end;

procedure TListaProdutos.ExcluirClick(Sender: TObject);
begin
    if not DataModulePrincipal.QueryListaProduto.IsEmpty then
    begin
        if MessageDlg('Tem certeza que deseja Excluir?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = 6 then
        begin
            DataModulePrincipal.QueryProduto.Close;
            DataModulePrincipal.QueryProduto.Params[0].Value := DataModulePrincipal.QueryListaProdutoID.Value;
            DataModulePrincipal.QueryProduto.Open;
            DataModulePrincipal.QueryProduto.Delete;
            DataModulePrincipal.QueryProduto.ApplyUpdates(0);
            DataModulePrincipal.QueryProduto.Close;
            FormActivate(Sender);
        end;
    end;
end;

procedure TListaProdutos.DBGrid1DblClick(Sender: TObject);
begin
    AlterarClick(Sender);
end;

procedure TListaProdutos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TListaProdutos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if (ActiveControl is TDBGrid) then
        Key := #0;
    if (Key = #13) then
        Key := #0;
end;

procedure TListaProdutos.EditProcurarExit(Sender: TObject);
var
    where, ordem: string;
begin
    DataModulePrincipal.QueryListaProduto.Close;
    DataModulePrincipal.QueryListaProduto.SQL.Clear;
    DataModulePrincipal.QueryListaProduto.SQL.Text := 'SELECT * FROM PRODUTO';

    where := ' WHERE ';
    if ComboCampos.ItemIndex = 0 then
        where := where+' ID '
    else if ComboCampos.ItemIndex = 1 then
        where := where+' NOME '
    else
        where := where+' VALOR ';
    where := where+' LIKE '+QuotedStr('%'+EditProcurar.Text+'%');

    if ComboOrdem.ItemIndex = 0 then
        ordem := ' ORDER BY ID '
    else if ComboOrdem.ItemIndex = 1 then
        ordem := ' ORDER BY NOME '
    else
        ordem := ' ORDER BY VALOR ';

    DataModulePrincipal.QueryListaProduto.SQL.Add(where);
    DataModulePrincipal.QueryListaProduto.SQL.Add(ordem);

    DataModulePrincipal.QueryListaProduto.Open;
    DataModulePrincipal.QueryListaProduto.First;
end;

procedure TListaProdutos.FormActivate(Sender: TObject);
begin
    WindowState := wsMaximized;
    EditProcurarExit(Sender);
end;

procedure TListaProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
