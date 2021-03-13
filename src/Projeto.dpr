program Projeto;

uses
  Vcl.Forms,
  uMenu in 'uMenu.pas' {Menu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenu, Menu);
  Application.Run;
end.
