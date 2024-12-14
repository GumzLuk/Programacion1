program ProjectSokoban;

uses
  Vcl.Forms,
  UFormSokoban in 'UFormSokoban.pas' {FormSOKOBAN},
  UCFigura in 'UCFigura.pas',
  UCLNiveles in 'UCLNiveles.pas',
  UCLMuro in 'UCLMuro.pas',
  UCCaja in 'UCCaja.pas',
  UCVector in 'UCVector.pas',
  UCNumero in 'UCNumero.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSOKOBAN, FormSOKOBAN);
  Application.Run;
end.
