unit UFormSokoban;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCFigura, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.StdCtrls, UCLMuro, UCLNiveles, jpeg;

type
  TFormSOKOBAN = class(TForm)
    TimerFigura: TTimer;
    Button1: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerFiguraTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    fondo : TJPEGImage;
    Niveles : TMapa;
    PInicio : boolean;
    NivelActual : byte;
  public
    { Public declarations }
  end;

var
  FormSOKOBAN: TFormSOKOBAN;

implementation

{$R *.dfm}

procedure TFormSOKOBAN.Button1Click(Sender: TObject);
begin
 PInicio := true;
 NivelActual := 3;
 fondo.LoadFromFile('cesped.JPG');
 Niveles.createNivel(NivelActual,30,40);
 Button1.Enabled := false;
 Button1.Visible := false;
 Repaint;
end;

procedure TFormSOKOBAN.FormCreate(Sender: TObject);
 var i,x,y:Word;
begin
 PInicio := false;
 NivelActual := 0;
 fondo := TJPEGImage.Create;
 fondo.LoadFromFile('FondoInicio.JPG');
 Niveles := TMapa.create;
end;

procedure TFormSOKOBAN.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key in [37,38,39,40] then
  begin
   Niveles.MoverFigura(key);
   Niveles.MoverCajas;
  end;
 Label1.Caption := '';
end;

procedure TFormSOKOBAN.FormPaint(Sender: TObject);
begin
 canvas.StretchDraw(Rect(0,0,FormSOKOBAN.Width,FormSOKOBAN.Height),fondo);
  if(PInicio)then
   begin
    Niveles.DibujarNivel(Canvas);
   end;
end;

procedure TFormSOKOBAN.TimerFiguraTimer(Sender: TObject);
begin
 Repaint;
end;

end.