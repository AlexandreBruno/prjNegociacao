program Projeto;

uses
  Vcl.Forms,
  uMenu in 'uMenu.pas' {Menu},
  uDataModulePrincipal in 'uDataModulePrincipal.pas' {DataModulePrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenu, Menu);
  Application.CreateForm(TDataModulePrincipal, DataModulePrincipal);
  Application.Run;
end.
