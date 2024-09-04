unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TAreacalculator }

  TAreacalculator = class(TForm)
    ButtonCount: TButton;
    EditRead: TEdit;
    EditWritesqr: TEdit;
    EditWriteprm1: TEdit;
    EditWriteprm2: TEdit;
    EditWritetr1: TEdit;
    EditWritetr2: TEdit;
    EditWritetr3: TEdit;
    EditWritecircle: TEdit;
    LabelSqruare: TLabel;
    LabelPryamougolnik: TLabel;
    LabelTriangle: TLabel;
    LabelCircle: TLabel;
    procedure ButtonCountClick(Sender: TObject);
    procedure EditWritesqrChange(Sender: TObject);
    procedure EditWriteprm1Change(Sender: TObject);
    procedure EditWriteprm2Change(Sender: TObject);
    procedure EditWritetr1Change(Sender: TObject);
    procedure EditWritetr2Change(Sender: TObject);
    procedure EditWritetr3Change(Sender: TObject);
    procedure EditWritecircleChange(Sender: TObject);
  private

  public

  end;

var
  Areacalculator: TAreacalculator;

implementation

{$R *.lfm}

{ TAreacalculator }

procedure TAreacalculator.EditWritesqrChange(Sender: TObject);
begin

end;

procedure TAreacalculator.ButtonCountClick(Sender: TObject);
var
  a, b, c, r, p, area: Double;
  inputCount: Integer;
  inputError: Boolean;
begin
  inputCount := 0;
  inputError := False;
  area := 0;

  // Проверка и расчет для квадрата
  if Trim(EditWritesqr.Text) <> '' then
  begin
    Inc(inputCount);
    try
      a := StrToFloat(EditWritesqr.Text);
      area := a * a;
    except
      on E: EConvertError do
      begin
        inputError := True;
        ShowMessage('Введите цифру или число');
      end;
    end;
  end;

  // Проверка и расчет для прямоугольника
  if (Trim(EditWriteprm1.Text) <> '') and (Trim(EditWriteprm2.Text) <> '') then
  begin
    Inc(inputCount);
    try
      a := StrToFloat(EditWriteprm1.Text);
      b := StrToFloat(EditWriteprm2.Text);
      area := a * b;
    except
      on E: EConvertError do
      begin
        inputError := True;
        ShowMessage('Введите цифру или число');
      end;
    end;
  end;

  // Проверка и расчет для треугольника
  if (Trim(EditWritetr1.Text) <> '') and (Trim(EditWritetr2.Text) <> '') and (Trim(EditWritetr3.Text) <> '') then
  begin
    Inc(inputCount);
    try
      a := StrToFloat(EditWritetr1.Text);
      b := StrToFloat(EditWritetr2.Text);
      c := StrToFloat(EditWritetr3.Text);
      p := (a + b + c) / 2;
      area := Sqrt(p * (p - a) * (p - b) * (p - c));
    except
      on E: EConvertError do
      begin
        inputError := True;
        ShowMessage('Введите цифру или число');
      end;
    end;
  end;

  // Проверка и расчет для круга
  if Trim(EditWritecircle.Text) <> '' then
  begin
    Inc(inputCount);
    try
      r := StrToFloat(EditWritecircle.Text);
      area := Pi * r * r;
    except
      on E: EConvertError do
      begin
        inputError := True;
        ShowMessage('Введите цифру или число');
      end;
    end;
  end;

  // Проверка на количество введенных данных и наличие ошибок ввода
  if inputError then
  begin
    // Сообщение об ошибке уже было показано
  end
  else if inputCount > 1 then
  begin
    ShowMessage('Введите данные только для одной фигуры.');
  end
  else if inputCount = 0 then
  begin
    ShowMessage('Данные не введены. Пожалуйста, введите данные для расчета площади.');
  end
  else
  begin
    // Вывод сообщения о площади фигуры, если нет ошибок и введены данные только для одной фигуры
    if area > 0 then
      ShowMessage('Площадь фигуры: ' + FloatToStr(area));
  end;
end;


procedure TAreacalculator.EditWriteprm1Change(Sender: TObject);
begin

end;

procedure TAreacalculator.EditWriteprm2Change(Sender: TObject);
begin

end;

procedure TAreacalculator.EditWritetr1Change(Sender: TObject);
begin

end;

procedure TAreacalculator.EditWritetr2Change(Sender: TObject);
begin

end;

procedure TAreacalculator.EditWritetr3Change(Sender: TObject);
begin

end;

procedure TAreacalculator.EditWritecircleChange(Sender: TObject);
begin

end;

end.

