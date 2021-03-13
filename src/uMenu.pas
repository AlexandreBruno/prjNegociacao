unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Menu: TMenu;

implementation

{$R *.dfm}

procedure TMenu.Sair1Click(Sender: TObject);
begin
    Close;
end;

end.
