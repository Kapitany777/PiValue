program PiValue;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

function GetPiMonteCarlo: double;

var
  total: integer;
  inner: integer;
  x, y: double;
  i: integer;

begin
  // https://academo.org/demos/estimating-pi-monte-carlo/

  total := 1000000;
  inner := 0;

  for i := 1 to total do

  begin
    x := 2 * Random() - 1;
    y := 2 * Random() - 1;
    // Writeln(x:5:3, ' ', y:5:3);

    if (x * x + y * y <= 1) then
    begin
      inner := inner + 1;
    end;
  end;

  Result := 4 * inner / total;
end;

function GetPiLeibniz: double;

var
  sum: double;
  mult: double;
  denominator: double;
  i: Integer;

begin
  // https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80

  sum := 0;
  mult:=1;
  denominator:=1;

  for i := 1 to 1000000 do

  begin
    sum:=sum + mult * 1 / denominator;
    mult:=mult * -1;
    denominator:=denominator + 2;
  end;

  Result := 4 * sum;
end;

begin
  // Calculate the estimated value of Pi
  Randomize;

  // Delphi Pi
  Writeln('Delphi Pi: ', Pi.ToString());
  Writeln;

  // Estimating Pi value using the Monte Carlo Method
  Writeln('Monte Carlo Method:');
  Writeln('The estimated value of Pi is: ', GetPiMonteCarlo().ToString());
  Writeln;

  // Leibniz formula
  Writeln('Leibniz formula:');
  Writeln('The estimated value of Pi is: ', GetPiLeibniz().ToString());

  Readln;

end.
