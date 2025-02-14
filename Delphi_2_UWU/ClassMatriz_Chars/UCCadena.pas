unit UCCadena;

 interface

Uses Dialogs,SysUtils,UCNumero,Math;
const MAXE = 1000;
      VOCALES = ['A','E','I','O','U'];
      CONSO = ['A'..'Z'] - VOCALES;
      SEP_ = [',',':',';','(',')',' '];
      NU = ['0','1','2','3','4','5','6','7','8','9'];

Type
  Cadena = Class
    private
      longitud : Cardinal;
      caracteres : array[1..MAXE] of char;

    public
   //Procedimiento______________________________________________________________
        procedure setLong( nuevaL : Cardinal);
        procedure modChar(p:Cardinal ; chr:Char);
        procedure ElimChar(pos:Cardinal);
        procedure insertChar(p:Cardinal ; Chr:Char);
        procedure cargarTexto(tex:String);
        procedure adicionarTexto(Text:String);
        procedure insertPal(posPal : Word; pal:String);
        procedure addPalDerecha(pal : String);
        procedure addPalIzquierda(pal : String);
        procedure moverPosX(posI:Cardinal; NroDPosMv : word);
        procedure ordenarXOrdAlfabetico();
        procedure elimXPos(pos:Word);
        procedure elimPosiciones(posiciones:Cardinal);
        procedure modPalabraXPos(posPal:Word ; pal:String);
        procedure ElimCharsXPos(posIni:Cardinal;posFin:Cardinal);
        procedure IntercambiarPosDPal(posA:Word;posB:Word);
        procedure ElimTodaPalabra(palabra:String);
    //Funcion___________________________________________________________________

        function getLong ():Cardinal;
        function getPosChr(p:Cardinal):Char;
        function getCadena():String;
        function nroDeVocales():Cardinal;
        function CantDPal():Word;
        function nroDePalFinVocal():Word;
        function nroDePalInicConso():Word;
        function nroDePalInicEFinCOnso():Word;
        function getPalSig(var pos:Cardinal):String;
        function getPalXPos(posPal:Word):String;
        function FrecDePalabra(palabra:String):Word;
        function busqDePalabra(palabra:String):Word; overload ;
        function busqDePalabra(palabra:String ; var posA:Word):Word; overload;
        function LimpPalXInput(Pal:String):String;
        function nroDVocalEnStr(str:String):Word;
        function palDMenorOrdAlfabet():String;
        function examVerificar():Cardinal;
        function EsUnNumero(palNum:String):boolean;
        function GetDia(pal: String): byte;
        function GetMes(pal: String): byte;
        function GetYear(pal: String): Word;
        function FechaMax: String;
        function NroDVocalEnPal(Pal:String):Word;
        function EstaLaSubCad(pal:String ; subCad:String):boolean;
        function SubCadXPos(pal:String ;posIni:Cardinal ; posFin:Cardinal):String;
        function PosDePalConSubCad(subCad:String):Word;
        function getHora(tiempo:String):Word;
        function probarLongitud(posPal:Word):Word;
        function MayPosPal():Word;
        function examen4(Npos:Word):String;
        function longitudMay():Word;
        function IgualLong(posPal:Word):Word;
        function alterar(n:Word):String;
        function posComoNumero():Cardinal;
        function MayXLongParametros(n:Cardinal):word;
        function MayXAlfabetParametros(n:Cardinal):Word;
        function Examen5(Nums:String;redon:byte):CArdinal;
        function SacarFracc(N:String):Cardinal;
        function SonDeIgualesLong():boolean;
        function ObtMezclaRequerida(palabraUt, palabraReqda: String): boolean;

  End;
implementation
{ Cadena
}

//SETTERS_______________________________________________________________________

procedure Cadena.cargarTexto(tex: String);
var i:Cardinal;
begin

setLong(tex.Length);
 for i:=1 to tex.Length do
   begin
     caracteres[i] := tex[i];
   end;
end;

procedure Cadena.setLong(nuevaL: Cardinal);
begin

 if((nuevaL>=0) AND (nuevaL<=MAXE))then begin
   longitud := nuevaL;
 end
  else raise Exception.Create('Error en pararametros x>0 o x<=1000');
end;

procedure Cadena.ElimChar(pos: Cardinal);
var i:Cardinal;
begin
  if((pos>0) AND (pos<=longitud))then begin
      for i := pos to getLong-1 do
        begin
          caracteres[i] := caracteres[i+1]
        end;
    setLong(getLong-1)
  end
    else raise Exception.Create('Error posicion invalida');
end;

procedure Cadena.ElimCharsXPos(posIni, posFin: Cardinal);
begin
if(posFin > 0)AND(posFin <= longitud)AND(posIni > 0)AND(posIni <= longitud)then
 begin
  while(posFin >= posIni)do
   begin
     ElimChar(posFin);
     posFin := posFin - 1;
   end;
 end else raise Exception.Create('Error posiciones invalidas');
end;


procedure Cadena.elimPosiciones(posiciones: Cardinal);
var pos:byte;
   Num :Numero;
begin
  num := Numero.Create;
  num.setValor(posiciones);
  num.ordenDescendente;
  posiciones := num.getValor;
 while(posiciones > 0)do
  begin
    pos := posiciones mod 10;
    ElimChar(pos);
    posiciones := posiciones div 10;
  end;
end;

procedure Cadena.elimXPos(pos: Word);
var i:Word;
   posi,j,conj,rpal:Cardinal;
   Num : Numero;
   pal:String;
begin
 Num := Numero.create;
 i := 1;
 posi := 1;
 conj := 0;
   while(i <= pos)do
     begin
        pal := getPalSig(posi);
        j := posi - 1;
         if(i = pos)then
          begin
           rpal := pal.Length;
            while(rpal > 0)do
             begin
               Num.conjPosiciones(conj,j);
               rpal := rpal - 1;
               j := j - 1;
             end;
           end;
        i := i + 1;
     end;
   elimPosiciones(conj);
end;

procedure Cadena.insertChar(p: Cardinal; Chr: Char);
var
  i:Cardinal;
begin

 if((p>0) AND (p<=longitud))then begin
   setLong(getLong+1);
   i:=getLong;

     while (not(i = p)) do
       begin
         caracteres[i]:=caracteres[i-1];
         Dec(i);
       end;
   caracteres[p] := chr
 end
   else raise Exception.Create('Error posicion invalida');

end;

procedure Cadena.insertPal(posPal: Word; pal:String);
 var posi,r,j:Cardinal;
     i:Word;
begin
 if(posPal > 0)AND(posPal <= CantDPal)then
  begin
    posi := 1;
    i := 1;
    if(posPal = CantDPal)then
       setLong(getLong+1);
     while(i<=CantDPal)do
       begin
         if(i = posPal)then
            begin
              moverPosX(posi,pal.Length+2);
              r := posi+1;
              j := 1;
                while(j<=pal.Length)do
                  begin
                     caracteres[r] := pal[j];
                     r := r + 1;
                     j := j + 1;
                  end;

            end;
         getPalSig(posi);
         i := i + 1;
       end;
  end else raise Exception.Create('Error posicion invalida');
end;

procedure Cadena.IntercambiarPosDPal(posA, posB: Word);
var Rpal:String;
begin
 if(posA > 0)AND(posB >0)AND(posA <= CantDPal)AND(posB <= CantDPal)then
  begin
    Rpal := getPalXPos(posA);
    modPalabraXPos(posA,getPalXPos(posB));
    modPalabraXPos(posB,Rpal);
  end else raise Exception.Create('Error posiciones invalidas');
end;

procedure Cadena.modPalabraXPos(posPal: Word ; pal:String);
var i:Word;
    c,posM:Cardinal;
    palR:String;
begin
  if(posPal > 0)AND(posPal <= CantDPal)then
   begin
    i := 1;
    c := 1;
       while(i <= posPal)do
         begin
           palR := getPalSig(c);
           i := i + 1;
         end;
    posM := c - palR.Length;
    if(pal.Length <= palR.Length)then
     begin
      for i := 1 to pal.Length do
        begin
          caracteres[posM] := pal[i];
          posM := posM + 1;
        end;
      if(pal.Length < palR.Length)then
        begin
         ElimCharsXPos(posM,posM - 1 + (palR.Length-pal.Length));
        end;
     end;

     if(pal.Length > palR.Length)then
      begin
        for i := 1 to pal.Length do
           begin
             if(i > palR.Length)then
              begin
                moverPosX(posM,1);
                caracteres[posM] := pal[i];
              end else caracteres[posM] := pal[i];
             posM := posM + 1;
           end;
      end;
   end else raise Exception.Create('Error posicion invalida');
end;

procedure Cadena.addPalDerecha(pal: String);
var i,e:Cardinal;
    pal2 : String;
begin

 setLong(getLong+1);
 i := getLong;
 caracteres[i] := ' ';
 pal2 := LimpPalXInput(pal);
 setLong(getLong+pal2.Length);
 e := 1;
 i := i + 1;
   while(i<=getLong)do begin
     caracteres[i] := pal2[e];
     Inc(i);
     Inc(e);
   end;
end;

procedure Cadena.modChar(p: Cardinal; chr: Char);
begin

  if((p>0) AND (p<=longitud))then begin
    caracteres[p]:=chr
  end
    else raise Exception.Create('Error posicion invalida');

end;

procedure Cadena.moverPosX(posI: Cardinal; NroDPosMv: word);
var i,j,longClon: Cardinal;
    chr : char;
begin
    longClon := getLong;
    setLong(getLong+NroDPosMv);
    i := 1;
     while(i<=NroDposMv )do
      begin
      j := longClon+1;
        while(j>posI)do
          begin
            caracteres[j] := caracteres[j-1];
             Dec(j);
          end;
        caracteres[posI] := ' ';
        Inc(i);
        longClon := longClon + 1;
      end;
end;

procedure Cadena.addPalIzquierda(pal: String);
var
  i:Cardinal;
begin
 moverPosX(1,pal.Length+1);
  for i := 1 to pal.Length do
    begin
      caracteres[i] := pal[i];
    end;
end;

procedure Cadena.adicionarTexto(Text: String);
 var
   i,j : Word;
begin
 i := longitud + 1;
 longitud := longitud + Text.Length;
 j := 1;
  while(i <= longitud)do
   begin
     caracteres[i] := Text[j];
     j := j + 1;
     i := i + 1;
   end;
end;

procedure Cadena.ordenarXOrdAlfabetico;
var i,posM,posPal:Word;
    N:Numero;
begin
 N := Numero.Create;
 N.setValor(posComoNumero);
 i := CantDPal;
  while(i > 0)do
   begin
    posM := MayXAlfabetParametros(N.getValor);
    IntercambiarPosDPal(i,posM);
    ShowMessage(inttostr(N.getValor));
    N.delDigit(1);
    i := i - 1;
   end;
end;

procedure Cadena.ElimTodaPalabra(palabra: String);
var
   i : Word;
begin
 i := 1;
  while(i <= CantDPal())AND(FrecDePalabra(palabra) > 0)do
    begin
      if(UpperCase(getPalXPos(i))= UpperCase(palabra))then
          modPalabraXPos(i,'')
              else i := i + 1;
    end;
end;

//GETTERS_______________________________________________________________________

function Cadena.getLong: Cardinal;
begin
  Result := longitud;
end;

function Cadena.getCadena: String;
var
  tex:String;
  var i:Cardinal;
begin
 tex := '';
  for i:=1 to getLong() do
   begin
     tex:=tex+caracteres[i];
   end;
 Result := tex;
end;

function Cadena.CantDPal: Word;
var
 i:Cardinal;
 nro:Word;
begin
 nro := 0;
 i:=1;
 if(getLong > 0)then begin
  while(i<=getLong-1)do
   begin
     if(NOT(caracteres[i] in SEP_) AND (caracteres[i+1] in SEP_))then
         Inc(nro);
    Inc(i);
   end;
  if NOT(caracteres[i] in SEP_)then
     Inc(nro);
 Result:=nro;
 end else raise Exception.Create('Error de longitud');
end;

function Cadena.getPosChr(p: Cardinal): Char;
begin
//  if((p>0) AND (p<=longitud))then begin
    Result := caracteres[p]
  //end
 //   else raise Exception.Create('Error posicion invalida');
end;

function Cadena.getPalXPos(posPal: Word): String;
var pal:String;
    cont:Word;
    pos:Cardinal;
begin
  if(posPal>0)AND(posPal<=CantDPal)then
    begin
      cont := 1;
      pos := 1;
       while(cont <= PosPal)do
         begin
           pal := '';
           pal := getPalSig(pos);
           cont := cont + 1;
         end;
        Result := pal;
    end else raise Exception.Create('Error posicion invalida');
end;

function Cadena.getPalSig(var pos: Cardinal): String;
 var Pal:String;
begin

 if(pos>0)AND(pos<=getLong)then begin
  pal := '';
  while(pos<=getLong)AND(caracteres[pos] in SEP_)do pos := pos+1;
  while(pos<=getLong)AND NOT(caracteres[pos] in SEP_)do
    begin
      pal := pal + caracteres[pos];
      pos := pos+1;
    end;
 end;
 Result := pal;

end;

function Cadena.nroDePalFinVocal: Word;
var cont,i:Word;
    palr:String;
begin
if(CantDPal > 0)then begin
  cont := 0;
  i := 1;
   while(i <= CantDPal)do
     begin
       palr := getPalXPos(i);
        if(UpCase(palr[palr.Length]) in VOCALES)then
            cont := cont + 1;
        i := i + 1;
     end;
  Result:=cont;
 end else raise Exception.Create('Error cantDPal < 1');
end;

function Cadena.nroDePalInicConso: Word;
 var nro:Word;
     i:Cardinal;
     p,q,s:Boolean;
begin
 nro := 0;
 i := 1;
 p := (UpCase(caracteres[1]) in CONSO);
 q := false;
 s := false;
 while(i <= getLong-1)do
   begin
    q := (UpCase(caracteres[i+1]) in CONSO);
    s := (caracteres[i] in SEP_);
      if((p) OR (s AND q))then begin
           Inc(nro);
      end;
     q := false;
     s := false;
     p := false;
     Inc(i);
   end;
 Result:=nro;
end;

function Cadena.nroDePalInicEFinCOnso: Word;
var
  i,cont:Word;
  palr:String;
begin
 i := 1;
 cont := 0;
  while(i <= CantDPal)do
   begin
    palr := getPalXPos(i);
     if(UpCase(palr[1]) in CONSO)AND(UpCase(palr[palr.Length]) in CONSO)then
         cont := cont + 1;
     i := i + 1;
   end;
 Result := cont;
end;

function Cadena.nroDeVocales: Cardinal;
 var con,i:Cardinal;
begin
 con := 0;
   for i := 1 to getLong() do
      begin
        if(UpCase(caracteres[i]) in VOCALES) then
           con := con+1;
      end;
 Result := con;
end;

function Cadena.NroDVocalEnPal(Pal: String): Word;
var
  cont,i:Word;
begin
i := 1;
 while(i <= pal.Length)do
  begin
    if(UpCase(pal[i]) in VOCALES)then
      cont := cont + 1;
    i := i + 1;
  end;
  Result := cont;
end;

function Cadena.nroDVocalEnStr(str: String): Word;
var i,cont:Word;
begin
 i := 1;
 cont := 0;
  while(i <= str.Length)do
    begin
      if(UpCase(str[i]) in VOCALES)then
         cont := cont + 1;
      i := i + 1;
    end;
  Result := cont;
end;

function Cadena.LimpPalXInput(Pal: String): String;
var i : word;
    palr : String;
begin
i := 1;
palr := '';
 while(i<=pal.Length)AND(pal[i] in SEP_)do Inc(i);
 while(i<=pal.Length)AND NOT(pal[i] in SEP_)do
   begin
     palr := palr + pal[i];
     Inc(i);
   end;
 Result := palr;
end;

function Cadena.palDMenorOrdAlfabet: String;
 var i,PosPalMen:Word;
     palMen,pr:String;
begin
 i := 1;
 PosPalMen := 1;
 palMen := getPalXPos(1);
  while(i <= CantDPal)do
    begin
     pr := getPalXPos(i);
      if(palmen[1] > Pr[1])then
          palmen := pr;
     i := i + 1;
    end;
  Result := palMen;
end;

function Cadena.EstaLaSubCad(pal, subCad: String): boolean;
var i:Word;
   SubC:String;
   q:boolean;
begin
 i := 1;
 q := false;
  while(i <= pal.Length)do
    begin
     subC :='';
      if((i+subCad.Length-1)<=pal.Length)then  begin
       subC := SubCadXPos(pal,i,i+subCad.Length-1);
      end;
      if(subC = subCad)then q := true;
     i := i + 1;
    end;
 Result := q;
end;

function Cadena.SubCadXPos(pal:String ; posIni, posFin: Cardinal): String;
var sub:String;
  begin
sub := '';
if(posIni > 0)AND(posFin > 0)AND(posIni <= pal.Length)AND(posFin <= pal.Length)then
begin
  while(posIni <= posFin)do
   begin
     sub := sub + pal[posIni];
     posIni := posIni + 1;
   end;
  Result := sub;
end else raise Exception.Create('Error posiciones invalidas');
end;

function Cadena.PosDePalConSubCad(subcad:String): Word;
var i:Word;
     conj:Cardinal;
     N:Numero;
begin
 N := Numero.Create;
 i := 1;
 conj := 0;
  while(i <= CantDPal)do
   begin
      if(EstaLaSubCad(getPalXPos(i),subCad))then
        N.conjPosiciones(conj,i);
    i := i + 1;
   end;
 Result := conj;
end;

function Cadena.FrecDePalabra(palabra: String): Word;
var
  frecP,i : Word;
begin
 frecP := 0;
 i := 1;
   while(i <= CantDPal())do
     begin
        if(UpperCase(getPalXPos(i)) = UpperCase(palabra))then
           frecP := frecP + 1;
       i := i + 1;
     end;
 Result := frecP;
end;

function Cadena.busqDePalabra(palabra: String; var posA: Word): Word;
 var i,x,posP : Word; //posA = 0 si empezamos con la 1era palabra
begin
 i := posA + 1;
 posP := 0;
 while(i <= CantDPal())AND(posP = 0)AND(FrecDePalabra(palabra) > 0)do
    begin
      if(UpperCase(getPalXPos(i)) = UpperCase(palabra))then
        posP := i;
      i := i + 1;
    end;
 Result := posP;
end;

function Cadena.busqDePalabra(palabra: String): Word;
var
  i,x,posP : Word;
begin
 posP := 0;
 x := 0;
 i := 1;
      while(x < FrecDePalabra(palabra))AND(posP = 0)do
       begin
         if(UpperCase(getPalXPos(i)) = UpperCase(palabra))then
           begin
             posP := i;
             x := x + 1;
           end;
         i := i + 1;
       end;
  Result := posP;
end;

//EXAMEN:________________

function Cadena.examVerificar: Cardinal; //examen 1
var conj,Nu,Np:Numero;
    num:Cardinal;
    str:String;
    i,digU,i2,cont:byte;
    j:Word;
    k:boolean;
begin
Nu := Numero.Create;
Np := Numero.Create;
conj := Numero.Create;
Nu.setValor(StrToInt(getPalXPos(1)));
i := 1;
k := false;
num := 0;
str := '';
 while(i <= Nu.getCantDig)do
    begin
     digU := Nu.getPosDig(i);
     j := 2;
     cont := 0;
       while(j <= CantDPal)do
         begin
          i2 := 1;
          Np.setValor(StrToInt(getPalXPos(j)));
             while(i2 <= Np.getCantDig)do
               begin
                 if(digU = Np.getPosDig(i2))then begin
                    k := true;
                 end;
                 i2 := i2 + 1;
               end;
           if(k)then   cont := cont + 1;
           k := false;
           j := j + 1;
         end;
          if(cont = CantDPal-1)then
               Nu.conjPosiciones(num,digU);
        i := i + 1;
    end;
  Result := num;
end;

function Cadena.EsUnNumero(palNum: String): boolean;
var i,cont:Word;
begin
i := 1;
cont := 0;
  while(i <= palNUm.Length)do
   begin
     if(palNum[i] in NU)then
        cont := cont + 1;
     i := i + 1;
   end;
  if(cont = palNum.Length)then
     Result := true else Result := false;
end;

//Ejercicio de Ordenar fechas

function cadena.GetDia(pal: String): byte;
begin
  Result:=StrToInt(Copy(pal,1,pos('/',pal)-1));
end;

function cadena.GetMes(pal: String): byte;
begin
 pal:=Copy(pal,pos('/',pal)+1,length(pal));
 Result:=StrToInt(copy(pal,1,pos('/',pal)-1));
end;

function cadena.GetYear(pal: String): Word;
begin
pal:=Copy(pal,pos('/',pal)+1,length(pal));
Result:=StrToInt(copy(pal,pos('/',pal)+1,length(pal)));
end;

function Cadena.FechaMax: String;
var
  i,dia,mes,anio,pos:Word;
  pal:String;
  max,num:Cardinal;
begin
pal:=getPalXPos(1);
dia:=GetDia(pal);
mes:=GetMes(pal);
anio:=GetYear(pal);
max:=StrToInt(IntToStr(anio)+intToStr(mes)+IntToStr(dia));
pos:=1;
  while(i<=CantDPal)do
    begin
      pal := getPalXPos(i);
      dia := GetDia(pal);
      mes := GetMes(pal);
      anio := GetYear(pal);
      num := StrToInt(IntToStr(anio)+intToStr(mes)+IntToStr(dia));
        if(num > max)then
          begin
          num:=max;
          pos:=i;
          end;
      Inc(i);
    end;
  Result:=getPalXPos(pos);
end;

function Cadena.getHora(tiempo: String): Word;
begin
Result := 123 div 60;
end;

///EXAMEN___________________________________________

function Cadena.probarLongitud(posPal: Word): Word;
var lon:Word;
    pal:String;
begin
 lon := 0;
  if(posPal > 0)AND(pospal <= CantDPal)then
   begin
    pal := getPalXPos(posPal);
    lon := pal.Length;
    Result := lon;
   end else raise Exception.Create('Error posicion invalida');
end;

function Cadena.MayPosPal: Word;
var i:Word;
    may,posPal:Word;
begin
 i := 1;
 posPal := 1;
 may := probarLongitud(1);
   while(i <= CantDPal)do
    begin
      if(probarLongitud(i) > may)then
        begin
          may := probarLongitud(i);
          posPal := i;
        end;
      i := i + 1;
    end;
 Result := posPal;
end;

function Cadena.longitudMay: Word;
var i:Word;
    may:Word;
begin
 i := 1;
 may := probarLongitud(1);
   while(i <= CantDPal)do
    begin
      if(probarLongitud(i) > may)then
        begin
          may := probarLongitud(i);
        end;
      i := i + 1;
    end;
 Result := may;
end;

function Cadena.IgualLong(posPal: Word): Word;
var i:Word;
   posigual:Cardinal;
begin
 i := 1;
 posIgual := 0;
  while(i <= CantDPal)do
   begin
     if(probarLongitud(i) = probarLongitud(posPal))then
           posIgual:= posigual * 10 + i;
     i := i + 1;
   end;
  Result := posIgual;
end;

function Cadena.examen4(Npos: Word): String;
var i,j,posM,igualL:Word;
    Str:String;
    N:Numero;
begin
 N := Numero.Create;
 N.setValor(posComoNumero);
 i := 1;
  while(i <= Npos)do
   begin
     Str := '';
     posM := MayXLongParametros(N.getValor);
     igualL := IgualLong(posM);
      while(igualL > 0)do
       begin
         str := str +' '+ getPalXPos(igualL mod 10);
         N.delDigit(N.getPosDDig(igualL mod 10));
         igualL := igualL div 10;
       end;
     i := i + 1;
   end;
 Result := str;
end;


function Cadena.alterar(n: Word): String;
var i:Word;
   al:String;
begin
al := '';
i := 1;
  while(i < n)do
   begin
     al := al + '.';
      i := i + 1;
   end;
 Result := al;
end;

function Cadena.posComoNumero: Cardinal;
var i:Word;
    conj:Cardinal;
begin
i := 1;
conj := 0;
 while(i <= CantDPal)do
  begin
    conj := conj * 10 + i;
    i := i + 1;
  end;
 Result := conj;
end;

function Cadena.MayXAlfabetParametros(n: Cardinal): Word;
 var posM,rpal:Word;
     Mpal,PPal:String;
begin
 posM := n mod 10;
 MPal := getPalXPos(posM);
 while(n > 0)do
  begin
   rpal := n mod 10;
   PPal := getPalXPos(rpal);
    if(PPal[1] > MPal[1])then
      begin
         posM := rpal;
         MPal := getPalXPos(posM);
      end;
   n := n div 10;
  end;
 Result := posM;
end;

function Cadena.MayXLongParametros(n: Cardinal): word;
var posM,LonM,Lon:Word;
begin
 posM := n mod 10;
 LonM := probarLongitud(n mod 10);
  while(n > 0)do
   begin
    Lon := probarLongitud(n mod 10);
      if(Lon > LonM)then begin
        posM := n mod 10;
        LonM := probarLongitud(n mod 10);
      end;
    n := n div 10;
   end;
 Result := posM;
end;


function Cadena.Examen5(Nums: String; redon: byte): CArdinal;
var
    i:Word;
    rel:Real;
    sum:real;
begin
 i := 1;
 sum := 0;
   while(i <= CantDPal)do
     begin
        rel := RoundTo(StrToFloat(getPalXPos(i)),-redon);
        sum := sum + rel;
        i := i + 1;
     end;
end;

function Cadena.SacarFracc(N: String): Cardinal;
var Nu:Numero;
    car:Cardinal;
    k :boolean;
    i:byte;
begin
 NU := Numero.Create;
 if(Nu.VerifPartFracc(StrToFloat(N)))then
   begin
     i := 1;
     car := 0;
     k := false;
      while(i <= N.Length)AND Not(k)do
       begin
         if(N[i] = '.')then begin
          i := i + 1;
           while(i <= N.Length)do
            begin
              car := car*10+StrToInt(N[i]);
              i := i + 1;
            end;
          K := true;
         end;
         i := i + 1;
       end;
     Result := car;
   end else Result := StrToInt(N);
end;

function Cadena.SonDeIgualesLong: boolean;
 var
   i,pr : Word;
   k : boolean;
begin
 k := false;
 pr := probarLongitud(1);
 i := 1;
  while(i <= CantDPal)AND(pr = probarLongitud(i))do
    i := i + 1;
  if(CantDPal() = i-1)then
    k := true;
 Result := k;
end;

function Cadena.ObtMezclaRequerida(palabraUt, palabraReqda: String): boolean;
 var
  i,j,cont : Word;
  chr : char;
begin
 i := 1;
 cont := 0;
  while(i <= Length(palabraUt))do
   begin
    chr := palabraUt[i];
    j := 1;
     while(j <= Length(palabraReqda))do
      begin
         if(chr = palabraReqda[j])then
          cont := cont + 1;
        j := j + 1;
      end;
    i := i + 1;
   end;
 if(cont = Length(palabraUt))then
   Result := true
      else Result := false;
end;

end.
