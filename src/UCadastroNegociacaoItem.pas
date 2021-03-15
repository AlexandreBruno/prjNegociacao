unit UCadastroNegociacaoItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TCadastroNegociacaoItem = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Panel2: TPanel;
    ButtonCancelar: TButton;
    ButtonConfirmar: TButton;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroNegociacaoItem: TCadastroNegociacaoItem;

implementation

{$R *.dfm}

uses uDataModulePrincipal;

procedure TCadastroNegociacaoItem.ButtonCancelarClick(Sender: TObject);
begin
    DataModulePrincipal.QuerylistaNegociacaoItem.Cancel;
    Close;
end;

procedure TCadastroNegociacaoItem.ButtonConfirmarClick(Sender: TObject);
begin
    if DataModulePrincipal.QuerylistaNegociacaoItemID_NEGOCIACAO.AsString.IsEmpty then
        DataModulePrincipal.QuerylistaNegociacaoItemID_NEGOCIACAO.Value := DataModulePrincipal.QueryNegociacaoID.Value;
    DataModulePrincipal.QuerylistaNegociacaoItem.Post;
    Close;
end;

procedure TCadastroNegociacaoItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

end.
