unit UCVectorLista;

interface
 uses SysUtils;
 const MAXE = 124;

 Type
   Lista = record
     Registro : Cardinal;
     Nombre : String;
     Materia : String;
     Semestre : byte;
     Nota : Real;
   end;

  vector = Class
    private
      elementos : array[1..MAXE] of Lista;
      dimension : Word;

    public
//procedimiento_________________________________________________________________
      procedure dimensionar(dimension:Word);
      procedure modElement(posE:Word;List:Lista);
      procedure insertElement(posE:Word;List:Lista);
      procedure elimElement(posE:Word);

//funciones_____________________________________________________________________
      function getElement(posE:Word):Lista;
      function ListaNueva(Registro:Cardinal;Nombre,Materia:String;Semestre:byte;Nota:Real): Lista;
      function getDimension():Word;
      function promedioEstudiante(Registro : Cardinal):Real;
      function mejorEstudianteDeMateria(nomMateria:String):Cardinal;
  End;
implementation

{ vector }

//procedure_____________________________________________________________________

procedure vector.dimensionar(dimension: Word);
begin
 if(dimension > 0)AND(dimension <= MAXE)then
   self.dimension := dimension;
end;

procedure vector.insertElement(posE: Word; List: Lista);
 var
  i : Word;
begin
 if(posE > 0)AND(posE <= dimension)then
  begin
   dimension := dimension + 1;
    for i := dimension downto posE+1 do
      begin
        elementos[i] := elementos[i-1];
      end;
   elementos[posE].Registro := 0;
   elementos[posE].Nombre := '';
   elementos[posE].Materia := '';
   elementos[posE].Semestre := 0;
   elementos[posE].Nota := 0;
  end;
end;

procedure vector.modElement(posE: Word; List: Lista);
begin
 if(posE > 0)AND(posE <= dimension)then
  begin
    elementos[posE] := List;
  end;
end;

procedure vector.elimElement(posE: Word);
 var
  i : Word;
begin
 if(posE > 0)AND(posE <= dimension)then
  begin
    for i := posE to dimension-1 do
       begin
         elementos[i] := elementos[i+1];
       end;
    dimension := dimension - 1;
  end;
end;

//funciones_____________________________________________________________________

function vector.ListaNueva(Registro:Cardinal;Nombre,Materia:String;Semestre:byte;Nota:Real): Lista;
 var
  ListaNueva : Lista;
begin
 ListaNueva.Registro := Registro;
 ListaNueva.Nombre := Nombre;
 ListaNueva.Materia := Materia;
 ListaNueva.Semestre := Semestre;
 ListaNueva.Nota := Nota;
 Result := ListaNueva;
end;

function vector.getDimension: Word;
begin
 Result := dimension;
end;

function vector.getElement(posE: Word): Lista;
begin
 if(posE > 0)AND(posE <= dimension)then
  begin
    Result := elementos[posE];
  end;
end;

function vector.promedioEstudiante(Registro: Cardinal): Real;
var
 i,cont : Word;
 sumaC : Real;
begin
 cont := 0;
 sumaC := 0;
 for i := 1 to dimension do
  begin
    if(elementos[i].Registro = Registro)then
     begin
       sumaC := sumaC + elementos[i].Nota;
       cont := cont + 1;
     end;
  end;
 Result := (sumaC / cont);
end;

function vector.mejorEstudianteDeMateria(nomMateria: String): Cardinal;
 var
  i : Word;
  may : Real;
  regM : Cardinal;
begin
 may := -1;
 regM := 0;
  for i := 1 to dimension do
    begin
      if(elementos[i].Materia = nomMateria)AND(elementos[i].Nota > may)then
       begin
         may := elementos[i].Nota;
         regM := elementos[i].Registro;
       end;
    end;
 Result := regM;
end;

end.