program ProjectNumero;

uses
  Vcl.Forms,
  UFormNumero in 'UFormNumero.pas' {Form1},
  UCNumero in 'UCNumero.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
