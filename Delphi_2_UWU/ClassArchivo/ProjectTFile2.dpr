program ProjectTFile2;

uses
  Vcl.Forms,
  UnitFormTFile2 in 'UnitFormTFile2.pas' {Form1},
  UnitClassTFile2 in 'UnitClassTFile2.pas',
  UClasCadena2 in 'UClasCadena2.pas',
  UnitClasNumero in 'UnitClasNumero.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.