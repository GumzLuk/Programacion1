unit FormVect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Menus,UCVector,Math;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    cambiardimension1: TMenuItem;
    obtenerdimension1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Button3: TButton;
    procedimientos1: TMenuItem;
    funciones1: TMenuItem;
    insertElement1: TMenuItem;
    insertElement2: TMenuItem;
    elimElement1: TMenuItem;
    getElement1: TMenuItem;
    busqLineal1: TMenuItem;
    busqLinealOrdAsc1: TMenuItem;
    vistadelvector1: TMenuItem;
    busqBinaria1: TMenuItem;
    frecDNum1: TMenuItem;
    numMAxFrec1: TMenuItem;
    N1: TMenuItem;
    Ex1: TMenuItem;
    sortSeleccion1: TMenuItem;
    sortBurbuja1: TMenuItem;
    shellSort1: TMenuItem;
    MergeSort1: TMenuItem;
    QuickSort1: TMenuItem;
    Button4: TButton;
    Label4: TLabel;
    EsFracc1: TMenuItem;
    vectorDePrimos1: TMenuItem;
    vectorDeNoPrimos1: TMenuItem;
    Mezcla2Vectores1: TMenuItem;
    OrdPrimoNoPrimo1: TMenuItem;
    exchangeSortFrecuencia1: TMenuItem;
    FrecDDigEnElem1: TMenuItem;
    ejercicios1: TMenuItem;
    ejercicios2: TMenuItem;
    QuickSortReverse1: TMenuItem;
    addElement1: TMenuItem;
    insertElementDerecha1: TMenuItem;
    pasarXParametroNuevosElems1: TMenuItem;
    ObtDate1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure cambiardimension1Click(Sender: TObject);
    procedure obtenerdimension1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure busqLineal1Click(Sender: TObject);
    procedure busqLinealOrdAsc1Click(Sender: TObject);
    procedure vistadelvector1Click(Sender: TObject);
    procedure insertElement2Click(Sender: TObject);
    procedure insertElement1Click(Sender: TObject);
    procedure cargarVectAlGrid();
    procedure elimElement1Click(Sender: TObject);
    procedure busqBinaria1Click(Sender: TObject);
    procedure frecDNum1Click(Sender: TObject);
    procedure numMAxFrec1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Ex1Click(Sender: TObject);
    procedure sortSeleccion1Click(Sender: TObject);
    procedure sortBurbuja1Click(Sender: TObject);
    procedure shellSort1Click(Sender: TObject);
    procedure MergeSort1Click(Sender: TObject);
    procedure QuickSort1Click(Sender: TObject);
    procedure cargaAleatoria(a,b:Word);
    procedure Button4Click(Sender: TObject);
    procedure EsFracc1Click(Sender: TObject);
    procedure vectorDePrimos1Click(Sender: TObject);
    procedure vectorDeNoPrimos1Click(Sender: TObject);
    procedure Mezcla2Vectores1Click(Sender: TObject);
    procedure OrdPrimoNoPrimo1Click(Sender: TObject);
    procedure exchangeSortFrecuencia1Click(Sender: TObject);
    procedure FrecDDigEnElem1Click(Sender: TObject);
    procedure getElement1Click(Sender: TObject);
    procedure ejercicios2Click(Sender: TObject);
    procedure QuickSortReverse1Click(Sender: TObject);
    procedure addElement1Click(Sender: TObject);
    procedure insertElementDerecha1Click(Sender: TObject);
    procedure pasarXParametroNuevosElems1Click(Sender: TObject);
    procedure ObtDate1Click(Sender: TObject);

  private
    { Private declarations }
    Vect:Vector;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.addElement1Click(Sender: TObject);
var
 ele:Real;
begin
 ele := StrToFloat(InputBox('ELEMENTO','ingrese el elemento : ',''));
 Vect.addElement(ele);
end;

procedure TForm1.busqBinaria1Click(Sender: TObject);
var n:Real;
begin
 n :=  StrToFloat(InputBox('BUSQUEDA BINARIA','Ingres un numero ',''));
 ShowMessage(IntToStr(Vect.busqBinaria(n)));
end;

procedure TForm1.busqLineal1Click(Sender: TObject);
var n:Real;
begin
 n :=  StrToFloat(InputBox('BUSQUEDA LINEAL','Ingres un numero ',''));
 ShowMessage(IntToStr(Vect.busqLineal(n)));
end;

procedure TForm1.busqLinealOrdAsc1Click(Sender: TObject);
var n:Real;
begin
 n :=  StrToFloat(InputBox('BUSQUEDA LINEAL ORDENADA','Ingres un numero ',''));
 ShowMessage(IntToStr(Vect.busqLinealOrdAsc(n)));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 StringGrid1.ColCount := StrToInt(InputBox('DIMENSION','Ingrese numero : ',''));
 Vect.setDimension(StringGrid1.ColCount);
end;

procedure TForm1.Button2Click(Sender: TObject);
var i:Word;
begin
  for i := 1 to Vect.getDim do
     Vect.modElement(i,StrToFloat(StringGrid1.Cells[i-1,0]));
end;

procedure TForm1.Button3Click(Sender: TObject);
var i:Word;
begin
 cargarVectAlGrid();
end;

procedure TForm1.Button4Click(Sender: TObject);
var posA,posB:Word;
begin
 posA := strToInt(InputBox('POSICION','ingrese inicio A : ',''));
 posB := strToInt(InputBox('POSICION','ingrese final B : ',''));
 cargaAleatoria(posA,posB);
 cargarVectAlGrid();
end;

procedure TForm1.cambiardimension1Click(Sender: TObject);
begin
 Vect.setDimension(StrToInt(InputBox('DIMENSION','ingrese un numero : ','')));
end;

procedure TForm1.cargarVectAlGrid;
var i:Word;
begin
 StringGrid1.ColCount := Vect.getDim();
   for i := 1 to Vect.getDim() do
     StringGrid1.Cells[i-1,0] := FloatToStr(Vect.getElement(i));
end;

procedure TForm1.ejercicios2Click(Sender: TObject);
begin
 Vect.OrdenarCeroYNoCero;
end;

procedure TForm1.elimElement1Click(Sender: TObject);
var posE:Word;
    ele:Real;
begin
 posE := strToInt(InputBox('POSICION','ingrese posicion : ',''));
 Vect.ElimElement(posE);
 cargarVectAlGrid();
end;

procedure TForm1.EsFracc1Click(Sender: TObject);
var
 ele:Real;
begin
 ele := StrToFloat(InputBox('ELEMENTO','ingrese el elemento : ',''));
   if(Vect.EsFraccion(ele))then ShowMessage('si es') else ShowMessage('No es');
 ShowMessage(inttostr(trunc(ele)));
end;

procedure TForm1.Ex1Click(Sender: TObject);
var posA,posB:Word;
begin
 posA := strToInt(InputBox('POSICION','ingrese posicion A : ',''));
 posB := strToInt(InputBox('POSICION','ingrese posicion B : ',''));
 Vect.exchangeElement(posA,posB);
end;

procedure TForm1.exchangeSortFrecuencia1Click(Sender: TObject);
begin
 vect.exchangeSortFrecuencia();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Vect := Vector.Create;
end;

procedure TForm1.FrecDDigEnElem1Click(Sender: TObject);
 var
  posE:Word;
  dig : byte;
begin
 posE := strToInt(InputBox('POSICION','ingrese la posicion del elemento: ',''));
 dig := strToInt(InputBox('DIGITO','ingrese el digito : ',''));
 ShowMessage(intToStr( Vect.FrecDDigEnElem(vect.getElement(posE),dig)));
end;

procedure TForm1.frecDNum1Click(Sender: TObject);
var
 ele:Real;
begin
 ele := StrToFloat(InputBox('ELEMENTO','ingrese el elemento : ',''));
 ShowMessage(intToStr(Vect.frecDNum(ele)));
end;

procedure TForm1.getElement1Click(Sender: TObject);
 var
  posE:Word;
begin
 posE := strToInt(InputBox('POSICION','ingrese posicion : ',''));
 ShowMessage(FloatTOStr(Vect.getElement(posE)));
end;

procedure TForm1.insertElement1Click(Sender: TObject);
var posE:Word;
    ele:Real;
begin
 posE := strToInt(InputBox('POSICION','ingrese posicion : ',''));
 ele := StrToFloat(InputBox('ELEMENTO','ingrese el elemento : ',''));
 Vect.insertElementIzquierda(posE,ele);
 cargarVectAlGrid();
end;

procedure TForm1.insertElement2Click(Sender: TObject);
var posE:Word;
    ele:Real;
begin
 posE := strToInt(InputBox('POSICION','ingrese posicion : ',''));
 ele := StrToFloat(InputBox('ELEMENTO','ingrese el elemento : ',''));
 Vect.modElement(posE,ele);
 //cargarVectAlGrid();
end;

procedure TForm1.insertElementDerecha1Click(Sender: TObject);
var posE:Word;
    ele:Real;
begin
 posE := strToInt(InputBox('POSICION','ingrese posicion : ',''));
 ele := StrToFloat(InputBox('ELEMENTO','ingrese el elemento : ',''));
 Vect.insertElementDerecha(posE,ele);
 //cargarVectAlGrid();
end;

procedure TForm1.MergeSort1Click(Sender: TObject);
begin
 Vect.MergeSort();
end;

procedure TForm1.Mezcla2Vectores1Click(Sender: TObject);
begin
 Vect.Mezcla2Vectores(vect.vectorDePrimos,vect.vectorDeNoPrimos);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 Vect.exchangeSort();
end;

procedure TForm1.numMAxFrec1Click(Sender: TObject);
begin
 ShowMessage(FloatToStr(Vect.numMaxFrec()));
end;

procedure TForm1.ObtDate1Click(Sender: TObject);
var
 da : real;
 sr : String;
begin
da :=vect.ObtDate;
sr := DateTimeToStr(vect.ObtDate);
ShowMessage(DateTimeToStr(vect.ObtDate));
ShowMessage(FloatToStr(da));
ShowMessage(sr);

end;

procedure TForm1.obtenerdimension1Click(Sender: TObject);
begin
 ShowMessage(IntToStr(Vect.getDim));
end;

procedure TForm1.OrdPrimoNoPrimo1Click(Sender: TObject);
begin
 Vect.OrdPrimoNoPrimo;
end;

procedure TForm1.pasarXParametroNuevosElems1Click(Sender: TObject);
 var
  elem : String;
begin
 elem := InputBox('ELEMENTOS','ingrese los elementos : ','');
 Vect.pasarXParametroNuevosElems(elem);
end;

procedure TForm1.QuickSort1Click(Sender: TObject);
begin
 Vect.QuickSort();
end;

procedure TForm1.QuickSortReverse1Click(Sender: TObject);
begin
 Vect.QuickSortReverse;
end;

procedure TForm1.shellSort1Click(Sender: TObject);
begin
 Vect.shellSort();
end;

procedure TForm1.sortBurbuja1Click(Sender: TObject);
begin
 Vect.bubbleSort();
end;

procedure TForm1.sortSeleccion1Click(Sender: TObject);
begin
 Vect.selectionSort();
end;

procedure TForm1.vectorDeNoPrimos1Click(Sender: TObject);
var
  VnoP : Vector;
begin
 VNoP := Vector.Create;
 VNoP := vect.vectorDeNoPrimos();
 ShowMessage(VNoP.getVector());
end;

procedure TForm1.vectorDePrimos1Click(Sender: TObject);
var
  VP : Vector;
begin
 VP := vector.Create;
 VP := vect.vectorDePrimos;
 ShowMessage(VP.getVector());
end;

procedure TForm1.vistadelvector1Click(Sender: TObject);
begin
 ShowMessage(Vect.getVector());
end;

procedure TForm1.cargaAleatoria(a, b: Word);
var i :Word;
begin
 if(Vect.getDim > 0)AND(Vect.getDim <= Vect.getMAXE)then
   begin
   for i := 1 to Vect.getDim do
     Vect.modElement(i , a+Random(b-a+1));
   end;
end;

end.
