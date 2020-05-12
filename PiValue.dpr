program PiValue;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

function GetPiValue: double;

var
  total: integer;
  inner: integer;
  x, y: double;
  i: integer;

begin
  total := 1000000;
  inner := 0;

  for i := 1 to total do

    begin
      x := 2 * Random() - 1;
      y := 2 * Random() - 1;
//      Writeln(x:5:3, ' ', y:5:3);

      if (x * x + y * y <= 1) then
        begin
          inner := inner + 1;
        end;
    end;

  Result := 4 * inner / total;
end;

begin
  // Estimating Pi value using the Monte Carlo Method
  Randomize;
  Writeln('The estimated value of PI is : ', GetPiValue().ToString());
  Readln;
end.
