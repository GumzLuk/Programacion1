program ProjectVStr;

uses
  Vcl.Forms,
  UFormVStr in 'UFormVStr.pas' {Form1},
  UCVectStr in 'UCVectStr.pas',
  UCCadena in 'UCCadena.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
