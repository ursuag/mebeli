unit PrnGridUnit;

interface
Uses Windows, SysUtils,Grids, Dialogs, StdCtrls, Printers;
//процедура печати StringGrid
Procedure PrintGrid(Grid:TStringGrid; Caption:TLabel);

implementation

//==============================PrintGrid=======================================
Procedure PrintGrid(Grid:TStringGrid; Caption:TLabel);
//процедура печати StringGrid
Var
s,st: string;
//отступы (поля) сверху и слева страницы
LeftMarg,TopMarg:Integer;
//переменная для хранения значения отступа сверху от страницы для текущей
//строки (в пикселях)
CurrLine,
//переменная для хранения значения отступа слева от страницы длч положения левой
//границы текущей ячейки (в пикселях)
LeftBorder,
//тоже для правой границы текущей ячейки
RightBorder,
//переменная для хранения значения отступа сверху от страницы для положения верхней
//границы текущей ячейки (в пикселях)
TopBorder,
//тоже для нижней границы текущей ячейки
BottomBorder,
//текущая строка таблицы
Row,
//текущий столбец таблицы
Col:Integer;
//отступ текста от левой границы ячеки
LeftOffset:Integer;
//счетчик страниц
PageCount:Integer;
//флаг конца страницы
PageEnded:Boolean;
//позиция для печати номеров страниц
PageCountPrnPos:Integer;
//диалог принтера
PrintDialog:TPrintDialog;
begin {PrintGrid}
//создадим диалог принтера
PrintDialog:=TPrintDialog.Create(Nil);
//и покажем его
If Not PrintDialog.Execute Then Exit;

//левый отступ 5% от ширины страницы принтера
LeftMarg:=Printer.PageWidth Div 100 * 5;
//верхний отступ 3% от высоты страницы принтера
TopMarg:=Printer.PageHeight Div 100 * 3;
//инициализируем переменную "отступ сверху"
CurrLine:=TopMarg;
//инициализируем отступ от левого края ячейки
LeftOffset:= (Printer.PageWidth - LeftMarg) * 10 Div Grid.Width;
//инициализируем количество страниц
PageCount:=1;
//инициализируем флаг, сигнализируюший, что печатается страниц более чем одна
PageEnded:=False;
//инициализируем позицию для печати страницы
PageCountPrnPos:=0;

//начнем печать
Printer.BeginDoc;
//печать заголовка
//если заголовок задан (TLabel)
If Not(Caption = Nil) Then
Begin {заголовок есть}
s:=caption.caption;
repeat
st:=copy(s, 1, Pos(#13#10, s)-1);
    delete(s, 1, Pos(#13#10, s)+1);

//установим фонт печати такой же, как и у заголовка
Printer.Canvas.Font:=Caption.Font;
//напечатем заголовок посередине листа
Printer.Canvas.TextOut(LeftMarg, CurrLine, st);
//отступим 1 высоту текста заголовка
CurrLine:=CurrLine+Printer.Canvas.TextHeight(Caption.Caption);
until Length(s)=0;
End;  {заголовок есть}
//отступим 1 высоту текста заголовка
CurrLine:=CurrLine+Printer.Canvas.TextHeight(Caption.Caption);
//установим фонт такой же, как и в таблице
Printer.Canvas.Font:=Grid.Font;
//установим толшину печати рамок
Printer.Canvas.Pen.Width:=1;

//пройдемся по каждой строке таблицы
For Row:=0 To Grid.RowCount-1 Do
Begin {For Row}
//левая граница текущей ячейки
LeftBorder:=0;
//правая граница текущей ячейки
RightBorder:=0;
//пройдемся по каждому столбцу
For Col:=0 To Grid.ColCount-1 Do
Begin {For Col}
//этот код нужен для исключения возниковения ошибки в следующих строках
If (Grid.Cells[0,0]='') Then Grid.Cells[0,0]:=' ';
//вычислим положение верхней границы текущей ячейки в зависимости от высоты печатемого текста
//(текст берется из левой верхней ячейки)
TopBorder:=CurrLine-Printer.Canvas.TextHeight(Grid.Cells[0,0]);
//вычислим положение нижней границы на том же принципе
BottomBorder:=CurrLine+Printer.Canvas.TextHeight(Grid.Cells[0,0]);
//вычислим текущее положение положение правой границы
RightBorder:=RightBorder+Grid.ColWidths[Col] * LeftOffset Div 10;
//напечатаем границы ячейки
Printer.Canvas.Rectangle(LeftBorder+LeftMarg,TopBorder,RightBorder+LeftMarg,BottomBorder);
//напечаем текст
Printer.Canvas.TextOut(
LeftBorder+LeftMarg+Printer.Canvas.TextWidth(Grid.Cells[0,0]) div 20,
CurrLine-Printer.Canvas.TextHeight(Grid.Cells[0,0]) div 2,
Grid.Cells[Col,Row]);
//вычислим левую границу следующей ячейки
LeftBorder:=LeftBorder+Grid.ColWidths[Col] * LeftOffset Div 10;
End; {For Col}
//перейдем на следующую строку
CurrLine:=CurrLine+Printer.Canvas.TextHeight(Grid.Cells[0,0])*2;

//проверим достижение конца листа принтера
If CurrLine > (Printer.PageHeight - TopMarg*2) Then
Begin
//переход на нижнее поле страницы для печати номера страницы
CurrLine:=CurrLine+Printer.Canvas.TextHeight(Grid.Cells[1,0]);
//позиция для печати номера страницы
PageCountPrnPos:=CurrLine;
//печатем номер страницы
Printer.Canvas.TextOut(LeftMarg,PageCountPrnPos,'Страница '+IntToStr(PageCount));
//увеличение счетчика страниц
Inc(PageCount);
//конец страницы достигнут
PageEnded:=True;
//обнуление текущей позиции строки для печати новой страницы
CurrLine:=TopMarg;
//проброс листа в принтере
Printer.NewPage;
End;
End; {For Row}

If (PageCount>1) And (PageEnded) Then
Begin {печать номера страницы}
Printer.Canvas.TextOut(LeftMarg,PageCountPrnPos,'Страница '+IntToStr(PageCount));
End;  {печать номера страницы}
//закончим печать
Printer.EndDoc;
//освободим диалог печати
PrintDialog.Free;

end; {PrintGrid}
//==============================PrintGrid=======================================


end.
