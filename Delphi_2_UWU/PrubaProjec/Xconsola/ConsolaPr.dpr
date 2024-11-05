program ConsolaPr;

uses
  System.SysUtils,UClassPr;

  var x:PruebaM;
begin
  x := PruebaM.Create;
  x.saludo;
  Readln;
end.
