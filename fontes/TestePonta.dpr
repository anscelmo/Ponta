program TestePonta;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uCadFazenda in 'uCadFazenda.pas' {frmCadFazenda},
  uPesqFazenda in 'uPesqFazenda.pas' {frmPesqFazenda},
  uCadAnimal in 'uCadAnimal.pas' {frmCadAnimal},
  uPesqAnimal in 'uPesqAnimal.pas' {frmPesqAnimal},
  uRelatorio in 'uRelatorio.pas' {frmRelatorio},
  PreverU in 'Classes\frmPrever\PreverU.pas' {frmPrever},
  uCadAnimalLote in 'uCadAnimalLote.pas' {frmCadAnimalLote},
  SynPdf in 'Classes\Synopse\SynPdf.pas',
  SynGdiPlus in 'Classes\Synopse\SynGdiPlus.pas',
  SynZip in 'Classes\Synopse\SynZip.pas',
  SynCrypto in 'Classes\Synopse\SynCrypto.pas',
  SynLZ in 'Classes\Synopse\SynLZ.pas',
  SynCommons in 'Classes\Synopse\SynCommons.pas',
  SynTable in 'Classes\Synopse\SynTable.pas',
  uImportaExcel in 'uImportaExcel.pas' {frmImportaExcel},
  uImportaExcelExpl in 'uImportaExcelExpl.pas' {frmImportaExcelExpl};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
