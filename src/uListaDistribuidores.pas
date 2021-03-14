unit uListaDistribuidores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TListaDistribuidores = class(TForm)
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
  ListaDistribuidores: TListaDistribuidores;

implementation

{$R *.dfm}

uses uDataModulePrincipal, UCadastroDistribuidores;

procedure TListaDistribuidores.IncluirClick(Sender: TObject);
begin
    DataModulePrincipal.QueryDistribuidor.Close;
    DataModulePrincipal.QueryDistribuidor.Params[0].Value := -1;
    DataModulePrincipal.QueryDistribuidor.Open;
    DataModulePrincipal.QueryDistribuidor.Append;

    TCadastroDistribuidores.Create(Self);
end;

procedure TListaDistribuidores.AlterarClick(Sender: TObject);
begin
    if not DataModulePrincipal.QueryListaDistribuidor.IsEmpty then
    begin
        DataModulePrincipal.QueryDistribuidor.Close;
        DataModulePrincipal.QueryDistribuidor.Params[0].Value := DataModulePrincipal.QueryListaDistribuidorID.Value;
        DataModulePrincipal.QueryDistribuidor.Open;
        DataModulePrincipal.QueryDistribuidor.Edit;

        TCadastroDistribuidores.Create(Self);
    end;
end;

procedure TListaDistribuidores.ExcluirClick(Sender: TObject);
begin
    if not DataModulePrincipal.QueryListaDistribuidor.IsEmpty then
    begin
        if MessageDlg('Tem certeza que deseja Excluir?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = 6 then
        begin
            DataModulePrincipal.QueryDistribuidor.Close;
            DataModulePrincipal.QueryDistribuidor.Params[0].Value := DataModulePrincipal.QueryListaDistribuidorID.Value;
            DataModulePrincipal.QueryDistribuidor.Open;
            DataModulePrincipal.QueryDistribuidor.Delete;
            DataModulePrincipal.QueryDistribuidor.ApplyUpdates(0);
            DataModulePrincipal.QueryDistribuidor.Close;
            FormActivate(Sender);
        end;
    end;
end;

procedure TListaDistribuidores.DBGrid1DblClick(Sender: TObject);
begin
    AlterarClick(Sender);
end;

procedure TListaDistribuidores.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TListaDistribuidores.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if (ActiveControl is TDBGrid) then
        Key := #0;
    if (Key = #13) then
        Key := #0;
end;

procedure TListaDistribuidores.EditProcurarExit(Sender: TObject);
var
    where, ordem: string;
begin
    DataModulePrincipal.QueryListaDistribuidor.Close;
    DataModulePrincipal.QueryListaDistribuidor.SQL.Clear;
    DataModulePrincipal.QueryListaDistribuidor.SQL.Text := 'SELECT * FROM DISTRIBUIDOR';

    where := ' WHERE ';
    if ComboCampos.ItemIndex = 0 then
        where := where+' ID '
    else if ComboCampos.ItemIndex = 1 then
        where := where+' NOME '
    else
        where := where+' CNPJ ';
    where := where+' LIKE '+QuotedStr('%'+EditProcurar.Text+'%');

    if ComboOrdem.ItemIndex = 0 then
        ordem := ' ORDER BY ID '
    else if ComboOrdem.ItemIndex = 1 then
        ordem := ' ORDER BY NOME '
    else
        ordem := ' ORDER BY CNPJ ';

    DataModulePrincipal.QueryListaDistribuidor.SQL.Add(where);
    DataModulePrincipal.QueryListaDistribuidor.SQL.Add(ordem);

    DataModulePrincipal.QueryListaDistribuidor.Open;
    DataModulePrincipal.QueryListaDistribuidor.First;
end;

procedure TListaDistribuidores.FormActivate(Sender: TObject);
begin
    WindowState := wsMaximized;
    EditProcurarExit(Sender);
end;

procedure TListaDistribuidores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
