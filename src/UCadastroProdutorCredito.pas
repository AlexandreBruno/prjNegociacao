unit UCadastroProdutorCredito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TCadastroProdutorCredito = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Panel2: TPanel;
    ButtonCancelar: TButton;
    ButtonConfirmar: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroProdutorCredito: TCadastroProdutorCredito;

implementation

{$R *.dfm}

uses uDataModulePrincipal;

procedure TCadastroProdutorCredito.ButtonCancelarClick(Sender: TObject);
begin
    DataModulePrincipal.QueryListaProdutorCredito.Cancel;
    Close;
end;

procedure TCadastroProdutorCredito.ButtonConfirmarClick(Sender: TObject);
begin
    if DataModulePrincipal.QueryListaProdutorCreditoID_PRODUTOR.AsString.IsEmpty then
       DataModulePrincipal.QueryListaProdutorCreditoID_PRODUTOR.Value := DataModulePrincipal.QueryProdutorID.Value;
    DataModulePrincipal.QueryListaProdutorCredito.Post;
    Close;
end;

procedure TCadastroProdutorCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

end.
