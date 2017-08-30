unit PrnGridUnit;

interface
Uses Windows, SysUtils,Grids, Dialogs, StdCtrls, Printers;
//��������� ������ StringGrid
Procedure PrintGrid(Grid:TStringGrid; Caption:TLabel);

implementation

//==============================PrintGrid=======================================
Procedure PrintGrid(Grid:TStringGrid; Caption:TLabel);
//��������� ������ StringGrid
Var
s,st: string;
//������� (����) ������ � ����� ��������
LeftMarg,TopMarg:Integer;
//���������� ��� �������� �������� ������� ������ �� �������� ��� �������
//������ (� ��������)
CurrLine,
//���������� ��� �������� �������� ������� ����� �� �������� ��� ��������� �����
//������� ������� ������ (� ��������)
LeftBorder,
//���� ��� ������ ������� ������� ������
RightBorder,
//���������� ��� �������� �������� ������� ������ �� �������� ��� ��������� �������
//������� ������� ������ (� ��������)
TopBorder,
//���� ��� ������ ������� ������� ������
BottomBorder,
//������� ������ �������
Row,
//������� ������� �������
Col:Integer;
//������ ������ �� ����� ������� �����
LeftOffset:Integer;
//������� �������
PageCount:Integer;
//���� ����� ��������
PageEnded:Boolean;
//������� ��� ������ ������� �������
PageCountPrnPos:Integer;
//������ ��������
PrintDialog:TPrintDialog;
begin {PrintGrid}
//�������� ������ ��������
PrintDialog:=TPrintDialog.Create(Nil);
//� ������� ���
If Not PrintDialog.Execute Then Exit;

//����� ������ 5% �� ������ �������� ��������
LeftMarg:=Printer.PageWidth Div 100 * 5;
//������� ������ 3% �� ������ �������� ��������
TopMarg:=Printer.PageHeight Div 100 * 3;
//�������������� ���������� "������ ������"
CurrLine:=TopMarg;
//�������������� ������ �� ������ ���� ������
LeftOffset:= (Printer.PageWidth - LeftMarg) * 10 Div Grid.Width;
//�������������� ���������� �������
PageCount:=1;
//�������������� ����, ���������������, ��� ���������� ������� ����� ��� ����
PageEnded:=False;
//�������������� ������� ��� ������ ��������
PageCountPrnPos:=0;

//������ ������
Printer.BeginDoc;
//������ ���������
//���� ��������� ����� (TLabel)
If Not(Caption = Nil) Then
Begin {��������� ����}
s:=caption.caption;
repeat
st:=copy(s, 1, Pos(#13#10, s)-1);
    delete(s, 1, Pos(#13#10, s)+1);

//��������� ���� ������ ����� ��, ��� � � ���������
Printer.Canvas.Font:=Caption.Font;
//��������� ��������� ���������� �����
Printer.Canvas.TextOut(LeftMarg, CurrLine, st);
//�������� 1 ������ ������ ���������
CurrLine:=CurrLine+Printer.Canvas.TextHeight(Caption.Caption);
until Length(s)=0;
End;  {��������� ����}
//�������� 1 ������ ������ ���������
CurrLine:=CurrLine+Printer.Canvas.TextHeight(Caption.Caption);
//��������� ���� ����� ��, ��� � � �������
Printer.Canvas.Font:=Grid.Font;
//��������� ������� ������ �����
Printer.Canvas.Pen.Width:=1;

//��������� �� ������ ������ �������
For Row:=0 To Grid.RowCount-1 Do
Begin {For Row}
//����� ������� ������� ������
LeftBorder:=0;
//������ ������� ������� ������
RightBorder:=0;
//��������� �� ������� �������
For Col:=0 To Grid.ColCount-1 Do
Begin {For Col}
//���� ��� ����� ��� ���������� ������������ ������ � ��������� �������
If (Grid.Cells[0,0]='') Then Grid.Cells[0,0]:=' ';
//�������� ��������� ������� ������� ������� ������ � ����������� �� ������ ���������� ������
//(����� ������� �� ����� ������� ������)
TopBorder:=CurrLine-Printer.Canvas.TextHeight(Grid.Cells[0,0]);
//�������� ��������� ������ ������� �� ��� �� ��������
BottomBorder:=CurrLine+Printer.Canvas.TextHeight(Grid.Cells[0,0]);
//�������� ������� ��������� ��������� ������ �������
RightBorder:=RightBorder+Grid.ColWidths[Col] * LeftOffset Div 10;
//���������� ������� ������
Printer.Canvas.Rectangle(LeftBorder+LeftMarg,TopBorder,RightBorder+LeftMarg,BottomBorder);
//�������� �����
Printer.Canvas.TextOut(
LeftBorder+LeftMarg+Printer.Canvas.TextWidth(Grid.Cells[0,0]) div 20,
CurrLine-Printer.Canvas.TextHeight(Grid.Cells[0,0]) div 2,
Grid.Cells[Col,Row]);
//�������� ����� ������� ��������� ������
LeftBorder:=LeftBorder+Grid.ColWidths[Col] * LeftOffset Div 10;
End; {For Col}
//�������� �� ��������� ������
CurrLine:=CurrLine+Printer.Canvas.TextHeight(Grid.Cells[0,0])*2;

//�������� ���������� ����� ����� ��������
If CurrLine > (Printer.PageHeight - TopMarg*2) Then
Begin
//������� �� ������ ���� �������� ��� ������ ������ ��������
CurrLine:=CurrLine+Printer.Canvas.TextHeight(Grid.Cells[1,0]);
//������� ��� ������ ������ ��������
PageCountPrnPos:=CurrLine;
//������� ����� ��������
Printer.Canvas.TextOut(LeftMarg,PageCountPrnPos,'�������� '+IntToStr(PageCount));
//���������� �������� �������
Inc(PageCount);
//����� �������� ���������
PageEnded:=True;
//��������� ������� ������� ������ ��� ������ ����� ��������
CurrLine:=TopMarg;
//������� ����� � ��������
Printer.NewPage;
End;
End; {For Row}

If (PageCount>1) And (PageEnded) Then
Begin {������ ������ ��������}
Printer.Canvas.TextOut(LeftMarg,PageCountPrnPos,'�������� '+IntToStr(PageCount));
End;  {������ ������ ��������}
//�������� ������
Printer.EndDoc;
//��������� ������ ������
PrintDialog.Free;

end; {PrintGrid}
//==============================PrintGrid=======================================


end.
