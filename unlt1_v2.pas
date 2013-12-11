unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
  function func_b(x:real):real;      //функция
  function func_pr(x:real):real;     //Производная функции

var
  Form1: TForm1;
  Res:array[byte]of real;
  F:Text;
  i:integer;
  Eps,x_beg,x_end:real;

implementation

function func_b(x:real):real;
begin
  result:=(sqr(x)*x)-sqr(x)-10;
end;

function func_pr(x:real):real;
begin
  result:=(3*sqr(x))-2*x;
end;


{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
 x,xn,y:real;
begin
 // assignfile(F,'lab4.txt');
  rewrite(F);
  Chart1LineSeries1.Clear;
  Eps:=Edit1.Text;
  x_beg:=StrToFloat(Edit2.Text);
  x_end:=StrToFloat(Edit4.Text);
  x:=(x_end-x_beg)/15;
  repeat
    xn:=x;
    y:=func_b(x)/func_pr(x);
    x=x-y;
    if abs(x-xn)>=Eps
      then
        begin
          writeln(F,'x='+FloatToStr(x));
          writeln(F,'F(x)='+FloatToStr(Func_b(x)));
          Memo1.Lines.Add('x='+FloatToStr(x));
          Memo1.Lines.Add('F(x)='+FloatToStr(Func_b(x)));
          Chart1LineSeries1.AddXY(x,Func_b(x),'',clred);
        end
      else
        begin
          writeln(F,'x='+FloatToStr(x));
          Memo1.Lines.Add('x='+FloatToStr(x));
        end;
  until abs(x-xn)<=Eps;
  closefile(F);
  showmessage('x='+ FloatToStr(x));
end;

{$R *.lfm}

end.
                                                            
