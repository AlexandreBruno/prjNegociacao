unit uListaProdutores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TListaProdutores = class(TForm)
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
  ListaProdutores: TListaProdutores;

implementation

{$R *.dfm}

uses uDataModulePrincipal, UCadastroProdutores;

procedure TListaProdutores.IncluirClick(Sender: TObject);
begin
    DataModulePrincipal.QueryProdutor.Close;
    DataModulePrincipal.QueryProdutor.Params[0].Value := -1;
    DataModulePrincipal.QueryProdutor.Open;
    DataModulePrincipal.QueryProdutor.Append;
    DataModulePrincipal.QueryProdutorID.Value := -1;

    TCadastroProdutores.Create(Self);
end;

procedure TListaProdutores.AlterarClick(Sender: TObject);
begin
    if not DataModulePrincipal.QueryListaProdutor.IsEmpty then
    begin
        DataModulePrincipal.QueryProdutor.Close;
        DataModulePrincipal.QueryProdutor.Params[0].Value := DataModulePrincipal.QueryListaProdutorID.Value;
        DataModulePrincipal.QueryProdutor.Open;
        DataModulePrincipal.QueryProdutor.Edit;

        TCadastroProdutores.Create(Self);
    end;
end;

procedure TListaProdutores.ExcluirClick(Sender: TObject);
begin
    if not DataModulePrincipal.QueryListaProdutor.IsEmpty then
    begin
        if MessageDlg('Tem certeza que deseja Excluir?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = 6 then
        begin
            DataModulePrincipal.QueryProdutor.Close;
            DataModulePrincipal.QueryProdutor.Params[0].Value := DataModulePrincipal.QueryListaProdutorID.Value;
            DataModulePrincipal.QueryProdutor.Open;
            DataModulePrincipal.QueryProdutor.Delete;
            DataModulePrincipal.QueryProdutor.ApplyUpdates(0);
            DataModulePrincipal.QueryProdutor.Close;
            FormActivate(Sender);
        end;
    end;
end;

procedure TListaProdutores.DBGrid1DblClick(Sender: TObject);
begin
    AlterarClick(Sender);
end;

procedure TListaProdutores.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TListaProdutores.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if (ActiveControl is TDBGrid) then
        Key := #0;
    if (Key = #13) then
        Key := #0;
end;

procedure TListaProdutores.EditProcurarExit(Sender: TObject);
var
    where, ordem: string;
begin
    DataModulePrincipal.QueryListaProdutor.Close;
    DataModulePrincipal.QueryListaProdutor.SQL.Clear;
    DataModulePrincipal.QueryListaProdutor.SQL.Text := 'SELECT * FROM PRODUTOR';

    where := ' WHERE ';
    if ComboCampos.ItemIndex = 0 then
        where := where+' ID '
    else if ComboCampos.ItemIndex = 1 then
        where := where+' NOME ';
    where := where+' LIKE '+QuotedStr('%'+EditProcurar.Text+'%');

    if ComboOrdem.ItemIndex = 0 then
        ordem := ' ORDER BY ID '
    else if ComboOrdem.ItemIndex = 1 then
        ordem := ' ORDER BY NOME ';

    DataModulePrincipal.QueryListaProdutor.SQL.Add(where);
    DataModulePrincipal.QueryListaProdutor.SQL.Add(ordem);

    DataModulePrincipal.QueryListaProdutor.Open;
    DataModulePrincipal.QueryListaProdutor.First;
end;

procedure TListaProdutores.FormActivate(Sender: TObject);
begin
    WindowState := wsMaximized;
    EditProcurarExit(Sender);
end;

procedure TListaProdutores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
