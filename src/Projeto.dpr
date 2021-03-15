program Projeto;

uses
  Vcl.Forms,
  uMenu in 'uMenu.pas' {Menu},
  uDataModulePrincipal in 'uDataModulePrincipal.pas' {DataModulePrincipal: TDataModule},
  uListaDistribuidores in 'uListaDistribuidores.pas' {ListaDistribuidores},
  UCadastroDistribuidores in 'UCadastroDistribuidores.pas' {CadastroDistribuidores},
  UCadastroProdutos in 'UCadastroProdutos.pas' {CadastroProdutos},
  uListaProdutos in 'uListaProdutos.pas' {ListaProdutos},
  UCadastroProdutores in 'UCadastroProdutores.pas' {CadastroProdutores},
  uListaProdutores in 'uListaProdutores.pas' {ListaProdutores},
  UCadastroProdutorCredito in 'UCadastroProdutorCredito.pas' {CadastroProdutorCredito},
  uListaNegociacao in 'uListaNegociacao.pas',
  UCadastroNegociacao in 'UCadastroNegociacao.pas',
  UCadastroNegociacaoItem in 'UCadastroNegociacaoItem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenu, Menu);
  Application.Run;
end.
