unit uListaNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, Data.Win.ADODB, Datasnap.Provider,
  Datasnap.DBClient, frxDBSet;

type
  TListaNegociacao = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EditProcurar: TEdit;
    Label2: TLabel;
    ComboCampos: TComboBox;
    ComboOrdem: TComboBox;
    Label3: TLabel;
    Panel2: TPanel;
    ButtonAprovar: TButton;
    ButtonConcluir: TButton;
    ButtonCancelar: TButton;
    RelatorioDBDataset: TfrxDBDataset;
    RelatorioClientDataSet: TClientDataSet;
    RelatorioProvider: TDataSetProvider;
    Relatorio: TfrxReport;
    QueryRelatorio: TFDQuery;
    QueryRelatorioCODIGONEGOCIACAO: TIntegerField;
    QueryRelatorioVALORNEGOCIACAO: TFMTBCDField;
    QueryRelatorioNOMEPRODUTOR: TStringField;
    QueryRelatorioNOMEDISTRIBUIDOR: TStringField;
    QueryRelatorioDATACADASTRO: TDateField;
    QueryRelatorioDATASTATUS: TDateField;
    QueryRelatorioSTATUS: TStringField;
    Button1: TButton;
    RelatorioClientDataSetCODIGONEGOCIACAO: TIntegerField;
    RelatorioClientDataSetVALORNEGOCIACAO: TFMTBCDField;
    RelatorioClientDataSetNOMEPRODUTOR: TStringField;
    RelatorioClientDataSetNOMEDISTRIBUIDOR: TStringField;
    RelatorioClientDataSetDATACADASTRO: TDateField;
    RelatorioClientDataSetDATASTATUS: TDateField;
    RelatorioClientDataSetSTATUS: TStringField;
    procedure EditProcurarExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonAprovarClick(Sender: TObject);
    procedure ButtonConcluirClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure IncluirClick(Sender: TObject);
    procedure AlterarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
  end;

var
  ListaNegociacao: TListaNegociacao;

implementation

{$R *.dfm}

uses uDataModulePrincipal, UCadastroNegociacao;

procedure TListaNegociacao.IncluirClick(Sender: TObject);
begin
    DataModulePrincipal.QueryNegociacao.Close;
    DataModulePrincipal.QueryNegociacao.Params[0].Value := -1;
    DataModulePrincipal.QueryNegociacao.Open;
    DataModulePrincipal.QueryNegociacao.Append;
    DataModulePrincipal.QueryNegociacaoID.Value := -1;

    TCadastroNegociacao.Create(Self);
end;

procedure TListaNegociacao.AlterarClick(Sender: TObject);
begin
    if not DataModulePrincipal.QueryListaNegociacao.IsEmpty then
    begin
        DataModulePrincipal.QueryNegociacao.Close;
        DataModulePrincipal.QueryNegociacao.Params[0].Value := DataModulePrincipal.QueryListaNegociacaoID.Value;
        DataModulePrincipal.QueryNegociacao.Open;
        DataModulePrincipal.QueryNegociacao.Edit;

        TCadastroNegociacao.Create(Self);
    end;
end;

procedure TListaNegociacao.ExcluirClick(Sender: TObject);
begin
    if not DataModulePrincipal.QueryListaNegociacao.IsEmpty then
    begin
        if MessageDlg('Tem certeza que deseja Excluir?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = 6 then
        begin
            DataModulePrincipal.QueryNegociacao.Close;
            DataModulePrincipal.QueryNegociacao.Params[0].Value := DataModulePrincipal.QueryListaNegociacaoID.Value;
            DataModulePrincipal.QueryNegociacao.Open;
            DataModulePrincipal.QueryNegociacao.Delete;
            DataModulePrincipal.QueryNegociacao.ApplyUpdates(0);
            DataModulePrincipal.QueryNegociacao.Close;
            FormActivate(Sender);
        end;
    end;
end;

procedure TListaNegociacao.Button1Click(Sender: TObject);
var
    select, where, ordem: string;
begin
    select := ' select a.id CodigoNegociacao,  a.valor ValorNegociacao, b.nome NomeProdutor, c.nome NomeDistribuidor, a.data DataCadastro, a.data DataStatus, a.Status from negociacao a'
    +' inner join produtor b on b.id = a.id_produtor'
    +' inner join distribuidor c on c.id = a.id_distribuidor ';

    where := ' WHERE ';
    if ComboCampos.ItemIndex = 0 then
        where := where+' a.ID '
    else if ComboCampos.ItemIndex = 1 then
        where := where+' a.STATUS '
    else if ComboCampos.ItemIndex = 2 then
        where := where+' a.ID_PRODUTOR '
    else
        where := where+' a.ID_DISTRIBUIDOR ';
    where := where+' LIKE '+QuotedStr('%'+EditProcurar.Text+'%');

    ordem := ' ORDER BY ';
    if ComboOrdem.ItemIndex = 0 then
        ordem := ordem+' a.ID '
    else if ComboOrdem.ItemIndex = 1 then
        ordem := ordem+' a.STATUS, a.ID '
    else if ComboOrdem.ItemIndex = 2 then
        ordem := ordem+' a.ID_PRODUTOR, a.ID '
    else
        ordem := ordem+' a.ID_DISTRIBUIDOR, a.ID ';
    QueryRelatorio.SQL.Text := select + where + ordem;
    QueryRelatorio.Close;
    QueryRelatorio.Open;

    Relatorio.ShowReport(true);
end;

procedure TListaNegociacao.ButtonAprovarClick(Sender: TObject);
begin
    if ((not DataModulePrincipal.QueryListaNegociacao.IsEmpty) and (DataModulePrincipal.QueryListaNegociacaoSTATUS.AsString = 'Pendente')) then
    begin
        if MessageDlg('Tem certeza que deseja Aprovar?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = 6 then
        begin
            DataModulePrincipal.QueryNegociacao.Close;
            DataModulePrincipal.QueryNegociacao.Params[0].Value := DataModulePrincipal.QueryListaNegociacaoID.Value;
            DataModulePrincipal.QueryNegociacao.Open;
            DataModulePrincipal.QueryNegociacao.Edit;
            DataModulePrincipal.QueryNegociacaoSTATUS.Value := 'Aprovada';
            DataModulePrincipal.QueryNegociacaoDATASTATUS.Value := Date;
            DataModulePrincipal.QueryNegociacao.Post;
            DataModulePrincipal.QueryNegociacao.ApplyUpdates(0);
            DataModulePrincipal.QueryNegociacao.Close;
            FormActivate(Sender);
        end;
    end;
end;

procedure TListaNegociacao.ButtonCancelarClick(Sender: TObject);
begin
    if ((not DataModulePrincipal.QueryListaNegociacao.IsEmpty) and (DataModulePrincipal.QueryListaNegociacaoSTATUS.AsString = 'Pendente')) then
    begin
        if MessageDlg('Tem certeza que deseja Cancelar?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = 6 then
        begin
            DataModulePrincipal.QueryNegociacao.Close;
            DataModulePrincipal.QueryNegociacao.Params[0].Value := DataModulePrincipal.QueryListaNegociacaoID.Value;
            DataModulePrincipal.QueryNegociacao.Open;
            DataModulePrincipal.QueryNegociacao.Edit;
            DataModulePrincipal.QueryNegociacaoSTATUS.Value := 'Cancelada';
            DataModulePrincipal.QueryNegociacaoDATASTATUS.Value := Date;
            DataModulePrincipal.QueryNegociacao.Post;
            DataModulePrincipal.QueryNegociacao.ApplyUpdates(0);
            DataModulePrincipal.QueryNegociacao.Close;
            FormActivate(Sender);
        end;
    end;
end;

procedure TListaNegociacao.ButtonConcluirClick(Sender: TObject);
begin
    if ((not DataModulePrincipal.QueryListaNegociacao.IsEmpty) and (DataModulePrincipal.QueryListaNegociacaoSTATUS.AsString = 'Pendente')) then
    begin
        if MessageDlg('Tem certeza que deseja Concluir?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = 6 then
        begin
            DataModulePrincipal.QueryNegociacao.Close;
            DataModulePrincipal.QueryNegociacao.Params[0].Value := DataModulePrincipal.QueryListaNegociacaoID.Value;
            DataModulePrincipal.QueryNegociacao.Open;
            DataModulePrincipal.QueryNegociacao.Edit;
            DataModulePrincipal.QueryNegociacaoSTATUS.Value := 'Concluir';
            DataModulePrincipal.QueryNegociacaoDATASTATUS.Value := Date;
            DataModulePrincipal.QueryNegociacao.Post;
            DataModulePrincipal.QueryNegociacao.ApplyUpdates(0);
            DataModulePrincipal.QueryNegociacao.Close;
            FormActivate(Sender);
        end;
    end;
end;

procedure TListaNegociacao.DBGrid1DblClick(Sender: TObject);
begin
    AlterarClick(Sender);
end;

procedure TListaNegociacao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TListaNegociacao.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if (ActiveControl is TDBGrid) then
        Key := #0;
    if (Key = #13) then
        Key := #0;
end;

procedure TListaNegociacao.EditProcurarExit(Sender: TObject);
var
    where, ordem: string;
begin
    DataModulePrincipal.QueryListaNegociacao.Close;
    DataModulePrincipal.QueryListaNegociacao.SQL.Clear;
    DataModulePrincipal.QueryListaNegociacao.SQL.Text := 'SELECT * FROM NEGOCIACAO ';

    where := ' WHERE ';
    if ComboCampos.ItemIndex = 0 then
        where := where+' ID '
    else if ComboCampos.ItemIndex = 1 then
        where := where+' STATUS '
    else if ComboCampos.ItemIndex = 2 then
        where := where+' ID_PRODUTOR '
    else
        where := where+' ID_DISTRIBUIDOR ';
    where := where+' LIKE '+QuotedStr('%'+EditProcurar.Text+'%');

    ordem := ' ORDER BY ';
    if ComboOrdem.ItemIndex = 0 then
        ordem := ordem+' ID '
    else if ComboOrdem.ItemIndex = 1 then
        ordem := ordem+' STATUS '
    else if ComboOrdem.ItemIndex = 2 then
        ordem := ordem+' ID_PRODUTOR '
    else
        ordem := ordem+' ID_DISTRIBUIDOR ';

    DataModulePrincipal.QueryListaNegociacao.SQL.Add(where);
    DataModulePrincipal.QueryListaNegociacao.SQL.Add(ordem);

    DataModulePrincipal.QueryListaNegociacao.Open;
    DataModulePrincipal.QueryListaNegociacao.First;
end;

procedure TListaNegociacao.FormActivate(Sender: TObject);
begin
    WindowState := wsMaximized;
    EditProcurarExit(Sender);
end;

procedure TListaNegociacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
