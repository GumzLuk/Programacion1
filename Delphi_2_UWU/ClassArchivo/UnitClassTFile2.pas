unit UnitClassTFile2;

interface
  uses SysUtils,Classes,Dialogs,UClasCadena2;

   type
      TModo=(lectura,escritura);
      TFile=class
        private
          Nombre:String;
          PF:TextFile;
        public
//procedimientos________________________________________________________________
          procedure open(mode:TModo);
          procedure setName(path:String);
        //  procedure elimPalArchivo(pal:String;Lista:TString);
          procedure Close;
          procedure ColocarTxtEnCad(lineas:TStrings);
          procedure saveLines(lineas:TStrings);
         procedure ColocarCadEntxt(var cad:Cadena;Lineas:TStrings);

//funsiones_____________________________________________________________________
          function readLines():TStringList;


      end;

implementation

{ TFile }

//procedimientos________________________________________________________________

procedure TFile.Close;
begin
 CloseFile(PF);
end;

procedure TFile.setName(path: String);
begin
 Nombre:=path;
end;

procedure TFile.ColocarCadEntxt(var cad: Cadena;Lineas:TStrings);
var
  i:Word;
begin
 for i := 0 to 0 do
 lineas.Add(cad.getCadena);
end;

procedure TFile.ColocarTxtEnCad(lineas: TStrings);
var
 cad : cadena;
 i : word;
 pal : String;
begin
 cad := cadena.create();
 pal := '';
  for i := 0 to lineas.Count do
    pal := pal + lineas[i];
 cad.cargarTexto(pal);
end;

procedure TFile.open(mode: TModo);
begin
  AssignFile(PF,Nombre);
    case mode of
      lectura: Reset(PF);
      escritura: Rewrite(PF);
    end;
end;

procedure TFile.saveLines(lineas: TStrings);
 var
   s:String;
begin
  for s in lineas do
     Writeln(PF,s);
end;

{procedure TFile.elimPalArchivo(pal: String; Lista: TString);
 var
   c:Cadena;
   i:Word;
begin
 c:=cadena.create;
 i:=0;
   while()do
     begin
       c.setStr(Lista[i]);
       c.elimPal(pal);
       i:=i+1;
     end;
end;}

//funsiones_____________________________________________________________________

function TFile.readLines: TStringList;
 var
   s:String;
   Lineas:TStringList;
begin
  Lineas:=TStringList.Create;
   while NOT Eof(PF) do
    begin
       Readln(PF,s);
       Lineas.Add(s);
    end;

  Result:=Lineas;
end;

end.