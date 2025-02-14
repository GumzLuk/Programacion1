unit UCTFile;

interface
  uses SysUtils, Classes, Dialogs, UCCadena;

   type
      TModo=(lectura,escritura);
      TFile=class
        private
          Nombre:String;
          PF:TextFile;
        public
//procedimientos________________________________________________________________
          procedure open(mode:TModo);
          procedure cargarArchivo(lineas:TStrings);
          procedure setName(path:String);
          procedure elimPalArchivo(palabra:String);
          procedure Close;
          procedure saveLines(lineas:TStrings);
          procedure updateFile(Lineas:TStringList);
          procedure elimLineaTxt(LineaN : Word);
          procedure elimLineasVacias();
//funsiones_____________________________________________________________________
          function readLines():TStringList;
          function ListaToCadena(Lineas:TStrings):Cadena;
          function NroLineas():Word;
          function contarPalabras(l: TStrings): Word;
          function contarLineasVacias(l : TStrings):Word;
          function EsLineaVacia(Lineas : TStrings; pos : Word):boolean;
          function NroLineaNoVacia(Lineas : TStrings):Word;
      end;

implementation

{ TFile}

//procedimientos________________________________________________________________

procedure TFile.cargarArchivo(lineas: TStrings);
begin
  open(escritura);
  saveLines(lineas);
  CloseFile(PF);
end;

procedure TFile.Close;
begin
 CloseFile(PF);
end;

procedure TFile.setName(path: String);
begin
 Nombre:=path;
end;

procedure TFile.elimPalArchivo(palabra: String);
var
  CadenaF : Cadena;
  Lista : TStringList;
  i : Word;

begin
 Lista := TStringList.Create;
 CadenaF := Cadena.Create;
 Reset(PF);
 Lista.Assign(readLines);
 CloseFile(PF);
  for i := 0 to Lista.Count-1 do
    begin
      cadenaF.cargarTexto(Lista[i]);
      cadenaF.ElimTodaPalabra(palabra);
      Lista[i] := cadenaF.getCadena();
    end;
 Rewrite(PF);
 updateFile(Lista);
 CloseFile(PF);
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

procedure TFile.updateFile(Lineas: TStringList);
var
 i:Word;
begin
   for i := 0 to Lineas.count-1 do
    begin
      writeLn(PF,Lineas[i]);
    end;
end;

procedure TFile.elimLineaTxt(LineaN: Word); //INCOMPLETO
var
  Lista : TStringList;
  i : Word;
  Str : String;
begin
 Lista := TStringList.Create;
 Reset(PF);
 Lista.Assign(readLines);
 CloseFile(PF);
   for i := 0 to Lista.Count-1 do

end;

procedure TFile.elimLineasVacias; //INCOMPLETO
 var
   Lista : TStringList;
   CadenaL : Cadena;
   i : Word;
begin
 Lista := TStringList.Create;
 CadenaL := Cadena.Create;
 Reset(PF);
 Lista.Assign(readLines);
 CloseFile(PF);
 CadenaL := ListaToCadena(Lista);
 i := 0;
  while(i <= Lista.Count-1)do
   begin
     if(CadenaL.CantDPal = 0)then
   end;
end;

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

function TFile.ListaToCadena(Lineas: TStrings): Cadena;
var
  Cad : Cadena;
  i : Word;
begin
 Cad := Cadena.Create;
 i := 0;
   while(i <= Lineas.Count)do
    begin
      cad.adicionarTexto(Lineas[i]);
      i := i + 1;
    end;
 Result := Cad;
end;

function TFile.NroLineaNoVacia(Lineas: TStrings): Word;
 var
  cadenaX : Cadena;
  cont,i : Word;
begin
 cadenaX := Cadena.Create;
 cont := 0;
 i := 0;
  while(i < Lineas.Count)do
   begin
     if not(EsLineaVacia(Lineas,i))then
       cont := cont + 1;
     i := i + 1;
   end;
 Result := cont;
end;

function TFile.NroLineas: Word;
var
 nro : Word;
 Str : String;
begin
 nro := 0;
 Reset(PF);
   while(not Eof(PF))do
     begin
      ReadLn(PF,Str);
       if(not Eoln(PF))then
         nro := nro + 1;
     end;
  CloseFile(PF);
  Result := nro;
end;

function TFile.contarPalabras(l: TStrings): Word;
Var
  Cadenax : Cadena;
  i,cont : Word;
  str : String;
begin
 Cadenax := Cadena.Create;
 i := 0;
 cont := 0;
  while i<l.Count do
    Begin
     Cadenax.adicionarTexto(l[i]);
     i := i + 1;
    End;
     cont := cont + cadenax.CantDPal;
     ShowMessage(Cadenax.getCadena);
 Result := cont;
end;

function TFile.contarLineasVacias(l: TStrings): Word;
 var
  cont,i : Word;
  cadenaX : Cadena;
begin
 i := 0;
 cont := 0;
 cadenaX := Cadena.Create;
  while(i < l.Count)do
   begin
     cadenaX.cargarTexto(l[i]);
      if(cadenaX.CantDPal = 0)then
        cont := cont + 1;
     i := i + 1;
   end;
 Result := cont;
end;

function TFile.EsLineaVacia(Lineas: TStrings; pos: Word): boolean;
 var
  CadenaX : Cadena;
  Nro : Word;
begin
 CadenaX := Cadena.Create;
 CadenaX.cargarTexto(Lineas[pos]);
 if(CadenaX.CantDPal = 0)then
  Result := true
    else Result := false;
end;
 {
function ArchivoTexto.searchNumber(name: String; l: TStrings): String;
Var
    C : Cadena; j,i,t:Word;
    Pos,Nro : String;
begin
     C:=Cadena.Create;
     i:=0;Pos:='';

     while (i<l.Count)And(Pos='') do
     begin
         C.setStr(l[i]);t:=1;
         Nro:=C.nextWord(t);
         if C.nextWord(t)=name then
            Pos:=Nro;
     end;
     Result:=Pos;

end;


function ArchivoTexto.palMasRepetida(l: TStrings): String;
Var
  C : Cadena;S:String; i:Word;
Begin
     C:=Cadena.Create;
     i:=0;s:='';
     while (i<l.Count) do
     begin
         s:=s+' '+l[i]; i:=i+1;
     end;
     C.setStr(s);
     Result:=C.mostrepeatedWord;
end;

function ArchivoTexto.Sumar(l: TStrings): Real;
Var
   n : Real;i:Word;
begin
     i:=0;n:=0;
     while (i<l.Count) do
     Begin
           if Length(l[i])>0 then
              n:=n+StrToFloat(l[i]);
           i:=i+1;
     End;
     Result:=n;
end;

function ArchivoTexto.sumValues(l:TStrings): Real;
begin

end;

procedure ArchivoTexto.delWord(p: String;l:TStrings);
Var
    C : Cadena; j,i:Word;
begin
     C:=Cadena.Create;
     i:=0;
     while (i<l.Count) do
     begin
         C.setStr(l[i]);
         repeat
           j:=C.findWord(p);
           if j>0 then C.delWord(j,length(p))
         until j=0 ;
         l[i]:=C.getStr;
         i:=i+1;
     end;

end;

procedure ArchivoTexto.findandreplace(pb, pr: String;l:TStrings);
Var
    C : Cadena; j,i:Word;
begin
     C:=Cadena.Create;
     i:=0;
     while (i<l.Count) do
     begin
         C.setStr(l[i]);
         repeat
           j:=C.findWord(pb);
           if j>0 then
           begin
                C.delWord(j,length(pb));
                C.InsWord(j,pr);
           end;
         until j=0 ;
         l[i]:=C.getStr;
         i:=i+1;
     end;

end;

function ArchivoTexto.findWord(p: String;l:TStrings): String;
Var
    //R: TStringList;
    C : Cadena; j,i:Word;
    Pos : String;
begin
     C:=Cadena.Create;
     i:=0;Pos:='';
     //R:=readLines;
     while (i<l.Count)And(Pos='') do
     begin
         C.setStr(l[i]);
         j:=C.findWord(p);
         if j>0 then Pos:=IntToStr(i+1)+'-'+IntToStr(j);
         i:=i+1;
     end;
     Result:=Pos;
end;

procedure ArchivoTexto.mayuscula(l: TStrings);
Var
  C : Cadena;
  i : Word;
begin
     C:=Cadena.Create;
     i:=0;
     while (i<l.Count) do
     Begin
          C.setStr(l[i]);
          C.upperCase;
          l[i]:=C.getStr;
          i:=i+1;
     End;
end;

function ArchivoTexto.mostrepeatedWord(l: TStrings): String;
begin

end;
}
end.
