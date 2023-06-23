unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFuncoes, Menus, ComCtrls, ExtCtrls, StdCtrls, Buttons, jpeg,
  uCadFazenda, uCadAnimal, uCadAnimalLote, uRelatorio, uImportaExcel;

type
  TfrmPrincipal = class(TForm)
    pnlImagem: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    btCadastro: TBitBtn;
    pnlRelatorio: TPanel;
    btRelatorio: TBitBtn;
    Panel5: TPanel;
    btnImportarExcel: TBitBtn;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    PopupCadastro: TPopupMenu;
    Fazenda1: TMenuItem;
    Animal1: TMenuItem;
    AnimalLLote1: TMenuItem;
    PopupRelatorio: TPopupMenu;
    Visualizar1: TMenuItem;
    GerarPDF1: TMenuItem;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btCadastroClick(Sender: TObject);
    procedure Fazenda1Click(Sender: TObject);
    procedure Animal1Click(Sender: TObject);
    procedure btRelatorioClick(Sender: TObject);
    procedure AnimalLLote1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure GerarPDF1Click(Sender: TObject);
    procedure btnImportarExcelClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Conectar;
  Desconectar;
end;

procedure TfrmPrincipal.btCadastroClick(Sender: TObject);
begin
  PopupCadastro.Popup(Self.Left + btCadastro.Left + 10, Self.Top + 20 + btCadastro.Top + (btCadastro.Height * 1) + 10);
end;

procedure TfrmPrincipal.Fazenda1Click(Sender: TObject);
begin
  frmCadFazenda := TfrmCadFazenda.Create(Self);
  frmCadFazenda.ShowModal;
  frmCadFazenda.Free;
end;

procedure TfrmPrincipal.Animal1Click(Sender: TObject);
begin
  frmCadAnimal := TfrmCadAnimal.Create(Self);
  frmCadAnimal.ShowModal;
  frmCadAnimal.Free;
end;

procedure TfrmPrincipal.btRelatorioClick(Sender: TObject);
begin
  PopupRelatorio.Popup(Self.Left + pnlRelatorio.Left + 10, pnlRelatorio.Top + 20 + (pnlRelatorio.Height * 1) + 10);
end;

procedure TfrmPrincipal.AnimalLLote1Click(Sender: TObject);
begin
  frmCadAnimalLote := TfrmCadAnimalLote.Create(Self);
  frmCadAnimalLote.ShowModal;
  frmCadAnimalLote.Free;
end;

procedure TfrmPrincipal.Visualizar1Click(Sender: TObject);
begin
  frmRelatorio := TfrmRelatorio.Create(Self);
  frmRelatorio.QuickRep1.Preview;
  frmRelatorio.Free;
end;

procedure TfrmPrincipal.GerarPDF1Click(Sender: TObject);
var
  NomeRel: String;
begin
  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Relatorios') then
    ForceDirectories(ExtractFilePath(Application.ExeName) + 'Relatorios');
  NomeRel := ExtractFilePath(Application.ExeName) + 'Relatorios\Relat_' + FormatDateTime('yyyymmdd_hhmmsszzz', Now) + '.pdf';
  frmRelatorio := TfrmRelatorio.Create(Self);
  GerarPDF(frmRelatorio.QuickRep1, NomeRel);
  Application.MessageBox(pchar('Relatório gerado com sucesso em: ' + #13 + #13 + '-> ' + NomeRel),
                         pchar('Aviso'), MB_ICONEXCLAMATION + MB_OK);
  frmRelatorio.Free;
end;

procedure TfrmPrincipal.btnImportarExcelClick(Sender: TObject);
begin
  frmImportaExcel := TfrmImportaExcel.Create(Self);
  frmImportaExcel.ShowModal;
  frmImportaExcel.Free;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[2].Text := FormatDateTime('dd/mm/yyyy',Date);
  StatusBar1.Panels.Items[3].Text := FormatDateTime('hh:mm:ss',Now);
end;

end.
