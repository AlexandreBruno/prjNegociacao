unit UCadastroDistribuidores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TCadastroDistribuidores = class(TForm)
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
  CadastroDistribuidores: TCadastroDistribuidores;

implementation

{$R *.dfm}

uses uDataModulePrincipal;

procedure TCadastroDistribuidores.ButtonCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TCadastroDistribuidores.ButtonConfirmarClick(Sender: TObject);
var
    codigo: Integer;
begin
    if DataModulePrincipal.QueryDistribuidorID.Value = -1 then
    begin
        DataModulePrincipal.QueryCodigo.Close;
        DataModulePrincipal.QueryCodigo.SQL.Text := 'select max(ID) CODIGO FROM DISTRIBUIDOR ';
        DataModulePrincipal.QueryCodigo.Open;

        if DataModulePrincipal.QueryCodigo.FieldByName('CODIGO').Value = null then
            codigo := 0
        else
            codigo := DataModulePrincipal.QueryCodigo.FieldByName('CODIGO').Value;
        codigo := codigo+1;
        DataModulePrincipal.QueryDistribuidorID.Value := codigo;
    end;
    DataModulePrincipal.QueryDistribuidor.Post;
    DataModulePrincipal.QueryDistribuidor.ApplyUpdates(0);
    Close;
end;

procedure TCadastroDistribuidores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataModulePrincipal.QueryDistribuidor.Close;
    Action := caFree;
end;

end.
