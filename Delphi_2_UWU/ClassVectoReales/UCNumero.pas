unit UCNumero;

interface
 uses Math, SysUtils, Dialogs;

 Type
   Numero = class
    private
      valor:Cardinal;
    public
 //porcedimineto________________________

      procedure setValor(n:Cardinal);
      procedure insertDigit(pos,dig:Byte);
      procedure modDigit(p,dig:Byte);
      procedure addDigDerecha(dig:Byte);
      procedure addDigsIzquierda(dig:Cardinal);
      procedure delDigit(p:Byte);
      procedure invertirNumero();
      procedure intercambiarDig(p1,p2:byte);
      procedure ordenAscendente();
      procedure ordenDescendente();
      procedure conjPosiciones(var num:Cardinal;dig:byte);
      procedure ElimPosDConj(n:cardinal);
      procedure EliminarNDig(dig:byte);
      procedure ordenXFrecDescendente();
      procedure OrdenExamen2(n:Cardinal); //EXAMEN 543221 paramentro 7800 nuevo 875322100
      procedure ElimTodosLosRep();
      procedure ElimSubNumero(subN:Word);
      procedure elimDigRepetSolo1(dig:byte);
      procedure elimsubNumRepetSolo1(SubN:Cardinal);
 //funciones____________________________

      function getValor():Cardinal;
      function getCantDig():Byte;overload;
      function getCantDig(num : Cardinal): byte;overload;
      function getPosDig(p:Byte):byte;
      function getPosDig2(num:Cardinal ; p:byte):byte;
      function getDigMay(posIni:byte ; var posDigMay:byte):byte;
      function getDigMen(posIni:byte ; var posDigMen:byte):byte;
      function FrecDeDig(dig:byte):byte;
      function FrecDigDMayor():byte;
      function FrecDeDig2(num:Cardinal ; dig:byte):byte; //cuidado
      function EsPrimo(dig:byte):boolean;
      function EsPar(dig:byte):boolean;
      function VerfCeroCero():Cardinal;
      function SacarNXPos(posI:byte;PosF:byte):Cardinal;
      function FrecNumero(nf:Cardinal):byte;
      function SubNumMenor(cifras:byte):Cardinal;
      function CantDCeros():byte;
      function getPosDDig(dig:byte):byte;
 {cambiar de conversion }
      function ToBaseN(base: cardinal): String;
      function DeciToRomano():String;
      function HexToDec(hex: String): LongWord;
      function  ToLiteral() : String;
      function LiteralExtra(posDig:byte;Lit:byte):String;
      function TieneExtrasLIT() : Boolean;
 {.....................}
      function  EsFraccion(x: real): boolean;
      function ParDDigSuman10():byte;  //Examen 3
      function SacarTodoDigX(dig:byte):Cardinal;
      function transfRealAEntero(elem: Real): Cardinal;
      function transfRealAEnteroCopy(elem: Real): Cardinal;
   end;

implementation

{ Numero }

////////PROCEDIMIENTO___________________________________________________________

procedure Numero.setValor(n: Cardinal);
begin
  valor := n;
end;

procedure Numero.addDigDerecha(dig: Byte);
begin
 valor := valor*10+dig;
end;

procedure Numero.addDigsIzquierda(dig:Cardinal);
var n:Cardinal;
begin
  if(getValor <> 0)then begin
    n := valor mod trunc(power(10,getCantDig));
    setValor(dig*Trunc(power(10,getCantDig)) + n)
  end else valor := dig;
end;

procedure Numero.modDigit(p, dig: Byte);
var nv1:Cardinal;
begin

  if((p>=1) and (p<=getCantDig))then begin
    nv1:= valor div Trunc(Power(10,p)) * 10 + dig;
    valor := nv1 * Trunc(power(10,p-1)) + valor mod Trunc(power(10,p-1));
  end;
end;

procedure Numero.insertDigit(pos, dig: Byte);
var nvr:Cardinal;
begin
 if(pos > 0)AND(pos <= getCantDig())then
  begin
   nvr := valor div trunc(power(10,pos-1)) * 10 + dig;
   valor := nvr * trunc(power(10,pos-1)) + valor mod trunc(power(10,pos-1));
  end else raise Exception.Create('Error posicion invalida');
end;

procedure Numero.delDigit(p: Byte);
var nv1:Cardinal;
begin

 nv1 := valor div trunc(Power(10,p));
 valor := nv1 * trunc(power(10,p-1)) + valor mod trunc(power(10,p-1));
end;

procedure Numero.intercambiarDig(p1, p2: byte);
var recop : byte;
begin

 if(p1>0)AND(p1<=getCantDig)AND(p2>0)AND(p2<=getCantDig)then begin
   recop := getPosDig(p2);
   modDigit(p2,getPosDig(p1));
   modDigit(p1,recop);
 end;
end;

procedure Numero.invertirNumero;
  var
   i,rep,f:byte;
begin

 if(getCantDig >= 1)then
  begin
    i := 1;
    f := getCantDig;
    rep := getCantDig div 2;
      while(i<=rep)do begin
         intercambiarDig(i,f);
         i := i + 1;
         f := f - 1;
      end;
  end
    else raise Exception.Create('Error cantidad de digitos < 1');
end;

procedure Numero.ordenDescendente;
var i,mayD,posD:byte;
begin

 i := 1;
  while(i<=getCantDig())do
   begin
    getDigMay(i,posD);
    intercambiarDig(posD,i);
    i := i + 1;
   end;
end;

procedure Numero.ordenXFrecDescendente;
var i,digM:byte;
    n:Cardinal;
    Nr:Numero;
    q:boolean;
begin
 Nr := Numero.Create;
 while(getValor > 0)do
  begin
    digM := FrecDigDMayor;
    ShowMessage(intToStr(Nr.getValor));
    Nr.addDigsIzquierda(SacarTodoDigX(digM));
    EliminarNDig(digM);
  end;
 ShowMessage(intToStr(Nr.getValor));
 setValor(Nr.getValor);
end;

procedure Numero.ordenAscendente;
var i,menD,posD:byte;
begin
  i := 1;
   while(i<=getCantDig())do
    begin
      getDigMen(i,posD);
      intercambiarDig(posD,i);
      i := i + 1;
    end;
end;

procedure Numero.conjPosiciones(var num: Cardinal; dig: byte);
begin
     num := num*10+dig;
end;

procedure Numero.ElimPosDConj(n: cardinal);
var posElim:byte;
begin
 while(n > 0)do
  begin
    posElim := n mod 10;
    delDigit(posElim);
    n := n div 10;
  end;
end;

procedure Numero.EliminarNDig(dig: byte);
var i:byte;
    nv:Cardinal;
begin
 nv:=0;
 i := 1;
 while(i <= getCantDig())do
   begin
     if(getPosDig(i) = dig)then
        conjPosiciones(nv,i);
    i := i + 1;
   end;
 ElimPosDConj(nv);
end;

procedure Numero.OrdenExamen2(n: Cardinal);
var k:boolean;
    dig,j:byte;
begin
 while(n > 0)do
   begin
     dig := n mod 10;
     j := 1;
     k := true;

       while(j <= getCantDig)do
         begin
            if(dig <= getPosDig(j))AND(k)then
              begin
                insertDigit(j,dig);
                k := false;
              end;
           j := j + 1;
         end;
     ShowMessage(intToSTr(getvalor));
      if(k)then addDigsIzquierda(dig);
    ShowMessage(intToSTr(getvalor));
     n := n div 10;
   end;
end;

procedure Numero.ElimTodosLosRep;
var i:byte;
    conj:Cardinal;
begin
i := 1;
conj := 0;
 while(getValor > 0)do
   begin
    conjPosiciones(conj,getPosDig(i));
    EliminarNDig(getPosDig(i));
   end;
 setValor(conj);
end;

procedure Numero.ElimSubNumero(subN: Word);
var i,j:byte;
   conj:Cardinal;
   k:boolean;
begin
 i := 1;
 k := false;
  while(i <= getCantDig)AND NOT(k)do
   begin
      if(i+getCantDig(subN)-1 <= getCantDig)AND(SacarNXPos(i,i+getCantDig(subN)-1) = subN)then
       begin
         k := true;
         j := 1;
          while(j <= getCantDig(subN))do
           begin
             delDigit(i);
             ShowMessage(inttostr(i));
             i := i - 1;
             j := j + 1;
           end;
       end;
     i := i + 1;
   end;
end;

procedure Numero.elimsubNumRepetSolo1(SubN: Cardinal);
var Subx:Cardinal;
    i:byte;
begin
 i := 1;
 while(i <= getCantDig)do
  begin
    if(i+getCantDig(SubN)-1 > getCantDig)AND(getPosDig(i) = subN mod 10)then
        SacarNXPos(i,i+getCantDig(SubN)-1);
  end;
end;

procedure Numero.elimDigRepetSolo1(dig: byte);
var posE:byte;
begin
 while(FrecDeDig(dig) > 1)do
  begin
    posE := getPosDDig(dig);
    delDigit(posE);
  end;
end;

/////FUNCIONES__________________________________________________________________

function Numero.getValor: Cardinal;
begin
 Result := valor;
end;

function Numero.getPosDDig(dig: byte): byte;
var i,posDDig:byte;
     k:boolean;
begin
 i := 1;
 posDDig := 0;
 k := false;
  while(i <= getCantDig)AND NOT(k)do
   begin
     if(getPosDig(i) = dig)then
        begin
          k := true;
          posDDig := i;
        end;
     i := i + 1;
   end;
 Result := posDDig;
end;

function Numero.getPosDig(p: Byte): Byte;
 var
  k:Cardinal;
  res : byte;
begin
 res := 0;
 if(p>0)AND(p<=getCantDig())then begin
    k := Trunc(Power(10,p-1));
    res := (valor div k) mod 10;
 end ;
  Result := res;
end;

function Numero.getPosDig2(num: Cardinal; p: byte): byte;
var k:Cardinal;
begin
 if(p>0)AND(p<=getCantDig())then begin
    k := Trunc(Power(10,p-1));
    Result := (num div k) mod 10;
 end else raise Exception.Create('Error posicion invalida');
end;

function Numero.getCantDig: Byte;
begin
 Result := Trunc(Log10(valor)+1);
end;

function Numero.getCantDig(num: Cardinal): byte;
begin
 Result := Trunc(Log10(num)+1);
end;

function Numero.getDigMay(posIni:byte ; var posDigMay:byte):byte;
 var
   mayDig:byte;
begin
 mayDig := getPosDig(posIni);
 posDigMay := posIni;
  while(posIni<=getCantDig())do
    begin
       if(getPosDig(posIni) > mayDig)then begin
         mayDig := getPosDig(posIni);
         posDigMay := posIni;
       end;
     posIni := posIni + 1;
    end;
  Result := mayDig;
end;

function Numero.getDigMen(posIni: byte; var posDigMen: byte): byte;
 var menDig:byte;
begin
 menDig := getPosDig(posIni);
 posDigMen := posIni;
   while(posIni<=getCantDig())do
     begin
        if(getPosDig(posIni) < menDig)then begin
          menDig := getPosDig(posIni);
          posDigMen := posIni;
        end;
      posIni := posIni + 1;
     end;
 Result := menDig;
end;

function Numero.FrecDeDig(dig: byte): byte;
 var cont,i :byte;
begin

 cont := 0;
 i := 1;
  while(i<=getCantDig())do
    begin
       if(getPosDig(i) = dig)then
         cont := cont + 1;
      i := i + 1;
    end;
 Result := cont;
end;

function Numero.FrecDeDig2(num: Cardinal; dig: byte): byte;
var cont,i :byte;
begin

 cont := 0;
 i := 1;
  while(i<=getCantDig(num))do
    begin
      if(getPosDig2(num,i) = dig)then
        cont := cont + 1;
      i := i + 1;
    end;
  Result := cont;
end;

function Numero.FrecDigDMayor: byte;
 var frecMay,dig,i:byte;
begin
 frecMay := FrecDeDig(getPosDig(1));
 dig := getPosDig(1);
 i := 1;
  while(i <= getCantDig)do
    begin
      if(FrecDeDig(getPosDig(i)) > frecMay)then begin
          frecMay := FrecDeDig(getPosDig(i));
          dig := getPosDig(i);
      end;
      i := i + 1;
    end;
  Result := dig;
end;

function Numero.EsPar(dig: byte): boolean;
begin
 Result := dig mod 2 = 0;
end;

function Numero.EsPrimo(dig:byte): boolean;
 var  i,cont:Cardinal;
begin
 cont := 0;
 i := 2;
  while(i <= dig-1)AND(cont = 0)do
    begin
      if(dig mod i = 0)then
          cont := cont + 1;
      i := i + 1;
    end;
 if(cont = 0)then Result := true else Result := false;
end;

function Numero.HexToDec(hex: String): LongWord;
 var
  i,d:Byte;
  aux,res:UInt64;
begin
 aux:=1;
 res:=0;
   for i := Length(hex) downto 1 do
      begin
        case hex[i] of
           'A':d:=10;
           'B':d:=11;
           'C':d:=12;
           'D':d:=13;
           'E':d:=14;
           'F':d:=15;
           else
             d:=StrToInt(Hex[i]);
        end;
       res:=(d*aux)+res;
       aux:=aux*16;
      end;
    Result:=res;
end;

function Numero.VerfCeroCero: Cardinal;
 var i,e:byte;
     conj:Cardinal;
begin
i := 1;
conj := 0;
 while(i<=getCantDig())do
   begin
        if(getPosDig(i)=0)Then begin
           while(i<=getCantDig)AND(getPosDig(i)=0)do
             begin
               conjPosiciones(conj,i);
               i := i + 1;
             end;
        end;
    i := i + 1;
   end;
 Result := conj;
end;

function Numero.SacarNXPos(posI, PosF: byte): Cardinal;
var Nr,k:Cardinal;
begin
 Nr := 0;
 k := 1;
  if(posI>0)AND(posF>0)then begin
   while(posI<=posF)do
     begin
       Nr :=getPosDig(posI) * k + Nr;
       k := k * 10;
       posI := posI + 1;
     end;
   Result := Nr;
  end else raise Exception.Create('Error posiciones invalidas');
end;

function Numero.DeciToRomano():String;
  const
     UNIDADROM : array[0..9]of String = (
     '','I','II','III','IV','V','VI','VII','VIII','IX');
     DECENAROM : array[0..9]of String = (
     '','X','XX','XXX','XL','L','LX','LXX','LXXX','XC');
     CENTENAROM : array[0..9]of String = (
     '','C','CC','CCC','CD','D','DC','DCC','DCCC','CM');
     MILLARESROM : array[1..3]of String = (
     'M','MM','MMM');
   var
     Romano,temp : String;
     i : byte;
begin
 Romano := '';
 i := 1;
  while(i <= getCantDig)AND(self.valor <= 3999)do
   begin
   temp := '';
     case i of
       1 : temp := UNIDADROM[getPosDig(i)];
       2 : temp := DECENAROM[getPosDig(i)];
       3 : temp := CENTENAROM[getPosDig(i)];
       4 : temp := MILLARESROM[getPosDig(i)];
     end;
    Romano := temp +  Romano;
    i := i + 1;
   end;
 Result := Romano;
end;

function Numero.FrecNumero(nf: Cardinal): byte;
 var i,cont:byte;
     k:boolean;
begin
 i := 1;
 cont := 0;
 if(nf<=getValor())then
  begin
   while(i<=getCantDig())do
     begin
        if(getPosDig(i) = getPosDig2(nf,1))AND((i+getCantDig(nf)-1)<=getCantDig())then begin
          if(SacarNXPos(i,i+getCantDig(nf)-1)) = nf then
             cont := cont + 1;
        end;
      i := i + 1;
     end;
   Result := cont;
  end else raise Exception.Create('Error numero fuera del rango ');
end;

function Numero.SubNumMenor(cifras: byte): Cardinal;
 var nr,nv,kc:Cardinal;
     cer:boolean;
     i,posDig,dig,cifr:byte;
     N:Numero;
begin
if(cifras > 0)AND(cifras <= getCantDig())then
 begin
  N := Numero.Create;
  nr := getValor();
  i := 1;
  posDig := 1;
  cifr := cifras;

 if(cifras-CantDCeros() > 0)then begin cifras := cifras-CantDCeros(); EliminarNDig(0); end;
 if(cifras-CantDCeros() <= 0)then begin EliminarNDig(0); cifras := 1; end;
    while(i<=cifras)do
      begin
        dig := getDigMen(1,posDig);
        delDigit(posDig);
        N.addDigDerecha(dig);
        i := i + 1;
      end;
  setValor(nr);

 if(cifr-CantDCeros() > 0)then begin
    kc := cifr - (cifr - CantDCeros);
     if(N.getCantDig = 1)then begin
        N.setValor(N.getValor * Trunc(power(10,kc)))
        end
           else begin
           nr := N.getValor div Trunc(power(10,N.getCantDig-1)) * trunc(power(10,kc));
           nv := N.getValor mod trunc(power(10,N.getCantDig-1));
           N.setValor(nr * trunc(power(10,N.getCantDig-1)) + nv);
          end;
 end;
 if(cifr-CantDCeros() <= 0)then
   N.setValor(N.getValor * trunc(power(10,cifr-1)));

  Result := N.getValor;
 end else raise Exception.Create('Error cifra invalida');
end;

function Numero.CantDCeros: byte;
var i,cont:byte;
begin
cont := 0;
i := 1;
  while(i<=getCantDig())do
    begin
      if(getPosDig(i) = 0)then
         cont := cont + 1;
      i := i + 1;
    end;
 Result := cont;
end;

function Numero.ToBaseN(base: cardinal): String;
  const VECTOR: array[0..15]of string=('0','1','2','3','4','5','6','7','8','9',
  'A','B','C','D','E','F');
  var
    n,d:cardinal;
    res:String;
begin
if(base > 1)AND(base <= 16)Then
 begin
  res := '';
  n := getValor;
   while(n > 0)do
    begin
      d := n mod base;
      n := n div base;
      res := VECTOR[d] + res;
    end;
  Result := res;
 end else raise Exception.Create('Error base => 2  &&  base<= 16');
end;

function Numero.ToLiteral(): String;
const
 LITUNIDAD : Array[0..9] of string =
  ('',' uno ',' dos ',' tres ',' cuatro ',' cinco ',' seis ',' siete ',' ocho ',' nueve ');
 LITDECENA : Array[0..9] of String =
  ('',' diez ',' veinte ',' treinta ',' cuarenta ',' cincuenta ',' sesenta ',' setenta ',' ochenta ',' noventa ');
 LITCENTENA : Array[0..9] of String =
  ('',' ciento ',' doscientos ',' trescientos ',' cuatrocientos ',' quinientos ',' seiscientos ',' setecientos ',' ochocientos ',' novecientos ');
 LITMILLARUNID : Array[0..9]of String =
  ('',' Mil ',' Dosmil ',' Tresmil ',' Cuatromil ',' Cincomil ',' Seismil ',' Sietemil ',' Ochomil ',' Nuevemil ');
 var
  i : Word;
  k : boolean;
  Lit,extr : String;
begin
 i := 2;
 k := false;
 Lit := '';
 extr := '';
 if not(TieneExtrasLIT)then
  begin
    Lit := LITUNIDAD[getPosDig(1)];
  end;
  while(i <= getCantDig)do
   begin
     if(not(k)AND(TieneExtrasLIT))AND(i = 2)then
      begin
         if(getPosDig(i) <= 2)then
          begin
            Lit := LiteralExtra(getPosDig(i),getPosDig(i-1)) + Lit;
          end;
         if(getPosDig(i) > 2)then
          begin
            Lit :='y'+LITUNIDAD[getPosDig(i-1)] + Lit;
            Lit := LITDECENA[getPosDig(i)] + Lit;
          end;
        k := true;
        i := i + 1;
      end;
     if not(TieneExtrasLIT)AND not(k)then
      begin
       Lit := LITDECENA[getPosDig(i)] + Lit;
       k := true;
       i := i + 1;
      end;
    if(i = 3)then
     Lit := LITCENTENA[getPosDig(i)] + Lit;
    if(i = 4)then
     Lit := LITMILLARUNID[getPosDig(i)] + Lit;
    i := i + 1;
   end;
 Result := Lit;
end;

function Numero.LiteralExtra(posDig, Lit: byte): String;
const
 LIT10EX : Array[0..9] of String =
 ('',' Once ',' Doce ',' Trece ',' Catorce ',' Quince ',' Dieciseis ',' Diecisiete ',' Dieciocho ',' Diecinueve ');
 LIT20EX : Array[0..9] of String =
 ('veinte',' Veintiuno ',' Veintidos ',' Veintitres ',' Veinticuatro ',' Veinticinco ',' Veintiseis ',' Veintisiete ',' Veintiocho ',' Veintinueve ');
begin
 if(posDig = 1)then
  begin
   Result := LIT10EX[Lit];
  end;
 if(posDig = 2)then
  begin
    Result := LIT20EX[Lit];
  end;
end;

function Numero.TieneExtrasLIT(): Boolean;
 var
   n1,n2,n3 : byte;
   extr : boolean;
begin
 extr := false;
 if(getCantDig >= 2)then
   begin
    n1 := getPosDig(1);
    n2 := getPosDig(2);
    n3 := getPosDig(3);
     if(n1 > 0)AND(n2 > 0)then
       extr := true;
     if not(extr)AND(n3 = 1)AND(n1 = 0)AND(n2 = 0)then
       extr := true;
   end;
 Result := extr;
end;

function Numero.EsFraccion(x: real): boolean;
begin
  result := (not (x = trunc(x)));
end;

function Numero.ParDDigSuman10: byte;
var i,j,cont:byte;
begin
 i := 1;
 cont := 0;
 ElimTodosLosRep;
   while(i <= getCantDig-1)do
    begin
     j := i + 1;
      while(j <= getCantDig)do
         begin
           if(getPosDig(i) + getPosDig(j)) = 10 then
               cont := cont + 1;
           j := j + 1;
         end;
     i := i + 1;
    end;
 Result := cont;
end;

function Numero.SacarTodoDigX(dig: byte): Cardinal;
var i:byte;
    conj:Cardinal;
begin
 i := 1;
 conj := 0;
   while(i <= getCantDig)do
    begin
      if(getPosDig(i) = dig)then
         conjPosiciones(conj,dig);
      i := i + 1;
    end;
  Result := conj;
end;

function Numero.transfRealAEntero(elem: Real): Cardinal;
var
  desp , ant ,res: Real;
  n : Cardinal;
  x : byte;
begin
 ant := trunc(elem);
 desp := elem - ant;
 desp := RoundTo(desp,-4);
 n := trunc(elem);
 x := 1;
 ShowMessage(FloatToStr(trunc(desp)));
    while NOT(EsFraccion(ant))AND(EsFraccion(desp))AND(x <= 6) do
    begin
      desp := desp * 10;
      ShowMessage(FloatToStr(desp));
      x := x + 1;
    end;
   ShowMessage(FloatToStr(desp));
 if(EsFraccion(elem))then
    n := Trunc(power(10,getCantDig(Trunc(desp)))) * Trunc(ant) + Trunc(desp);
 Result := n;
end;

function Numero.transfRealAEnteroCopy(elem: Real): Cardinal;
 var
  NStr : String;
  i : Word;
  NEntero : Cardinal;
begin
 i := 1;
 NStr := FloatToStr(elem);
 NEntero := 0;
  while(i <= Length(NStr))do
   begin
     if Not(NStr[i] in ['.']) then
        NEntero := NEntero * 10 + StrToInt(NStr[i]);
     i := i + 1;
   end;
 Result := NEntero;
end;

end.