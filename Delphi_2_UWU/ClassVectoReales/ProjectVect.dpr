program ProjectVect;

uses
  Vcl.Forms,
  FormVect in 'FormVect.pas' {Form1},
  UCVector in 'UCVector.pas',
  UCNumero in 'UCNumero.pas',
  UCCadena in 'UCCadena.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.