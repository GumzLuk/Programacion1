unit UCLNiveles;

interface

 uses SysUtils, Dialogs, Graphics, UCLMuro, UCFigura, UCCaja;

Const
 MAXF = 20;
 MAXC = 30;

 Niveles : Array[1..3] of array [1..20]of String[30] =

 (('111111111111111111111111111111',
   '111111111111111111111111111111',             { 1 : Muros }
   '111111111111111111111111111111',             { 2 : Figura }
   '111111111111111000111111111111',             { 3 : Cajas }
   '111000000000111000000000000111',             { 4 : Bases para cajas }
   '111020000000111030000000000111',
   '111000000000111300000000000111',
   '111000000003300000000000000111',
   '111000000000000000000000000111',
   '111000000111000000000001110111',
   '111111110111300000000031110111',
   '111111110111000000000001110111',
   '111111110111111111111111110111',
   '111000000111111111111111110111',
   '111000000111111111111111110111',
   '111000000004400440000000000111',
   '111111111111111111111111111111',
   '111111111111111111111111111111',
   '111111111111111111111111111111',
   '111111111111111111111111111111'
  ),
  ('111111111111111111111111111111',
   '111111111111111111111111111111',
   '111111111111111111111111111111',
   '111111111111111111111111111111',
   '111111111111111400000000021111',
   '111111111111111000000000001111',
   '111111111111111000000000001111',
   '111100000000003330000000001111',
   '111101111111111011111111101111',
   '111141111111111411111111141111',
   '111101111111111011111111101111',
   '111100000000000300000000001111',
   '111100000000030411111111101111',
   '111111111111111011111111101111',
   '111111111111111011111111101111',
   '111111111111111000000000001111',
   '111111111111111111111111111111',
   '111111111111111111111111111111',
   '111111111111111111111111111111',
   '111111111111111111111111111111'
  ),
  ('111111111111111111111111111111',
   '111111111111111111111111111111',
   '111111111111111111111111111111',
   '111111111111111111111111111111',
   '111100000000000001111111111111',
   '111101111113111130000000001111',
   '111101111110111100111011101111',
   '111101111110111100111011101111',
   '111100000000111100111011101111',
   '111101111110111100111011101111',
   '111141111114111100111011101111',
   '111101111110111133000333021111',
   '111100040000000000000001111111',
   '111101111110111111111111111111',
   '111101111110111111111111111111',
   '111141111114111111111111111111',
   '111140000004111111111111111111',
   '111111111111111111111111111111',
   '111111111111111111111111111111',
   '111111111111111111111111111111'
  ));

  Type
    TMapa = Class
      private
        elementos : array[1..20,1..30] of byte;
        NroFilas : Word;
        NroColumnas : Word;
        Xmapa : Word;
        Ymapa : Word;
        Muros : TMuro;
        Figura : TFigura;
        Cajas : TCaja;
      public
        XFigura,YFigura : Word;
        constructor create();
        constructor createNivel(NroNivel:byte;Xmapa,Ymapa:Word);
//procedimientos________________________________________________________________
        procedure CargarNivel(NroNivel:byte;Xmapa,Ymapa:Word);
        procedure CargarObjetos();
        procedure DibujarNivel(pantalla:TCanvas);
        procedure MoverFigura(direccion:Word);
        procedure MoverCajas();

//funciones_____________________________________________________________________
        function ObtElement(posF,posC:Word):byte;
        function Filas():Word;
        function Columnas():Word;
        function ObtNroMuros():Word;
        function ObtNroCajas():Word;
        function ObtFigura():TFigura;
    End;
implementation

{ TMapa }
constructor TMapa.create;
begin
 Self.NroFilas := MAXF;
 Self.NroColumnas := MAXC;
 Self.Muros := TMuro.Create;
 Self.Figura := TFigura.Create;
 Self.Cajas := TCaja.Create;
 Self.XFigura := 1;
 self.YFigura := 1;
end;

constructor TMapa.createNivel(NroNivel:byte;Xmapa,Ymapa:Word);
begin
 CargarNivel(NroNivel,Xmapa,Ymapa);
 CargarObjetos;
end;

//procedimientos________________________________________________________________

procedure TMapa.CargarNivel(NroNivel:byte;Xmapa,Ymapa:Word);
 var
   i,j : Word;
begin
 Self.Xmapa := Xmapa;
 Self.Ymapa := Ymapa;
 for i := 1 to NroFilas do
   begin
     for j := 1 to NroColumnas do
        begin
          elementos[i,j] := StrToInt( niveles[NroNivel][i,j]);
        end;
   end;
end;

//Cargar todo muros,figura,cajas
procedure TMapa.CargarObjetos;
 var
   i,j: Word;
   x,y,posM,posC : Word;
begin
 muros.dimensionar(Self.ObtNroMuros);
 muros.CargarImagenGeneral('MuroA.bmp');
 muros.cargarImagen;
 Cajas.dimensionar(Self.ObtNroCajas);
 Cajas.CargarImagenGeneral('caja1.bmp');
 Cajas.cargarImagenesCajas;
 Figura.cargarImagen('gokuAbajo.bmp');
 y := Self.Ymapa;
 posM := 1;
 posC := 1;
 for i := 1 to NroFilas do
  begin
   x := self.Xmapa;
    for j := 1 to NroColumnas do
       begin
         if(elementos[i,j] = 1)then
          begin
            muros.cambiarXYElemento(posM,x,y);
            posM := posM + 1;
          end;
         if(elementos[i,j] = 2)then
           begin
             self.XFigura := x;
             self.YFigura := y;
           end;
          if(elementos[i,j] = 3)then
           begin
             Cajas.cambiarXYElemento(posC,x,y);
             posC := posC + 1;
           end;
         x := x + 32;
       end;
   y := y + 32;
  end;
 Figura.CambiarPosicion(XFigura,YFigura);
end;

//Dibujar Todo

procedure TMapa.DibujarNivel(pantalla : TCanvas);
begin
 muros.dibujar(pantalla);
 Cajas.dibujar(pantalla);
 Figura.dibujar(pantalla);
end;

//Movimiento de Figura

procedure TMapa.MoverFigura(direccion: Word);
begin
 Figura.SetDireccionMov(direccion);
  case direccion of
   37 : begin
         MoverCajas;
          if not(Figura.choqueMuroIzquierda(Muros))then
            Figura.SetX(Figura.ObtX - distancia);
        end;
   38 : begin
         MoverCajas;
         if not(Figura.choqueMuroArriba(Muros))then
           Figura.SetY(Figura.ObtY - distancia);
        end;
   39 : begin
      ShowMessage(inttostr(CAjas.AnchoAlturaCajaMovDerecha(cajas.ObtCajaMov)));
         MoverCajas;
          if not(Figura.choqueMuroDerecha(Muros))then
           Figura.SetX(Figura.ObtX + distancia);
        end;
   40 : begin
         MoverCajas;
          if not(Figura.choqueMuroAbajo(Muros))then
            Figura.SetY(Figura.ObtY + distancia);
         end;
  end;
// Cajas.choqueMuroDerecha(Muros);
 Figura.SetDireccionMov(0);
end;

//Movimiento de cajas

procedure TMapa.MoverCajas;
begin
 //Cajas.SetCajaMov(0);
 if(Figura.ObtDireccionMov = 39)AND(Figura.choqueCajasDerecha(Cajas))then
   begin
     Cajas.SetXElement(Cajas.ObtCajaMov,Cajas.ObtXElement(Cajas.ObtCajaMov)+DISTANCIA);
     Figura.SetDireccionMov(0);
   end;
  if(Figura.ObtDireccionMov = 37)AND(Figura.choqueCajasIzquierda(Cajas))then
   begin
     Cajas.SetXElement(Cajas.ObtCajaMov,Cajas.ObtXElement(Cajas.ObtCajaMov)-DISTANCIA);
     Figura.SetDireccionMov(0);
   end;
  if(Figura.ObtDireccionMov = 38)AND(Figura.choqueCajasArriba(Cajas))then
   begin
    cajas.SetYElement(Cajas.ObtCajaMov,Cajas.ObtYElement(cajas.ObtCajaMov) - DISTANCIA);
    Figura.SetDireccionMov(0);
   end;
  if(Figura.ObtDireccionMov = 40)AND(Figura.choqueCajasAbajo(Cajas))then
   begin
     Cajas.SetYElement(Cajas.ObtCajaMov,Cajas.ObtYElement(Cajas.ObtCajaMov) + DISTANCIA);
     Figura.SetDireccionMov(0);
   end;
end;

//funciones_____________________________________________________________________

function TMapa.ObtElement(posF,posC: Word): byte;
begin
 if(posF > 0)AND(posF <= NroFilas)AND(posC > 0)AND(posC <= NroColumnas)then
  begin
    result := elementos[posF,posC];
  end;
end;

function TMapa.Filas: Word;
begin
 Result := NroFilas;
end;

function TMapa.Columnas: Word;
begin
 Result := NroColumnas;
end;

function TMapa.ObtNroMuros: Word;
 var
   nroM,i,j : Word;
begin
 nroM := 0;
  for i := 1 to NroFilas do
    begin
      for j := 1 to NroColumnas do
        begin
          if(elementos[i,j] = 1)then
            nroM := nroM + 1;
        end;
    end;
 Result := nroM;
end;

function TMapa.ObtNroCajas: Word;
 var
  nroC,i,j : Word;
begin
 nroC := 0;
  for i := 1 to NroFilas do
    begin
      for j := 1 to NroColumnas do
        begin
          if(elementos[i,j] = 3)then
            nroC := nroC + 1;
        end;
    end;
 Result := nroC;
end;

function TMapa.ObtFigura: TFigura;
begin
 Result := Figura;
end;

end.