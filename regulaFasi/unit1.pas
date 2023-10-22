unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    EditA: TEdit;
    EditB: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    LabelResultado: TLabel;
    LabelAlerta: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    function func(x: Double): Double;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  a, b, c, precisao : Double;
  max_iter: LongInt;
  i: Integer;

begin
  max_iter:= 100000;
  precisao := 0.00001;
  a := StrToFloat(EditA.Text);
  b := StrToFloat(EditB.Text);
  c := a;

  for i := 0 to max_iter do
  begin
    c := (a * func(b) - (b*func(a))) / (func(b)-func(a));

    if (func(c)<precisao) and (func(c)>-precisao) then
    begin
      LabelResultado.Caption := 'A raiz é: ' + FloatToStr(c);
      Exit;
    end;

    if func(b)*func(a)<0 then
    begin
      b := c;
    end
    else
    begin
      a := c;
    end;
  end;
  LabelResultado.Caption := 'A raiz é: ' + FloatToStr(c);
  LabelAlerta.Caption := 'Número máximo de iterações alcançado.';
end;

function TForm1.func(x: Double): Double;
begin
  result := Power(x,2) - 4;
end;
end.

