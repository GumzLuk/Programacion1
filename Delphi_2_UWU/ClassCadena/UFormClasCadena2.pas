unit UFormClasCadena2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, UClasCadena2;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    MainMenu1: TMainMenu;
    Menuprincipal1: TMenuItem;
    CargarTexto1: TMenuItem;
    CargarTexto2: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Ejercicios1: TMenuItem;
    Ejercicios2: TMenuItem;
    Nrodepalabras1: TMenuItem;
    Nrodepalabras2: TMenuItem;
    Palabrasquecomiencenenconsonante1: TMenuItem;
    Obtenerpalabrasiguiente1: TMenuItem;
    Obtenerpalabraxposicion1: TMenuItem;
    Palabrasquecomiencenytermineenconsonante1: TMenuItem;
    InsertPalDerecha1: TMenuItem;
    mover1: TMenuItem;
    insertChar1: TMenuItem;
    ElimCha1: TMenuItem;
    modChar1: TMenuItem;
    obtenerlongitud1: TMenuItem;
    addPalabraIzquierda1: TMenuItem;
    insertarpalabra1: TMenuItem;
    Palabramenorxalfaabet1: TMenuItem;
    eliminarxposicionpalabra1: TMenuItem;
    examen1: TMenuItem;
    examen2: TMenuItem;
    comprabarsiesnu1: TMenuItem;
    ModPalXPos1: TMenuItem;
    EliminarCharsXPos1: TMenuItem;
    prueba1: TMenuItem;
    copy1: TMenuItem;
    SubCadXPos1: TMenuItem;
    EstaLaSubCad1: TMenuItem;
    PosDePalConSubCad1: TMenuItem;
    getHora1: TMenuItem;
    probarLongitud1: TMenuItem;
    MayPosPal1: TMenuItem;
    IgualLong1: TMenuItem;
    examen41: TMenuItem;
    alterar1: TMenuItem;
    posComoNExamen1: TMenuItem;
    MayXParametros1: TMenuItem;
    IntercambiarPosDPal1: TMenuItem;
    MayXAlfabetParametros1: TMenuItem;
    auxi21: TMenuItem;
    auxi22: TMenuItem;
    redondeo1: TMenuItem;
    sacarFraccion1: TMenuItem;
    Examen51: TMenuItem;
    procedure CargarTexto1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CargarTexto2Click(Sender: TObject);
    procedure Ejercicios2Click(Sender: TObject);
    procedure Nrodepalabras1Click(Sender: TObject);
    procedure Nrodepalabras2Click(Sender: TObject);
    procedure Palabrasquecomiencenenconsonante1Click(Sender: TObject);
    procedure Obtenerpalabrasiguiente1Click(Sender: TObject);
    procedure Obtenerpalabraxposicion1Click(Sender: TObject);
    procedure Palabrasquecomiencenytermineenconsonante1Click(Sender: TObject);
    procedure InsertPalDerecha1Click(Sender: TObject);
    procedure mover1Click(Sender: TObject);
    procedure modChar1Click(Sender: TObject);
    procedure ElimCha1Click(Sender: TObject);
    procedure obtenerlongitud1Click(Sender: TObject);
    procedure insertChar1Click(Sender: TObject);
    procedure addPalabraIzquierda1Click(Sender: TObject);
    procedure insertarpalabra1Click(Sender: TObject);
    procedure Palabramenorxalfaabet1Click(Sender: TObject);
    procedure eliminarxposicionpalabra1Click(Sender: TObject);
    procedure examen2Click(Sender: TObject);
    procedure comprabarsiesnu1Click(Sender: TObject);
    procedure ModPalXPos1Click(Sender: TObject);
    procedure EliminarCharsXPos1Click(Sender: TObject);
    procedure copy1Click(Sender: TObject);
    procedure SubCadXPos1Click(Sender: TObject);
    procedure EstaLaSubCad1Click(Sender: TObject);
    procedure PosDePalConSubCad1Click(Sender: TObject);
    procedure getHora1Click(Sender: TObject);
    procedure probarLongitud1Click(Sender: TObject);
    procedure MayPosPal1Click(Sender: TObject);
    procedure IgualLong1Click(Sender: TObject);
    procedure examen41Click(Sender: TObject);
    procedure alterar1Click(Sender: TObject);
    procedure posComoNExamen1Click(Sender: TObject);
    procedure MayXParametros1Click(Sender: TObject);
    procedure IntercambiarPosDPal1Click(Sender: TObject);
    procedure MayXAlfabetParametros1Click(Sender: TObject);
    procedure auxi22Click(Sender: TObject);
    procedure redondeo1Click(Sender: TObject);
    procedure sacarFraccion1Click(Sender: TObject);
    procedure Examen51Click(Sender: TObject);

  private
    { Private declarations }
   cadT : Cadena;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.addPalabraIzquierda1Click(Sender: TObject);
var pal:String;
begin
pal := InputBox('','Ingrese la palabra','');
cadT.addPalIzquierda(pal);
end;

procedure TForm1.alterar1Click(Sender: TObject);
var   posi : Cardinal;
begin
posi := StrToInt(InputBox('','posicion',''));
 ShowMessage(cadt.alterar(posi));
end;

procedure TForm1.auxi22Click(Sender: TObject);
begin
 caDt.ordenarXOrdAlfabetico;
end;

procedure TForm1.CargarTexto1Click(Sender: TObject);
var
  tex:String;
begin
 tex := InputBox('TEXTO',' Introduce el texto','');
 cadT.cargarTexto(tex);
 Edit1.Text := cadT.getCadena;
end;

procedure TForm1.CargarTexto2Click(Sender: TObject);
begin
 Edit2.Text := cadT.getCadena;
end;

procedure TForm1.comprabarsiesnu1Click(Sender: TObject);
var
    pal:String;
begin
pal := InputBox('','Ingrese la palabra','');
if(cadt.EsUnNumero(pal))then
 ShowMessage('si') else  ShowMessage('no');
end;

procedure TForm1.copy1Click(Sender: TObject);
var pal:String;
begin
 pal := InputBox('','Ingrese la palabra','');
 ShowMessage(IntToStr(cadT.GetDia(pal)));
end;

procedure TForm1.Ejercicios2Click(Sender: TObject);
begin
 ShowMessage(IntToStr(cadT.nroDeVocales))
end;

procedure TForm1.ElimCha1Click(Sender: TObject);
var   posi : Cardinal;
begin
posi := StrToInt(InputBox('','posicion',''));
cadT.ElimChar(posi);
end;

procedure TForm1.EliminarCharsXPos1Click(Sender: TObject);
 var  posI,PosF:Cardinal;
begin
posI := StrToInt(InputBox('','posicion inicial',''));
posF := StrToInt(InputBox('','posicion final',''));
 cadT.ElimCharsXPos(posI,posF);
end;

procedure TForm1.eliminarxposicionpalabra1Click(Sender: TObject);
 var  pos:Word;
begin
pos := StrToInt(InputBox('','posicion',''));
cadT.elimXPos(pos);
end;

procedure TForm1.EstaLaSubCad1Click(Sender: TObject);

var  pal,sub:String;
begin
 pal := InputBox('','Ingrese la palabra','');
 sub := InputBox('','Ingrese la palabra','');
  if(cadT.EstaLaSubCad(pal,sub))then ShowMessage('si') else ShowMessage('No')
end;

procedure TForm1.examen2Click(Sender: TObject);
begin
ShowMessage(IntTOStr(cadT.examVerificar));
end;

procedure TForm1.examen41Click(Sender: TObject);
var posi : Cardinal;
begin
 posi := StrToInt(InputBox('','Mayor',''));
 ShowMessage(cadT.examen4(posi));
end;

procedure TForm1.Examen51Click(Sender: TObject);
var N:String;
    redo:byte;
begin
 N := InputBox('','numeros','');
 redo := StrToInt(InputBox('','redondeo',''));
 ShowMessage(IntToStr(cadT.Examen5(N,redo)));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
cadT := Cadena.Create;
end;

procedure TForm1.getHora1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(cadT.getHora(cadT.getCadena)));
end;

procedure TForm1.IgualLong1Click(Sender: TObject);
var posi : Cardinal;
begin
 posi := StrToInt(InputBox('','posicion',''));
  ShowMessage(IntToStr(cadT.IgualLong(posi)));
end;

procedure TForm1.insertarpalabra1Click(Sender: TObject);
var posi : Cardinal;
    pal:String;
begin
posi := StrToInt(InputBox('','posicion',''));
pal := InputBox('','Ingrese la palabra','');
 cadT.insertPal(posi,pal);
end;

procedure TForm1.insertChar1Click(Sender: TObject);
var chr:char;
    posi : Cardinal;
begin
posi := StrToInt(InputBox('','posicion',''));
chr :=InputBox('','char a colocar','')[1];
cadT.insertChar(posi,chr);
end;

procedure TForm1.InsertPalDerecha1Click(Sender: TObject);
var pal:String;
begin
pal := InputBox('','Ingrese la palabra','');
cadT.addPalDerecha(pal);
end;


procedure TForm1.IntercambiarPosDPal1Click(Sender: TObject);
var posA,posB:Word;
begin
 posA:= StrToInt(InputBox('','Posicion A',''));
 posB:= StrToInt(InputBox('','Posicion B',''));
 cadT.IntercambiarPosDPal(posA,posB);
end;

procedure TForm1.MayPosPal1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(cadT.MayPosPal));
end;

procedure TForm1.MayXAlfabetParametros1Click(Sender: TObject);
var   n:Cardinal;
begin
 n := StrToInt(InputBox('','posicion',''));
 ShowMessage(IntToStr(cadT.MayXAlfabetParametros(n)));
end;

procedure TForm1.MayXParametros1Click(Sender: TObject);
var n:Cardinal;
begin
  n := cadT.posComoNumero;
  ShowMessage(IntToStr(cadT.MayXLongParametros(n)));
end;

procedure TForm1.modChar1Click(Sender: TObject);
var chr:char;
    posi : Cardinal;
begin
posi := StrToInt(InputBox('','posicion',''));
chr :=InputBox('','char a colocar','')[1];
cadT.modChar(posi,chr);
end;

procedure TForm1.ModPalXPos1Click(Sender: TObject);
var posi : Cardinal;
    pal:String;
begin
 posi := StrToInt(InputBox('','posicion',''));
 pal := InputBox('','Ingrese la palabra','');
 cadT.modPalabraXPos(posi,pal);
end;

procedure TForm1.mover1Click(Sender: TObject);
var i:Word;
    posi : Cardinal;
begin
posi := StrToInt(InputBox('','Posicion',''));
i := StrToInt(InputBox('','nro de pos a mover',''));
cadT.moverPosX(posi,i);
end;

procedure TForm1.Nrodepalabras1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(cadT.CantDPal));
end;

procedure TForm1.Nrodepalabras2Click(Sender: TObject);
begin
 ShowMessage(IntTOStr(cadT.nroDePalFinVocal));
end;

procedure TForm1.obtenerlongitud1Click(Sender: TObject);
begin
 ShowMessage(IntToStr(cadT.getLong));
end;

procedure TForm1.Obtenerpalabrasiguiente1Click(Sender: TObject);
var i:cardinal;
begin
 i := StrToInt(InputBox('Ingrese posicion','',''));
 ShowMessage(cadT.getPalSig(i));
 ShowMessage(IntToStr(i));
end;

procedure TForm1.Obtenerpalabraxposicion1Click(Sender: TObject);
var i:cardinal;
begin
 i := StrToInt(InputBox('Ingrese posicion','',''));
 ShowMessage(cadT.getPalXPos(i));
end;

procedure TForm1.Palabramenorxalfaabet1Click(Sender: TObject);
begin
 ShowMessage(cadT.palDMenorOrdAlfabet);
end;

procedure TForm1.Palabrasquecomiencenenconsonante1Click(Sender: TObject);
begin
 ShowMessage(IntToStr(cadT.nroDePalInicConso));
end;

procedure TForm1.Palabrasquecomiencenytermineenconsonante1Click(
  Sender: TObject);
begin
ShowMessage(IntTOStr(cadT.nroDePalInicEFinCOnso));
end;

procedure TForm1.posComoNExamen1Click(Sender: TObject);
begin
ShowMessage(intToStr(cadT.posComoNumero));
end;

procedure TForm1.PosDePalConSubCad1Click(Sender: TObject);
 var   subCad:String;
begin
subCad := InputBox('','Ingrese la palabra','');
ShowMessage(intToStr(cadT.PosDePalConSubCad(subcad)));
end;

procedure TForm1.probarLongitud1Click(Sender: TObject);
var  pos: Cardinal;
begin
pos := StrToInt(InputBox('','Posicion',''));
ShowMessage(intToStr(cadT.probarLongitud(pos)));
end;

procedure TForm1.redondeo1Click(Sender: TObject);
var  N: string;
    redon:byte;
begin
N := (InputBox('','Posicion',''));
redon := StrToInt(InputBox('','Posicion',''));
Cadt.Examen5(N,redon);
end;

procedure TForm1.sacarFraccion1Click(Sender: TObject);
var  N : String;
begin
N := InputBox('','Numero','');
ShowMessage(intToStr(cadT.SacarFracc(N)));
end;

procedure TForm1.SubCadXPos1Click(Sender: TObject);
var  posi,posF : Cardinal;
begin
posI := StrToInt(InputBox('','Posicion',''));
posF := StrToInt(InputBox('','Posicion',''));
ShowMessage(cadT.SubCadXPos(cadT.getCadena,posI,posF));
end;

end.