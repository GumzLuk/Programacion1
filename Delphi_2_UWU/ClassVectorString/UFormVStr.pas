unit UFormVStr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Menus, UCVectStr;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    Button1: TButton;
    Dimension: TLabel;
    Menu1: TMenuItem;
    Menu2: TMenuItem;
    Button2: TButton;
    Label1: TLabel;
    Button3: TButton;
    Label2: TLabel;
    vervector1: TMenuItem;
    procedimientos1: TMenuItem;
    procedimientos2: TMenuItem;
    elimElement1: TMenuItem;
    insertElem1: TMenuItem;
    funciones1: TMenuItem;
    longitudElem1: TMenuItem;
    QuickSortLong1: TMenuItem;
    exchangeSortLong1: TMenuItem;
    QSortLong1: TMenuItem;
    Obt1erCharXPos1: TMenuItem;
    exchangeSortWord1: TMenuItem;
    QuickSortWord1: TMenuItem;
    AumentoDimensionExtender1: TMenuItem;
    ExtenderVector1: TMenuItem;
    EliminarElementMayorUnString1: TMenuItem;
    ejericicos1: TMenuItem;
    EliminarElemenRep1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure vervector1Click(Sender: TObject);
    procedure procedimientos2Click(Sender: TObject);
    procedure elimElement1Click(Sender: TObject);
    procedure insertElem1Click(Sender: TObject);
    procedure longitudElem1Click(Sender: TObject);
    procedure QuickSortLong1Click(Sender: TObject);
    procedure exchangeSortLong1Click(Sender: TObject);
    procedure QSortLong1Click(Sender: TObject);
    procedure Obt1erCharXPos1Click(Sender: TObject);
    procedure exchangeSortWord1Click(Sender: TObject);
    procedure QuickSortWord1Click(Sender: TObject);
    procedure AumentoDimensionExtender1Click(Sender: TObject);
    procedure ExtenderVector1Click(Sender: TObject);
    procedure EliminarElementMayorUnString1Click(Sender: TObject);
    procedure EliminarElemenRep1Click(Sender: TObject);
  private
    { Private declarations }
    Vector : vectorSTR;
  public
    { Public declarations }
   procedure CargarVector();
   procedure ActualizarStringGrid();
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ActualizarStringGrid;
var
  i : Word;
begin
 StringGrid1.ColCount := Vector.getDimension();
 for i := 0 to Vector.getDimension() do
   StringGrid1.Cells[i,0] := Vector.getElement(i+1);
end;

procedure TForm1.AumentoDimensionExtender1Click(Sender: TObject);
begin
 ShowMessage(IntToStr(Vector.AumentoDimension_Extender));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  nr : Word;
begin
 nr := StrToInt(InputBox('DIMENSIONAR','ingrese un numero : ',''));
 StringGrid1.ColCount := nr;
 Vector.setDimension(nr);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 CargarVector();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 ActualizarStringGrid();
end;

procedure TForm1.CargarVector;
var
 i : Word;
begin
 for i := 0 to Vector.getDimension() do
    Vector.modElement(i+1,StringGrid1.Cells[i,0]);
end;

procedure TForm1.elimElement1Click(Sender: TObject);
 var
  posE : Word;
begin
 posE := StrToInt(InputBox('POSICION','ingrese la posicion : ',''));
 vector.elimElement(posE);
end;

procedure TForm1.EliminarElemenRep1Click(Sender: TObject);
begin
 Vector.EliminarElemenRep();
end;

procedure TForm1.EliminarElementMayorUnString1Click(Sender: TObject);
begin
 Vector.EliminarElementMayorUnString();
end;

procedure TForm1.exchangeSortLong1Click(Sender: TObject);
begin
 Vector.exchangeSortLong();
end;

procedure TForm1.exchangeSortWord1Click(Sender: TObject);
begin
 vector.exchangeSortWord();
end;

procedure TForm1.ExtenderVector1Click(Sender: TObject);
begin
 Vector.ExtenderVector();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Vector := vectorSTR.Create;
end;

procedure TForm1.insertElem1Click(Sender: TObject);
 var
  posE : Word;
  ele : String;
begin
 posE := StrToInt(InputBox('POSICION','ingrese la posicion : ',''));
 ele := InputBox('ELEMENTO','ingrese la el string : ','');
 vector.insertElem(posE,ele);
end;

procedure TForm1.longitudElem1Click(Sender: TObject);
 var
  posE : Word;
begin
 posE := StrToInt(InputBox('POSICION','ingrese la posicion : ',''));
 ShowMessage(IntToStr(vector.longitudElem(posE)));
end;

procedure TForm1.Obt1erCharXPos1Click(Sender: TObject);
 var
  posE : Word;
begin
 posE := StrToInt(InputBox('POSICION','ingrese la posicion : ',''));
 ShowMessage(vector.Obt1erCharXPos(posE));
end;

procedure TForm1.procedimientos2Click(Sender: TObject);
 var
  posE : Word;
  ele : String;
begin
 posE := StrToInt(InputBox('POSICION','ingrese la posicion : ',''));
 ele := InputBox('ELEMENTO','ingrese la el string : ','');
 vector.modElement(posE,ele);
end;

procedure TForm1.QSortLong1Click(Sender: TObject);
 var
  posA,posB : Word;
begin
 posA := StrToInt(InputBox('POSICION','ingrese la posicion : ',''));
 posB  := StrToInt(InputBox('POSICION','ingrese la posicion : ',''));
 Vector.QSortLong(posA,posB);
end;

procedure TForm1.QuickSortLong1Click(Sender: TObject);
begin
 Vector.QuickSortLong();
end;

procedure TForm1.QuickSortWord1Click(Sender: TObject);
begin
 vector.QuickSortWord;
end;

procedure TForm1.vervector1Click(Sender: TObject);
begin
 ShowMessage(Vector.getVector);
end;

end.