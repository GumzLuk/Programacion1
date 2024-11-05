unit UClassPr;

interface
  Type
    PruebaM = Class
      private
        shoko:array[1..10]of byte;

      public
        procedure saludo();
    End;

implementation

{ PruebaM }

procedure PruebaM.saludo;
begin
 Writeln('Hola como estas');
end;

end.
