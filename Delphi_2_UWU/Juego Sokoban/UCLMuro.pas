unit UCLMuro;

interface
 uses Graphics, SysUtils, Dialogs;
 const
    MAXE = 1000;
  Type
    Muros = record
        x,y : Word;
        ImagenMuro : TBitmap;
        widthImagen,heightImagen : Word;
    end;

    TMuro = Class
      private
        elementos : array[1..MAXE] of Muros;
        dimension : Word;
        ImagenGeneral : Tbitmap;
        rutaImagenGeneral : String;
        widthGeneral,heightGeneral : Word;
      public
       constructor crearMuros();
//procedimientos________________________________________________________________
        procedure cargarImagen();
        procedure dibujar(pantalla : TCanvas);
        procedure CargarImagenGeneral(direccionImagen : String);
        procedure dimensionar(dim:Word);
        procedure cambiarXYElemento(posE:Word;xa,ya : Word);
        procedure cambiarImagenElemento(posE:Word;rutaBMP:String);
        procedure cambiarBmpElemento(posE:Word;nuevoBmp:TBitmap);

//funciones_____________________________________________________________________
        function getDimension():Word;
        function ObtImagen():TBitmap;
        function ObtElementos(posE:Word):Muros;
        function ObtXPosElement(posE:Word):Word;
        function ObtYPosElement(posE:Word): Word;
        function ObtAnchoElement(posE:Word):Word;
        function ObtAlturaElement(posE:Word):Word;
        function AnchoAlturaMuros(posE:WOrd):Word;
    End;

implementation

{ Muro }
constructor TMuro.crearMuros;
 var
   i:Word;
   xi,yi:Word;
begin
 i := 1;
 xi := 1;
 yi := 1;
   while(i <= dimension)do
    begin
      elementos[i].x := xi;
      elementos[i].y := yi;
      xi := xi + 32;
      i := i + 1;
    end;
end;

//procedimientos________________________________________________________________

procedure TMuro.CargarImagenGeneral(direccionImagen : String);
begin
 ImagenGeneral := TBitmap.Create;
 Self.rutaImagenGeneral := direccionImagen;
 ImagenGeneral.LoadFromFile(rutaImagenGeneral);
 widthGeneral := ImagenGeneral.Width;
 heightGeneral := ImagenGeneral.Height;
 ImagenGeneral.Transparent := true;
 ImagenGeneral.TransparentColor := ImagenGeneral.Canvas.Pixels[widthGeneral-1,heightGeneral-1];
end;

function TMuro.AnchoAlturaMuros(posE: WOrd): Word;
begin
 Result := ObtAnchoElement(posE)+ObtAlturaElement(posE);
 //ShowMessage(inttostr(ObtAnchoElement(posE)+ObtAlturaElement(posE)));
end;

procedure TMuro.cambiarBmpElemento(posE:Word;nuevoBmp: TBitmap);
begin
  if(posE > 0)AND(posE <= dimension)then
    elementos[posE].ImagenMuro := nuevoBMP;
end;

procedure TMuro.cambiarImagenElemento(posE:Word;rutaBMP: String);
begin
  if(posE > 0)AND(posE <= dimension)then
   begin
     elementos[posE].ImagenMuro.LoadFromFile(rutaBMP);
   end;
end;

procedure TMuro.cambiarXYElemento(posE:Word;xa, ya: Word);
begin
 if(posE > 0)AND(posE <= dimension)AND(xa > 0)AND(ya > 0)then
  begin
   elementos[posE].x := xa;
   elementos[posE].y := ya;
  end;
end;

procedure TMuro.cargarImagen();
 var
   i : Word;
begin
 for i := 1 to dimension do
   begin
     elementos[i].ImagenMuro := TBitmap.Create;
     elementos[i].ImagenMuro := ImagenGeneral;
     elementos[i].widthImagen := widthGeneral;
     elementos[i].heightImagen := heightGeneral;
   end;
end;

procedure TMuro.dibujar(pantalla: TCanvas);
var i:Word;
begin
 i := 1;
 while(i <= dimension)do
  begin
   pantalla.Draw(elementos[i].x,elementos[i].y,elementos[i].ImagenMuro);
   i := i + 1;
  end;
end;

procedure TMuro.dimensionar(dim: Word);
begin
 if(dim >= 0)AND(dim <= MAXE)then
  self.dimension := dim;
end;

//funciones_____________________________________________________________________

function TMuro.getDimension: Word;
begin
 Result := self.dimension;
end;


function TMuro.ObtElementos(posE: Word): Muros;
begin
 if(posE > 0)AND(posE <= 10)then
   Result := elementos[posE];
end;

function TMuro.ObtImagen: TBitmap;
begin
 Result := ImagenGeneral;
end;

function TMuro.ObtXPosElement(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
     Result := elementos[posE].x;
end;

function TMuro.ObtYPosElement(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
   Result := elementos[posE].y;
end;

function TMuro.ObtAlturaElement(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
  Result := (elementos[posE].y+heightGeneral);
end;

function TMuro.ObtAnchoElement(posE: Word): Word;
begin
 if(posE > 0)AND(posE <= dimension)then
   Result := (elementos[posE].x + widthGeneral);
end;

end.
