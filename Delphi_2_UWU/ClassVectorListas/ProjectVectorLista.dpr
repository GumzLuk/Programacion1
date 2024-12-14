program ProjectVectorLista;

uses
  Vcl.Forms,
  UFormLista in 'UFormLista.pas' {Form1},
  UCVectorLista in 'UCVectorLista.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
