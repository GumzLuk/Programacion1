unit UnitFormTFile2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, UCTFile, UCCadena;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Archivo1: TMenuItem;
    Archivo2: TMenuItem;
    guardar1: TMenuItem;
    Procedimientos1: TMenuItem;
    Procedimientos2: TMenuItem;
    elimPalArchivo1: TMenuItem;
    ActualizarMemo1: TMenuItem;
    elimLineaTxt1: TMenuItem;
    NroLineas1: TMenuItem;
    contarPalabras1: TMenuItem;
    contarLineasvacias1: TMenuItem;
    CargarArchivo1: TMenuItem;
    NroLineaNoVacia1: TMenuItem;
    procedure Archivo2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure guardar1Click(Sender: TObject);
    procedure elimPalArchivo1Click(Sender: TObject);
    procedure ActualizarMemo();
    procedure ActualizarMemo1Click(Sender: TObject);
    procedure elimLineaTxt1Click(Sender: TObject);
    procedure NroLineas1Click(Sender: TObject);
    procedure contarPalabras1Click(Sender: TObject);
    procedure contarLineasvacias1Click(Sender: TObject);
    procedure CargarArchivo1Click(Sender: TObject);
    procedure NroLineaNoVacia1Click(Sender: TObject);
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

procedure TForm1.ActualizarMemo();
begin
 MFile.open(lectura);
 Memo1.Lines.Assign(MFile.readLines);
 MFile.Close;
end;

procedure TForm1.ActualizarMemo1Click(Sender: TObject);
begin
 ActualizarMemo();
end;

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

procedure TForm1.CargarArchivo1Click(Sender: TObject);
begin
 Mfile.cargarArchivo(Memo1.Lines);
end;

procedure TForm1.contarLineasvacias1Click(Sender: TObject);
begin
 ShowMessage(IntToStr(MFile.contarLineasVacias(Memo1.Lines)));
end;

procedure TForm1.contarPalabras1Click(Sender: TObject);
begin
 ShowMessage(IntToStr(MFile.contarPalabras(Memo1.Lines)));
end;

procedure TForm1.elimLineaTxt1Click(Sender: TObject);
 var
   n : Word;
begin
 n := StrToInt(InputBox('NUMERO','ingrese un numero',''));
 MFile.elimLineaTxt(n);
end;

procedure TForm1.elimPalArchivo1Click(Sender: TObject);
var
  palabra : String;
begin
 palabra := InputBox('PALABRA','ingrese una palabra','');
 MFile.elimPalArchivo(palabra);
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
      MFile.Close;
   end;
end;

procedure TForm1.NroLineaNoVacia1Click(Sender: TObject);
begin
 ShowMessage(IntTOStr(MFile.NroLineaNoVacia(Memo1.Lines)));
end;

procedure TForm1.NroLineas1Click(Sender: TObject);
begin
 ShowMessage(IntTOStr(MFile.NroLineas));
end;

end.
