program ProjectMatrizReal;

uses
  Vcl.Forms,
  UFormMatriz in 'UFormMatriz.pas' {Form1},
  UCMatrizReal in 'UCMatrizReal.pas',
  UCVector in 'UCVector.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
