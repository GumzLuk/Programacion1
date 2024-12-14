program ProjectMatrizChars;

uses
  Vcl.Forms,
  UFormMatrizChars in 'UFormMatrizChars.pas' {Form1},
  UCMatrizChars in 'UCMatrizChars.pas',
  UCCadena in 'UCCadena.pas',
  UCNumero in 'UCNumero.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
