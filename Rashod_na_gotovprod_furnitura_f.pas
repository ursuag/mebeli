unit Rashod_na_gotovprod_furnitura_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, DateUtils, DB,
  IBCustomDataSet, Grids, DBGrids, Hyperination, XLSFile, XLSFormat, XLSWorkbook;

type
  TF_Rashod_na_gotovprod_furnitura = class(TForm)
    Label24: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    B_Exit: TButton;
    B_ShowReport: TButton;
    Period_End: TDateTimePicker;
    Label2: TLabel;
    Period_Start: TDateTimePicker;
    DS_FURNITURA_LIST_FOR_REPORT: TDataSource;
    DBGrid1: TDBGrid;
    IB_FURNITURA_LIST_FOR_REPORT: TIBDataSet;
    B_SelectFurnitura: TButton;
    B_Clear_list: TButton;
    L_Process: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_SelectFurnituraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_Clear_listClick(Sender: TObject);
    procedure B_ShowReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Rashod_na_gotovprod_furnitura: TF_Rashod_na_gotovprod_furnitura;

implementation

uses mebeli_dm, furnitura_f, main_f;

{$R *.dfm}

procedure TF_Rashod_na_gotovprod_furnitura.FormCreate(Sender: TObject);
begin
  period_start.Date:=IncDay(Date,-30);
  period_end.Date:=Date;
end;

procedure TF_Rashod_na_gotovprod_furnitura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
end;

procedure TF_Rashod_na_gotovprod_furnitura.B_SelectFurnituraClick(Sender: TObject);
begin
  if not DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.StartTransaction;
  operation:='SELECT_FOR_LIST';
  F_Furnitura.ShowModal;
  IB_FURNITURA_LIST_FOR_REPORT.Close;
  IB_FURNITURA_LIST_FOR_REPORT.Open;
end;

procedure TF_Rashod_na_gotovprod_furnitura.FormActivate(Sender: TObject);
begin
  IB_FURNITURA_LIST_FOR_REPORT.Close;
  IB_FURNITURA_LIST_FOR_REPORT.Open;
end;

procedure TF_Rashod_na_gotovprod_furnitura.B_Clear_listClick(
  Sender: TObject);
  var furn_select: TIBDataSet;
begin
  IF MessageDlg('Вы уверены, что хотите очистить список?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
      furn_select:=TIBDataSet.Create(nil);
      furn_select.Database:=DM_Mebeli.IB_Sklad.Database;
      furn_select.SelectSQL.Add('delete from FURNITURA_LIST_FOR_REPORT');
      try
        furn_select.ExecSQL;
      finally
        furn_select.Free;
      end;
      IB_FURNITURA_LIST_FOR_REPORT.Close;
      IB_FURNITURA_LIST_FOR_REPORT.Open;
     end;
end;

procedure TF_Rashod_na_gotovprod_furnitura.B_ShowReportClick(
  Sender: TObject);
const
  jobexec_vew: array [1..4] of char=('|','/','-','\');
var
  j:byte;
  furn_list: TIBDataSet;
  gotovprod_list: TIBDataSet;
  data_search: TIBDataSet;
  sql_temp: TIBDataSet;

  xf: TXLSFile;
  row, col: integer;
 filename: string;
 SaveDialog1: TSaveDialog;
begin
  SaveDialog1:=TSaveDialog.Create(nil);
  SaveDialog1.Filter:='Excel files  |*.xls';
  SaveDialog1.DefaultExt:='xls';
  SaveDialog1.Options := [ofOverwritePrompt];
  SaveDialog1.FileName:='расход_матер_период';
  if not SaveDialog1.Execute then
    begin
      SaveDialog1.Free;
      exit;
    end;

  filename:=SaveDialog1.FileName;
  SaveDialog1.Free;

  xf:= TXLSFile.Create;

  furn_list:=TIBDataSet.Create(nil);
  furn_list.Database:=DM_Mebeli.IB_Sklad.Database;
  gotovprod_list:=TIBDataSet.Create(nil);
  gotovprod_list.Database:=DM_Mebeli.IB_Sklad.Database;
  data_search:=TIBDataSet.Create(nil);
  data_search.Database:=DM_Mebeli.IB_Sklad.Database;

  sql_temp:=TIBDataSet.Create(nil);
  sql_temp.Database:=DM_Mebeli.IB_Sklad.Database;

  furn_list.SelectSQL.Add('select * from furnitura_list_for_report order by grupa_name, furnitura_name');

  gotovprod_list.SelectSQL.Clear;
  gotovprod_list.SelectSQL.Add('execute procedure ANALIZ_FURNITURA_FROM_LIST(:period_start, :period_end)');
  gotovprod_list.ParamByName('period_start').Value:=period_start.DateTime;
  gotovprod_list.ParamByName('period_end').Value:=period_end.DateTime;
  gotovprod_list.ExecSQL;
  gotovprod_list.SelectSQL.Clear;
  gotovprod_list.SelectSQL.Add('select * from ANALIZ_FIRNITURA order by gotovprod_name');

  data_search.SelectSQL.Add('select KOLVO_FURNITURA from ANALIZ_FIRNITURA where (id_furnitura=:id_furnitura) and (id_gotovprod=:id_gotovprod)');
  furn_list.Open;
  gotovprod_list.Open;
  row:=6;
  with xf.Workbook.Sheets[0] do
    begin
      cells[0,0].Value:='Артикул шкаф';
      cells[0,0].FontBold:=true;
      cells[0,1].Value:='Готовая продукция';
      cells[0,1].FontBold:=true;

      cells[1,1].Value:='остаток на начало:';
      cells[1,1].FontColorRGB := clMaroon;
      cells[2,1].Value:='поступление за период';
      cells[2,1].FontColorRGB := clMaroon;
      cells[3,1].Value:='расход за период';
      cells[3,1].FontColorRGB := clMaroon;
      cells[4,1].Value:='остаток на конец:';
      cells[4,1].FontColorRGB := clMaroon;

      cells[5,1].Value:='расход фурнитуры за период: с '+DateToStr(Period_Start.Date)+' по '+DateToStr(Period_End.Date);
      cells[5,1].FontBold:=true;
    end;//with xf.Workbook.Sheets[0]
  col:=2;
  while not gotovprod_list.Eof do
    begin
      furn_list.first;
      col:=2;
      j:=1;
      xf.Workbook.Sheets[0].cells[row, 0].value:=gotovprod_list.FieldByName('article_gotovprod').AsInteger;
      xf.Workbook.Sheets[0].cells[row, 1].value:=gotovprod_list.FieldByName('gotovprod_name').AsString;
      while not furn_list.Eof do
        begin
          with xf.Workbook.Sheets[0] do
            begin
              data_search.Close;
              cells[0,col].Value:=furn_list.FieldByName('furnitura_name').AsString;
              cells[0,col].Wrap:=true;
              cells[0,col].HAlign:=xlHAlignCenter;
              data_search.ParamByName('id_furnitura').Value:=furn_list.FieldByName('id_furnitura').AsInteger;
              data_search.ParamByName('id_gotovprod').Value:=gotovprod_list.FieldByName('id_gotovprod').AsInteger;
              data_search.Open;
              if data_search.FieldByName('KOLVO_FURNITURA').AsFloat>0 then
                cells[row, col].value:=data_search.FieldByName('KOLVO_FURNITURA').AsFloat;

              //остаток на начало периода
              sql_temp.SelectSQL.Clear;
              sql_temp.SelectSQL.Add('select ostatok from FURNITURA_OSTATOK_VSE_SKLADY(:id_furnitura, :period_end)');
              sql_temp.ParamByName('id_furnitura').Value:=furn_list.FieldByName('id_furnitura').AsInteger;;
              sql_temp.ParamByName('period_end').Value:=IncDay(Period_start.DateTime,-1);
              sql_temp.Open;
              cells[1,col].value:=sql_temp.FieldByName('ostatok').AsFloat;
              cells[1,col].FontColorRGB := clMaroon;
              sql_temp.Close;
              //остаток на конец периода
              sql_temp.SelectSQL.Clear;
              sql_temp.SelectSQL.Add('select ostatok from FURNITURA_OSTATOK_VSE_SKLADY(:id_furnitura, :period_end)');
              sql_temp.ParamByName('id_furnitura').Value:=furn_list.FieldByName('id_furnitura').AsInteger;;
              sql_temp.ParamByName('period_end').Value:=Period_End.DateTime;
              sql_temp.Open;
              cells[4,col].value:=sql_temp.FieldByName('ostatok').AsFloat;
              cells[4,col].FontColorRGB := clMaroon;
              sql_temp.Close;

              //приход за период
              sql_temp.SelectSQL.Clear;
              sql_temp.SelectSQL.Add('select prihod from FURNITURA_PRIHOD_PERIOD(:id_furnitura, :period_start, :period_end)');
              sql_temp.ParamByName('id_furnitura').Value:=furn_list.FieldByName('id_furnitura').AsInteger;;
              sql_temp.ParamByName('period_start').Value:=Period_start.DateTime;
              sql_temp.ParamByName('period_end').Value:=Period_End.DateTime;
              sql_temp.Open;
              if sql_temp.FieldByName('prihod').AsFloat>0 then
                cells[2, col].value:=sql_temp.FieldByName('prihod').AsFloat;
              cells[2,col].FontColorRGB := clMaroon;
              sql_temp.Close;
              //расход за период
              sql_temp.SelectSQL.Clear;
              sql_temp.SelectSQL.Add('select rashod from furnitura_rashod_period(:id_furnitura, :period_start, :period_end)');
              sql_temp.ParamByName('id_furnitura').Value:=furn_list.FieldByName('id_furnitura').AsInteger;;
              sql_temp.ParamByName('period_start').Value:=Period_start.DateTime;
              sql_temp.ParamByName('period_end').Value:=Period_End.DateTime;
              sql_temp.Open;
              if sql_temp.FieldByName('rashod').AsFloat>0 then
                cells[3, col].value:=sql_temp.FieldByName('rashod').AsFloat;
              cells[3,col].FontColorRGB := clMaroon;
              sql_temp.Close;

              inc(col);
              furn_list.Next;
              Application.ProcessMessages;
              L_Process.caption:=jobexec_vew[j];
              Inc(j);
              if j>4 then
                j:=1;
            end;//with xf.Workbook.Sheets[0]
        end;//while not furn_list.Eof

      //отгрузка шкафов за период
      sql_temp.SelectSQL.Clear;
      sql_temp.SelectSQL.Add('select kol_vo from get_prodaja_gotovprod_sign(:id_gotovprod, :period_start, :period_end)');
      sql_temp.ParamByName('id_gotovprod').Value:=gotovprod_list.FieldByName('id_gotovprod').AsInteger;
      sql_temp.ParamByName('period_start').Value:=Period_start.DateTime;
      sql_temp.ParamByName('period_end').Value:=Period_End.DateTime;
      sql_temp.Open;
      if sql_temp.FieldByName('kol_vo').AsFloat>0 then
        xf.Workbook.Sheets[0].cells[row, col].value:=sql_temp.FieldByName('kol_vo').AsInteger;
      sql_temp.Close;

      //Остаток не выпущенных шкафов
      sql_temp.SelectSQL.Clear;
      sql_temp.SelectSQL.Add('select ostatok_otgruzka from GET_OSTATOK_OTGRUZKA_GOTOVPROD(:id_gotovprod,:period_end)');
      sql_temp.ParamByName('id_gotovprod').Value:=gotovprod_list.FieldByName('id_gotovprod').AsInteger;
      sql_temp.ParamByName('period_end').Value:=Period_End.DateTime;
      sql_temp.Open;
      if sql_temp.FieldByName('ostatok_otgruzka').AsFloat>0 then
        xf.Workbook.Sheets[0].cells[row, col+1].value:=sql_temp.FieldByName('ostatok_otgruzka').AsInteger;
      sql_temp.Close;

      inc(row);
      gotovprod_list.Next;
    end;//while not gotovprod_list.Eof do
  xf.Workbook.Sheets[0].cells[0,col].Value:='Отгружено шкафов за период';
  xf.Workbook.Sheets[0].cells[0,col].FontBold:=true;
  xf.Workbook.Sheets[0].cells[0,col].Wrap:=true;
  xf.Workbook.Sheets[0].cells[0,col].HAlign:=xlHAlignCenter;
  xf.Workbook.Sheets[0].Columns[col].Width:=14;
  xf.Workbook.Sheets[0].cells[0,col+1].Value:='Остаток не выпущенных шкафов по заказам';
  xf.Workbook.Sheets[0].cells[0,col+1].FontBold:=true;
  xf.Workbook.Sheets[0].cells[0,col+1].Wrap:=true;
  xf.Workbook.Sheets[0].cells[0,col+1].HAlign:=xlHAlignCenter;
  xf.Workbook.Sheets[0].Columns[col+1].Width:=14;
  xf.Workbook.Sheets[0].Columns.AutoFit(0,1);
  
  try
    xf.SaveAs(filename);
  finally
      xf.Destroy;
      furn_list.Free;
      gotovprod_list.Free;
      sql_temp.Free;
  end;
  ShowMessage('Данные выгружены');
end;

end.
