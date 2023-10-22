unit Unit1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    function gerar_numero():integer;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  n:integer;
  i,j: integer;
  a, b, c, d: array of double;
  posA, posB, posC, num: integer;
  m: double;
begin
  n:= strtoint(edit1.text);
  stringgrid1.colcount:= n;
  stringgrid1.rowcount:= n;

  SetLength(a, n - 1);
  SetLength(b, n);
  SetLength(c, n - 1);
  SetLength(d, n);

  posA := 0;
  posB := 0;
  posC := 0;

  for i:= 0 to n-1 do
      for j:=0 to n-1 do
          stringgrid1.cells[i,j]:='0';

  for i:= 0 to n-1 do
      stringgrid1.cells[i,i]:= inttostr(random(10)+1);
  for i:= 0 to n-1 do
      for j:= 0 to n-1 do
          if i=j then
          begin
            num := gerar_numero();
            b[posB] := num;
            Inc(posB);
            stringgrid1.cells[i,i]:= inttostr(num);

            if i<>n-1 then
            begin
            num := gerar_numero();
            c[posC] := num;
            Inc(posC);
            stringgrid1.cells[i+1,i]:= inttostr(num);
            end;

            if i<>0 then
            begin
            num := gerar_numero();
            a[posA] := num;
            Inc(posA);
            stringgrid1.cells[i-1,i]:= inttostr(num);
            end;
          end;

c[0] := (c[0] / b[0]);
d[0] := (d[0] / b[0]);

for i:= 1 to n do
    begin
      m := 1.0 / (b[i] - a[i] * c[i - 1]);
      c[i] := c[i] * m;
      d[i] := (d[i] - a[i] * d[i - 1]) * m;
    end;

for i := n - 1 downto 0 do
      d[i] := d[i] - c[i] * d[i+1];

for i:= 0 to n do
    stringgrid2.cells[i,0]:= floattostr(d[i]);

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;
function TForm1.gerar_numero():integer;
begin
  result := random(10)+1;
end;

end.

