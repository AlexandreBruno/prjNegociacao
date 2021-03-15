unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.UITypes;

type
  TMenu = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    CadastroDistribuidor: TMenuItem;
    CadastroProdutos: TMenuItem;
    CadastroProduto: TMenuItem;
    Movimentaes1: TMenuItem;
    ListaNegociacoes: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CadastroDistribuidorClick(Sender: TObject);
    procedure CadastroProdutosClick(Sender: TObject);
    procedure CadastroProdutoClick(Sender: TObject);
    procedure ListaNegociacoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Menu: TMenu;

implementation

{$R *.dfm}

uses uDataModulePrincipal, uListaDistribuidores, uListaProdutos,
  uListaProdutores, uListaNegociacao;

procedure TMenu.CadastroDistribuidorClick(Sender: TObject);
begin
    TListaDistribuidores.Create(Self);
end;

procedure TMenu.CadastroProdutoClick(Sender: TObject);
begin
    TListaProdutores.Create(Self);
end;

procedure TMenu.CadastroProdutosClick(Sender: TObject);
begin
    TListaProdutos.Create(Self);
end;

procedure TMenu.FormActivate(Sender: TObject);
begin
    WindowState := wsMaximized;
end;

procedure TMenu.FormCreate(Sender: TObject);
begin
    if DataModulePrincipal = nil then
        Application.CreateForm(TDataModulePrincipal, DataModulePrincipal);
end;

procedure TMenu.ListaNegociacoesClick(Sender: TObject);
begin
    TListaNegociacao.Create(Self);
end;

procedure TMenu.Sair1Click(Sender: TObject);
begin
    if MessageDlg('Tem certeza que deseja sair?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = 6 then
    begin
        Close;
    end;
end;

end.
