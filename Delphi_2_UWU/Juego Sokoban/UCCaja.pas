unit UCCaja;

interface
 uses Graphics, SysUtils, Dialogs, UCLMuro, UCVector;
 const MAXE = 10;
       DISTANCIA = 32;

  Type
   Cajas = record
      x,y : Word;
      NroDeCaja : Word;
      ImagenCaja : TBitmap;
      widthImagen,heightImagen : Word;
   end;

    TCaja = Class
      private
        elementos : array[1..MAXE] of Cajas;
        dimension : Word;
        notMovimiento : vector;
        ImagenGeneral : Tbitmap;
        rutaImagenGeneral : String;
        widthGeneral,heightGeneral : Word;
        cajaMov : Word;
      public
        constructor Create();
//procedimientos________________________________________________________________
        procedure DimensionarNotMoviento();
        procedure cargarImagenesCajas();
        procedure dibujar(pantalla : TCanvas);
        procedure CargarImagenGeneral(direccionImagen : String);
        procedure dimensionar(dim:Word);
        procedure SetXElement(posE:Word;xi:Word);
        procedure SetYElement(posE:Word;yi:Word);
        procedure cambiarXYElemento(posE:Word;xa,ya : Word);
        procedure cambiarImagenElemento(posE:Word;rutaBMP:String);
        procedure cambiarBmpElemento(posE:Word;nuevoBmp:TBitmap);
        procedure SetCajaMov(pos:Word);
//funciones_____________________________________________________________________
        function ObtCajaMov():Word;
        function ObtXElement(posE:Word):Word;
        function ObtYElement(posE:Word):Word;
        function ObtNroXCaja(posE:Word):Word;
        function ObtWidthElement(posE:Word):Word;
        function ObtHeigthElement(posE:Word):Word;
        function ObtAnchoCaja(posE:Word):Word;
        function ObtAlturaCaja(posE:Word):Word;
        function getDimension():Word;

        function choqueMuroIzquierda(Muros:TMuro):boolean;
        function choqueMuroArriba(Muros:TMuro):boolean;
        function choqueMuroAbajo(Muros:TMuro):boolean;
        procedure choqueMuroDerecha(Muros: TMuro);

        function MovDerechaMuro(posE:Word;posEM:Word;Muros: TMuro): boolean;
        function AnchoAlturaCajaMovDerecha(posE:Word): Word;
        function AnchoAlturaCajaMovIzquierda(posE:Word): Word;
        function AnchoAlturaCajaMovArriba(posE:Word): Word;
        function AnchoAlturaCajaMovAbajo(posE:Word): Word;
    End;
implementation

{ TCaja }

constructor TCaja.Create;
begin
  Self.notMovimiento := Vector.Create;
end;

//procedimientos________________________________________________________________

procedure TCaja.dimensionar(dim: Word);
begin
 if(dim > 0)AND(dim <= MAXE)then
   begin
    dimension := dim;
    DimensionarNotMoviento;
   end;
end;

procedure TCaja.DimensionarNotMoviento;
begin
 notMovimiento.setDimension(self.dimension);
end;

procedure TCaja.CargarImagenGeneral(direccionImagen: String);
begin
 self.ImagenGeneral := TBitmap.Create;
 self.rutaImagenGeneral := direccionImagen;
 ImagenGeneral.LoadFromFile(rutaImagenGeneral);
 widthGeneral := ImagenGeneral.Width;
 heightGeneral := ImagenGeneral.Height;
end;

procedure TCaja.cargarImagenesCajas;
 var
   i : Word;
begin
 for i := 1 to dimension do
   begin
     elementos[i].NroDeCaja := i;
     elementos[i].ImagenCaja := TBitmap.Create;
     elementos[i].ImagenCaja := ImagenGeneral;
     elementos[i].widthImagen := widthGeneral;
     elementos[i].heightImagen := heightGeneral;
   end;
end;

procedure TCaja.dibujar(pantalla: TCanvas);
 var
   i : Word;
begin
 for i := 1 to dimension do
  begin
    pantalla.Draw(elementos[i].x,elementos[i].y,elementos[i].ImagenCaja);
  end;
end;

procedure TCaja.cambiarBmpElemento(posE: Word; nuevoBmp: TBitmap);
begin
 if(posE > 0)AND(posE <= dimension)then
   elementos[posE].ImagenCaja := nuevoBmp;
end;

procedure TCaja.cambiarImagenElemento(posE: Word; rutaBMP: String);
begin
 if(posE > 0)AND(posE <= dimension)then
    elementos[posE].ImagenCaja.LoadFromFile(rutaBMP);
end;

procedure TCaja.cambiarXYElemento(posE, xa, ya: Word);
begin
 if(posE > 0)AND(posE <= dimension)then
  begin
   elementos[posE].x := xa;
   elementos[posE].y := ya;
  end;
end;

procedure TCaja.SetCajaMov(pos: Word);
begin
 cajaMov := pos;
end;

procedure TCaja.SetXElement(posE:Word;xi: Word);
begin
 if(posE > 0)AND(posE <= dimension)then
  elementos[posE].x := xi;
end;

procedure TCaja.SetYElement(posE:Word;yi: Word);
begin
 if(posE > 0)AND(posE <= dimension)then
  elementos[posE].y := yi;
end;

//funciones_____________________________________________________________________

function TCaja.ObtCajaMov: Word;
begin
 Result := cajaMov;
end;

function TCaja.ObtHeigthElement(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
   Result := elementos[posE].heightImagen;
end;

function TCaja.ObtNroXCaja(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
  Result := elementos[posE].NroDeCaja;
end;

function TCaja.ObtWidthElement(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
  Result := elementos[posE].widthImagen;
end;

function TCaja.ObtXElement(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
   Result := elementos[posE].x;
end;

function TCaja.ObtYElement(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
   Result := elementos[posE].y;
end;

function TCaja.getDimension: Word;
begin
 Result := dimension;
end;

function TCaja.ObtAlturaCaja(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
   Result := elementos[posE].x + heightGeneral;
end;

function TCaja.ObtAnchoCaja(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
   Result := elementos[posE].x + widthGeneral;
end;

{_______Choque de caja con muro_______}

function TCaja.choqueMuroIzquierda(Muros: TMuro): boolean;
begin

end;

function TCaja.choqueMuroAbajo(Muros: TMuro): boolean;
begin
end;

function TCaja.choqueMuroArriba(Muros: TMuro): boolean;
begin

end;

procedure TCaja.choqueMuroDerecha(Muros: TMuro);
 var i,j,posV:Word;
begin
 i := 1;
 posV := 1;
  while(i <= dimension)do
   begin
    j := 1;
     while(j <= Muros.getDimension)do
      begin
        if(MovDerechaMuro(i,j,Muros))then
          begin
           notMovimiento.modElement(posV,elementos[i].NroDeCaja);
           posV := posV + 1;
          end;
        j := j + 1;
      end;
     i := i + 1;
    end;
end;

{____Verificar so existe choque con muros______}

function TCaja.MovDerechaMuro(posE:Word;posEM:Word;Muros: TMuro): boolean;
begin
 if((elementos[posE].y = Muros.ObtYPosElement(posEM))AND((elementos[posE].x+DISTANCIA) = Muros.ObtXPosElement(posEM))AND
   (AnchoAlturaCajaMovDerecha(posE) = Muros.AnchoAlturaMuros(posEM)))then
    Result := true
      else
         Result := false;
end;

function TCaja.AnchoAlturaCajaMovDerecha(posE:Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
  Result :=((ObtAnchoCaja(posE)+DISTANCIA)+ObtAlturaCaja(posE))
end;

function TCaja.AnchoAlturaCajaMovIzquierda(posE:Word): Word;
begin
 Result := ((ObtAnchoCaja(posE)-DISTANCIA)+ObtAlturaCaja(posE));
end;

function TCaja.AnchoAlturaCajaMovAbajo(posE:Word): Word;
begin
 Result := (ObtAnchoCaja(posE)+(ObtAlturaCaja(posE)+DISTANCIA));
end;

function TCaja.AnchoAlturaCajaMovArriba(posE:Word): Word;
begin
 Result := (ObtAnchoCaja(posE)+(ObtAlturaCaja(posE)-DISTANCIA));
end;
end.
