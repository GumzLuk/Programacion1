unit UFormNumero;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,UCNumero,Math;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    Numero1: TMenuItem;
    Numero2: TMenuItem;
    Obtenervalor1: TMenuItem;
    getNDig1: TMenuItem;
    getPosDig1: TMenuItem;
    delDigit1: TMenuItem;
    Ejercicios1: TMenuItem;
    Ejercicios2: TMenuItem;
    Edit2: TEdit;
    Actualizar1: TMenuItem;
    digitomayor1: TMenuItem;
    invertirnumero1: TMenuItem;
    ModDigPos1: TMenuItem;
    frecuenciadedigito1: TMenuItem;
    getCantDig2Cardinal1: TMenuItem;
    FrecDeDigCardinalbyte1: TMenuItem;
    OrdenAscendente1: TMenuItem;
    OrdenDescendente1: TMenuItem;
    digitomenor1: TMenuItem;
    Esprimo1: TMenuItem;
    Espar1: TMenuItem;
    HexToDec1: TMenuItem;
    pruenbas1: TMenuItem;
    elimarceroscero1: TMenuItem;
    SacarNXPos1: TMenuItem;
    DecToRomano1: TMenuItem;
    getPosDigCardinalbyte1: TMenuItem;
    FrecDeNumero1: TMenuItem;
    ElimarNDigito1: TMenuItem;
    InsertDigit1: TMenuItem;
    SubNMenor1: TMenuItem;
    CantDCeros1: TMenuItem;
    oLiteral1: TMenuItem;
    oBaseN1: TMenuItem;
    Orde1: TMenuItem;
    verrificarfrac1: TMenuItem;
    Examen1: TMenuItem;
    Examen2: TMenuItem;
    addIzquierda1: TMenuItem;
    ElimTodosLosRep1: TMenuItem;
    ParDDigSuman101: TMenuItem;
    SacarTodoDigX1: TMenuItem;
    Digitofrecuenciamayor1: TMenuItem;
    auxiliar1: TMenuItem;
    auxiliar2: TMenuItem;
    elimDigRepetSolo11: TMenuItem;
    ElimSubNumero1: TMenuItem;
    transfRealAEntero1: TMenuItem;
    transfRealAEnteroCopy1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    funciones1: TMenuItem;
    ieneExtrasLIT1: TMenuItem;
    LiteralExtra1: TMenuItem;
    oLiteral2: TMenuItem;
    procedure Numero2Click(Sender: TObject);
    procedure Obtenervalor1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getNDig1Click(Sender: TObject);
    procedure getPosDig1Click(Sender: TObject);
    procedure delDigit1Click(Sender: TObject);
    procedure Ejercicios2Click(Sender: TObject);
    procedure Actualizar1Click(Sender: TObject);
    procedure digitomayor1Click(Sender: TObject);
    procedure invertirnumero1Click(Sender: TObject);
    procedure ModDigPos1Click(Sender: TObject);
    procedure frecuenciadedigito1Click(Sender: TObject);
    procedure getCantDig2Cardinal1Click(Sender: TObject);
    procedure FrecDeDigCardinalbyte1Click(Sender: TObject);
    procedure OrdenAscendente1Click(Sender: TObject);
    procedure OrdenDescendente1Click(Sender: TObject);
    procedure digitomenor1Click(Sender: TObject);
    procedure Esprimo1Click(Sender: TObject);
    procedure Espar1Click(Sender: TObject);
    procedure HexToDec1Click(Sender: TObject);
    procedure ConjVerfCeroCero1Click(Sender: TObject);
    procedure elimarceroscero1Click(Sender: TObject);
    procedure SacarNXPos1Click(Sender: TObject);
    procedure DecToRomano1Click(Sender: TObject);
    procedure getPosDigCardinalbyte1Click(Sender: TObject);
    procedure FrecDeNumero1Click(Sender: TObject);
    procedure ElimarNDigito1Click(Sender: TObject);
    procedure InsertDigit1Click(Sender: TObject);
    procedure SubNMenor1Click(Sender: TObject);
    procedure CantDCeros1Click(Sender: TObject);
    procedure oLiteral1Click(Sender: TObject);
    procedure oBaseN1Click(Sender: TObject);
    procedure digitod1Click(Sender: TObject);
    procedure verrificarfrac1Click(Sender: TObject);
    procedure Examen2Click(Sender: TObject);
    procedure addIzquierda1Click(Sender: TObject);
    procedure ElimTodosLosRep1Click(Sender: TObject);
    procedure ParDDigSuman101Click(Sender: TObject);
    procedure SacarTodoDigX1Click(Sender: TObject);
    procedure Digitofrecuenciamayor1Click(Sender: TObject);
    procedure Orde1Click(Sender: TObject);
    procedure auxiliar2Click(Sender: TObject);
    procedure elimDigRepetSolo11Click(Sender: TObject);
    procedure ElimSubNumero1Click(Sender: TObject);
    procedure transfRealAEntero1Click(Sender: TObject);
    procedure transfRealAEnteroCopy1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ieneExtrasLIT1Click(Sender: TObject);
    procedure LiteralExtra1Click(Sender: TObject);
    procedure oLiteral2Click(Sender: TObject);
  private
    { Private declarations }
     objN : Numero;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Actualizar1Click(Sender: TObject);
begin
Edit1.Text := intToStr(objN.getValor);
end;

procedure TForm1.addIzquierda1Click(Sender: TObject);
var
  dig:Cardinal;
begin
 dig := StrToInt(InputBox('','Ingrese digito : ',''));
objN.addDigsIzquierda(dig)
end;

procedure TForm1.auxiliar2Click(Sender: TObject);
var
  dig:byte;
begin
 dig := StrToInt(InputBox('','Ingrese digito : ',''));
  ShowMessage(IntToStr(objN.getPosDDig(dig)));
end;

procedure TForm1.Button1Click(Sender: TObject);
 var
  Nu : Cardinal;
begin
 Nu := StrToInt(Edit1.Text);
 objN.setValor(Nu);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Edit2.Text := IntToStr(ObjN.getValor);
end;

procedure TForm1.CantDCeros1Click(Sender: TObject);
begin
 ShowMessage(IntToStr(objN.CantDCeros));
end;

procedure TForm1.ConjVerfCeroCero1Click(Sender: TObject);
begin
 ShowMessage(IntToStr(objN.VerfCeroCero))
end;

procedure TForm1.DecToRomano1Click(Sender: TObject);
begin
 ShowMessage(ObjN.DeciToRomano());
end;

procedure TForm1.delDigit1Click(Sender: TObject);
var
  pos:Byte;
begin
 pos := StrToInt(InputBox('','Ingrese posicion : ',''));
 objN.delDigit(pos);
end;

procedure TForm1.digitod1Click(Sender: TObject);
begin
 ShowMessage(intToStr(objN.FrecDigDMayor));
end;

procedure TForm1.Digitofrecuenciamayor1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(objN.FrecDigDMayor));
end;

procedure TForm1.digitomayor1Click(Sender: TObject);
var pos,pos2:byte;
begin
 pos2 := StrToInt(InputBox('','Ingrese posicion : ',''));
 ShowMessage(IntToStr(objN.getDigMay(pos2,pos)));
end;

procedure TForm1.digitomenor1Click(Sender: TObject);
var pos,pos2:byte;
begin
 pos2 := StrToInt(InputBox('','Ingrese posicion : ',''));
 ShowMessage(IntToStr(objN.getDigMen(pos2,pos)));
end;

procedure TForm1.Ejercicios2Click(Sender: TObject);
var k:Cardinal;
    pos:byte;
begin
 pos := StrToInt(InputBox('','Ingrese posicion : ',''));
k:=Trunc(power(10,pos-1));

ShowMessage(IntToStr(objN.getValor div k)+' + '+IntToStr(objN.getValor mod k));
end;

procedure TForm1.elimarceroscero1Click(Sender: TObject);
begin
ShowMessage(IntToStr(objN.VerfCeroCero));
objN.ElimPosDConj(objN.VerfCeroCero);
end;

procedure TForm1.ElimarNDigito1Click(Sender: TObject);
 var dig:byte;
begin
  dig := StrToInt(InputBox('','Ingrese digito : ',''));
  objN.EliminarNDig(dig);
end;

procedure TForm1.elimDigRepetSolo11Click(Sender: TObject);
 var dig:byte;
begin
  dig := StrToInt(InputBox('','Ingrese digito : ',''));
   objN.elimDigRepetSolo1(dig);
end;

procedure TForm1.ElimSubNumero1Click(Sender: TObject);
 var subn:word;
begin
  subN := StrToInt(InputBox('','Ingrese el subNumero : ',''));
  objN.ElimSubNumero(subN);
end;

procedure TForm1.ElimTodosLosRep1Click(Sender: TObject);
begin
objN.ElimTodosLosRep;
end;

procedure TForm1.Espar1Click(Sender: TObject);
 var dig:byte;
begin
  dig := StrToInt(InputBox('','Ingrese digito : ',''));
 if(objN.EsPar(dig))then ShowMessage('Si par') else ShowMessage('No par');
end;

procedure TForm1.Esprimo1Click(Sender: TObject);
 var dig:byte;
begin
  dig := StrToInt(InputBox('','Ingrese digito : ',''));
  if(objN.EsPrimo(dig))then ShowMessage('Es primo') else ShowMessage('No primo');
end;

procedure TForm1.Examen2Click(Sender: TObject);
 var num:Cardinal;
begin
 num := StrToInt(InputBox('','Ingrese el numero : ',''));
 objN.OrdenExamen2(num);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
objN := Numero.Create;
end;

procedure TForm1.FrecDeDigCardinalbyte1Click(Sender: TObject);
 var b:byte;
     num:Cardinal;
begin
 num := StrToInt(InputBox('','Ingrese el numero : ',''));
 b := StrToInt(InputBox('','Ingrese digito : ',''));
 ShowMessage(IntToStr(objN.FrecDeDig2(num , b)));
end;

procedure TForm1.FrecDeNumero1Click(Sender: TObject);
var num : Cardinal;
begin
 num := StrToInt(InputBox('','Ingrese el numero : ',''));
 ShowMessage(IntToStr(objN.FrecNumero(num)));
end;

procedure TForm1.frecuenciadedigito1Click(Sender: TObject);
 var b:byte;
begin

 b := StrToInt(InputBox('','Ingrese digito : ',''));
 ShowMessage(IntToStr(objN.FrecDeDig(b)));
end;

procedure TForm1.getCantDig2Cardinal1Click(Sender: TObject);
var num : Cardinal;
begin
 num := StrToInt(InputBox('','Ingrese el numero : ',''));
 ShowMessage(IntToStr( objN.getCantDig(num)));
end;

procedure TForm1.getNDig1Click(Sender: TObject);
begin
ShowMessage('Nro de digitos : '+IntToStr(objN.getCantDig));
end;

procedure TForm1.getPosDig1Click(Sender: TObject);
var
  pos:Byte;
begin
 pos := StrToInt(InputBox('','Ingrese posicion : ',''));
 ShowMessage('El Digito : '+IntToStr(objN.getPosDig(pos)))
end;

procedure TForm1.getPosDigCardinalbyte1Click(Sender: TObject);
 var pos:byte;
    num:Cardinal;
begin
 num := StrToInt(InputBox('','Numero : ',''));
 pos := StrToInt(InputBox('','Posicion : ',''));
 ShowMessage(IntTOStr(ObjN.getPosDig2(num,pos)));
end;

procedure TForm1.HexToDec1Click(Sender: TObject);
var hex:String;
begin
 hex := InputBox('','','');
 ShowMessage(IntTOStr(ObjN.HexToDec(hex)));
end;

procedure TForm1.ieneExtrasLIT1Click(Sender: TObject);
begin
 if(objn.TieneExtrasLIT)then
  ShowMessage('Si')
   else   ShowMessage('No');
end;

procedure TForm1.InsertDigit1Click(Sender: TObject);
 var pos,dig:byte;
begin
  pos := StrToInt(InputBox('','Posicion : ',''));
  dig := StrToInt(InputBox('','Digito : ',''));
  objN.insertDigit(pos,dig)
end;

procedure TForm1.invertirnumero1Click(Sender: TObject);
begin
objN.invertirNumero;
end;

procedure TForm1.LiteralExtra1Click(Sender: TObject);
 var pos,dig:byte;
begin
pos := StrToInt(InputBox('','Posicion : ',''));
dig := StrToInt(InputBox('','Digito : ',''));
ShowMessage( ObjN.LiteralExtra(pos,dig));
end;

procedure TForm1.ModDigPos1Click(Sender: TObject);
 var pos,dig:byte;
begin
 pos := StrToInt(InputBox('','Posicion : ',''));
  dig := StrToInt(InputBox('','Digito : ',''));
  objN.modDigit(pos,dig);
end;

procedure TForm1.Numero2Click(Sender: TObject);
 var n:Cardinal;
begin
 n := StrToInt(InputBox('','valor : ',''));
 objN.setValor(n);
 Edit1.Text := IntToStr(objN.getValor);
end;

procedure TForm1.oBaseN1Click(Sender: TObject);
 var base:byte;
begin
  base := StrToInt(InputBox('','Ingrese la base : ',''));
  ShowMessage(ObjN.ToBaseN(base));
end;

procedure TForm1.Obtenervalor1Click(Sender: TObject);
begin
 Edit2.Text := '';
 Edit2.Text := IntTOStr(objN.getValor);

end;

procedure TForm1.oLiteral1Click(Sender: TObject);
begin
 ShowMessage(objN.ToLiteral());
end;

procedure TForm1.oLiteral2Click(Sender: TObject);
begin
 ShowMessage(ObjN.ToLiteral);
end;

procedure TForm1.Orde1Click(Sender: TObject);
begin
objN.ordenXFrecDescendente;
end;

procedure TForm1.OrdenAscendente1Click(Sender: TObject);
begin
 objN.ordenAscendente;
end;

procedure TForm1.OrdenDescendente1Click(Sender: TObject);
begin
objN.ordenDescendente;
end;

procedure TForm1.ParDDigSuman101Click(Sender: TObject);
begin
 ShowMessage(intToStr(objN.ParDDigSuman10));
end;

procedure TForm1.SacarNXPos1Click(Sender: TObject);
 var dig1,dig2:byte;
begin
  dig1 := StrToInt(InputBox('','PosI : ',''));
  dig2 := StrToInt(InputBox('','PosF : ',''));
  ShowMessage(IntTOStr(objN.SacarNXPos(dig1,dig2)));
end;

procedure TForm1.SacarTodoDigX1Click(Sender: TObject);
 var dig:byte;
begin
  dig := StrToInt(InputBox('','PosI : ',''));
  ShowMessage(IntTOStr(objN.SacarTodoDigX(dig)));
end;

procedure TForm1.SubNMenor1Click(Sender: TObject);
var cifras:byte;
begin
  cifras := StrToInt(InputBox('','De cuantas cifras : ',''));
  ShowMessage(IntTOStr(objN.SubNumMenor(cifras)));
end;

procedure TForm1.transfRealAEntero1Click(Sender: TObject);
 var elem : Real;
begin
 elem := StrToFloat(InputBox('CONVERTIR REAL A ENTERO','numero real : : ',''));
 ShowMessage(IntToStr( objN.transfRealAEntero(elem)));
end;

procedure TForm1.transfRealAEnteroCopy1Click(Sender: TObject);
 var elem : Real;
begin
 elem := StrToFloat(InputBox('CONVERTIR REAL A ENTERO','numero real : : ',''));
 ShowMessage(IntToStr( objN.transfRealAEnteroCopy(elem)));
end;

procedure TForm1.verrificarfrac1Click(Sender: TObject);
 var dig:Real;
begin
dig:= StrToFloat(InputBox('','PosI : ',''));
if(objN.EsFraccion(dig))then ShowMessage('tiene parte fracccionaria')
 else  ShowMessage('No tiene parte fracccionaria');
end;

end.
