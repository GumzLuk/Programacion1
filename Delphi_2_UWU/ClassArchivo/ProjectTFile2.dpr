program ProjectTFile2;

uses
  Vcl.Forms,
  UnitFormTFile2 in 'UnitFormTFile2.pas' {Form1},
  UCTFile in 'UCTFile.pas',
  UCNumero in 'UCNumero.pas',
  UCCadena in 'UCCadena.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
