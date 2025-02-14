unit UFormMatriz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls, UCMatrizReal;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    MenuP1: TMenuItem;
    MenuP2: TMenuItem;
    ObtenerColumnas1: TMenuItem;
    CargarUnoaUno1: TMenuItem;
    Redimensionar1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedimiento1: TMenuItem;
    modCelda1: TMenuItem;
    modCelda2: TMenuItem;
    insertFila1: TMenuItem;
    elimColumna1: TMenuItem;
    elimColumna2: TMenuItem;
    series1: TMenuItem;
    series2: TMenuItem;
    SerieSerpiente1: TMenuItem;
    IntercambiarFila1: TMenuItem;
    IntercambiarColumna1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SerieCuadradoHaciaAbajo1: TMenuItem;
    exchangeCeldas1: TMenuItem;
    QuickSortFila1: TMenuItem;
    verMatriz1: TMenuItem;
    cargaaleatoria1: TMenuItem;
    funciones1: TMenuItem;
    MaxNMatriz1: TMenuItem;
    SerieSerpienteR1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CargarUnoaUno1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Redimensionar1Click(Sender: TObject);
    procedure MenuP2Click(Sender: TObject);
    procedure ObtenerColumnas1Click(Sender: TObject);
    procedure modCelda1Click(Sender: TObject);
    procedure insertFila1Click(Sender: TObject);
    procedure modCelda2Click(Sender: TObject);
    procedure elimColumna1Click(Sender: TObject);
    procedure elimColumna2Click(Sender: TObject);
    procedure series2Click(Sender: TObject);
    procedure SerieSerpiente1Click(Sender: TObject);
    procedure IntercambiarFila1Click(Sender: TObject);
    procedure IntercambiarColumna1Click(Sender: TObject);
    procedure SerieCuadradoHaciaAbajo1Click(Sender: TObject);
    procedure exchangeCeldas1Click(Sender: TObject);
    procedure QuickSortFila1Click(Sender: TObject);
    procedure verMatriz1Click(Sender: TObject);
    procedure cargaaleatoria1Click(Sender: TObject);
    procedure MaxNMatriz1Click(Sender: TObject);
    procedure SerieSerpienteR1Click(Sender: TObject);
  private
    { Private declarations }
   MatrizN : Matriz;
  public
    { Public declarations }
   procedure DescargarMatrizEnGrid();
   procedure CargarGridEnMatriz();
   procedure CargarMatrizUnoAUno();
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
 var
   NroF,NroC : Word;
begin
 NroF := StrToInt(InputBox('Nro de Filas','Filas : ',''));
 NroC := StrToInt(InputBox('Nro de Columnas','Columnas : ',''));
 StringGrid1.RowCount := NroF;
 StringGrid1.ColCount := NroC;
 MatrizN.RedimensionarF(NroF);
 MatrizN.RedimensionarC(nroC);
 Label1.Caption := IntToStr(MatrizN.getFilas);
 Label4.Caption := IntToStr(MatrizN.getColumnas);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 CargarGridEnMatriz;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 DescargarMatrizEnGrid;
end;

procedure TForm1.cargaaleatoria1Click(Sender: TObject);
 var
 aInic,bFin : Word;
begin
 aInic := StrToInt(InputBox('Nro a Inicio','a : ',''));
 bFin := StrToInt(InputBox('Nro b Fin','b : ',''));
 MatrizN.CargaRandom(aInic,bFin);
end;

procedure TForm1.CargarGridEnMatriz;
 var
  i,j : Word;
  valor : Real;
begin
  for i := 1 to MatrizN.getFilas do
     begin
       for j := 1 to MatrizN.getColumnas do
         begin
           valor := StrToFloat(StringGrid1.Cells[j-1,i-1]);
           MatrizN.modCelda(i,j,valor);
         end;
     end;
end;

procedure TForm1.CargarMatrizUnoAUno;
 var
  i,j,NroF,NroC: Word;
  valor : Real;
begin
 NroF := StrToInt(InputBox('Nro de Filas','Filas : ',''));
 NroC := StrToInt(InputBox('Nro de Columnas','Columnas : ',''));
 MatrizN.RedimensionarF(NroF);
 MatrizN.RedimensionarC(nroC);
 for i := 1 to MatrizN.getFilas do
  begin
    for j := 1 to MatrizN.getColumnas do
     begin
       valor := strToFloat(InputBox('ELEMENTOS','celda[ '+IntToStr(i)+' , '+IntToStr(j)+' ] : ',''));
       MatrizN.modCelda(i,j,valor);
     end;
  end;
end;

procedure TForm1.CargarUnoaUno1Click(Sender: TObject);
begin
 CargarMatrizUnoAUno();
end;

procedure TForm1.DescargarMatrizEnGrid;
 var
  i,j : Word;
begin
 StringGrid1.ColCount := MatrizN.getColumnas;
 StringGrid1.RowCount := MatrizN.getFilas;
  for i := 1 to MatrizN.getFilas do
    begin
      for j := 1 to MatrizN.getColumnas do
        begin
          StringGrid1.Cells[j-1,i-1] := FloatToStr(MatrizN.getCelda(i,j));
        end;
    end;
end;

procedure TForm1.elimColumna1Click(Sender: TObject);
var
 NroC : Word;
begin
 NroC := StrToInt(InputBox('COLUMNA','posicion de columna : ',''));
 MatrizN.elimColumna(NroC);
end;

procedure TForm1.elimColumna2Click(Sender: TObject);
var
 NroF : Word;
begin
 NroF := StrToInt(InputBox('FILA','posicion de fila : ',''));
 MatrizN.elimFila(NroF);
end;

procedure TForm1.exchangeCeldas1Click(Sender: TObject);
 var
  FA,CA,FB,CB : Word;
begin
 FA := StrToInt(InputBox('Nro de Filas','Fila A : ',''));
 CA := StrToInt(InputBox('Nro de Columnas','Columna A : ',''));
 FB := StrToInt(InputBox('Nro de Filas','Fila B : ',''));
 CB := StrToInt(InputBox('Nro de Columnas','Columna B : ',''));
 MatrizN.exchangeCeldas(FA,CA,FB,CB);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 MatrizN := Matriz.Create;
end;

procedure TForm1.insertFila1Click(Sender: TObject);
var
 NroF : Word;
begin
 NroF := StrToInt(InputBox('FILA','posicion de fila : ',''));
 MatrizN.insertFila(NroF);
end;

procedure TForm1.IntercambiarColumna1Click(Sender: TObject);
 var
  CA,CB : Word;
begin
 CA := StrToInt(InputBox('Nro de Columnas','Columna A : ',''));
 CB := StrToInt(InputBox('Nro de Columnas','Columna B : ',''));
 MatrizN.IntercambiarColumna(CA,CB);
end;

procedure TForm1.IntercambiarFila1Click(Sender: TObject);
 var
  FA,FB: Word;
begin
 FA := StrToInt(InputBox('Nro de Filas','Fila A : ',''));
 FB := StrToInt(InputBox('Nro de Filas','Fila B : ',''));
 MatrizN.IntercambiarFila(FA,FB);
end;

procedure TForm1.MaxNMatriz1Click(Sender: TObject);
begin
 ShowMessage(FloatToStr(MatrizN.MaxNMatriz));
end;

procedure TForm1.MenuP2Click(Sender: TObject);
begin
 ShowMessage(IntToStr(MatrizN.getFilas));
end;

procedure TForm1.modCelda1Click(Sender: TObject);
 var
  NroF,NroC: Word;
  valor : Real;
begin
 NroF := StrToInt(InputBox('Nro de Filas','Filas : ',''));
 NroC := StrToInt(InputBox('Nro de Columnas','Columnas : ',''));
 valor := StrToFloat(InputBox('ELEMENTOS','celda[ '+IntToStr(NroF)+' , '+IntToStr(NroC)+' ] : ',''));
 MatrizN.modCelda(NroC,NroF,valor);
end;

procedure TForm1.modCelda2Click(Sender: TObject);
var
 NroC : Word;
begin
 NroC := StrToInt(InputBox('COLUMNA','posicion de columna : ',''));
 MatrizN.insertColumna(NroC);
end;

procedure TForm1.ObtenerColumnas1Click(Sender: TObject);
begin
 ShowMessage(IntToStr(MatrizN.getColumnas));
end;

procedure TForm1.QuickSortFila1Click(Sender: TObject);
 var
  NroF: Word;
begin
 NroF := StrToInt(InputBox('Nro de Filas','Cual Fila ordenar : ',''));
 MAtrizN.QuickSortFila(NroF);
end;

procedure TForm1.Redimensionar1Click(Sender: TObject);
 var
  NroF,NroC: Word;
begin
 NroF := StrToInt(InputBox('Nro de Filas','Filas : ',''));
 NroC := StrToInt(InputBox('Nro de Columnas','Columnas : ',''));
 MatrizN.RedimensionarFC(NroF,NroC);
end;

procedure TForm1.SerieCuadradoHaciaAbajo1Click(Sender: TObject);
begin
 MatrizN.SerieCuadradoHaciaAdentro;
end;

procedure TForm1.series2Click(Sender: TObject);
begin
 MatrizN.SerieNormalPAF();
end;

procedure TForm1.SerieSerpiente1Click(Sender: TObject);
begin
 MAtrizN.SerieSerpiente();
end;

procedure TForm1.SerieSerpienteR1Click(Sender: TObject);
begin
 MatrizN.SerieSerpienteR;
end;

procedure TForm1.verMatriz1Click(Sender: TObject);
begin
 ShowMessage(MatrizN.verMatriz);
end;

end.
