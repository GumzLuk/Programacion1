unit UnitFormTFile2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, UnitClassTFile2,UnitClassCadena;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Archivo1: TMenuItem;
    Archivo2: TMenuItem;
    guardar1: TMenuItem;
    Colocarcadenaentxt1: TMenuItem;
    procedure Archivo2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure guardar1Click(Sender: TObject);
    procedure Colocarencadena1Click(Sender: TObject);
    procedure Colocarcadenaentxt1Click(Sender: TObject);
  private
    { Private declarations }
    MFile:TFile;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Archivo2Click(Sender: TObject);
 var
   lineas:TStringList;
begin
   if OpenDialog1.Execute then
      begin
        MFile.setName(OpenDialog1.FileName);
        MFile.open(lectura);
        lineas:=MFile.readLines;
        Memo1.Lines.Assign(lineas);
        Mfile.Close;
      end;
end;

procedure TForm1.Colocarcadenaentxt1Click(Sender: TObject);
 var
   cad:Cadena;
begin
cad:=cadena.crear;
cad.cargarCad('Hola........sdff');
MFile.ColocarCadEntxt(cad,Memo1.Lines);
end;

procedure TForm1.Colocarencadena1Click(Sender: TObject);
begin
Mfile.ColocarTxtEnCad(Memo1.Lines);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 MFile:=TFile.Create;
end;

procedure TForm1.guardar1Click(Sender: TObject);
begin
 if SaveDialog1.Execute then
   begin
      MFile.setName(SaveDialog1.FileName);
      MFile.open(escritura);
      MFile.saveLines(memo1.Lines);
      MFile.Close
   end;
end;

end.