unit Rashod_na_gotovprod_detali_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Grids, DBGrids, ComCtrls, StdCtrls,
  ExtCtrls, DateUtils;

type
  TF_Rashod_na_gotovprod_detali = class(TForm)
    Label24: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    L_Process: TLabel;
    Panel1: TPanel;
    B_Exit: TButton;
    B_ShowReport: TButton;
    B_SelectFurnitura: TButton;
    B_Clear_list: TButton;
    Period_End: TDateTimePicker;
    Period_Start: TDateTimePicker;
    DBGrid1: TDBGrid;
    DS_DETALI_LIST_FOR_REPORT: TDataSource;
    IB_DETALI_LIST_FOR_REPORT: TIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure B_Clear_listClick(Sender: TObject);
    procedure B_SelectFurnituraClick(Sender: TObject);
    procedure B_ShowReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Rashod_na_gotovprod_detali: TF_Rashod_na_gotovprod_detali;

implementation

uses mebeli_dm, furnitura_f, main_f, XLSFile, XLSFormat, XLSWorkbook,
  pilomat_f;

{$R *.dfm}

procedure TF_Rashod_na_gotovprod_detali.FormCreate(Sender: TObject);
begin
  period_start.Date:=IncDay(Date,-30);
  period_end.Date:=Date;
end;

procedure TF_Rashod_na_gotovprod_detali.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
end;

procedure TF_Rashod_na_gotovprod_detali.FormActivate(Sender: TObject);
begin
  IB_DETALI_LIST_FOR_REPORT.Close;
  IB_DETALI_LIST_FOR_REPORT.Open;
end;

procedure TF_Rashod_na_gotovprod_detali.B_Clear_listClick(Sender: TObject);
  var detali_select: TIBDataSet;
begin
  IF MessageDlg('Вы уверены, что хотите очистить список?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
      detali_select:=TIBDataSet.Create(nil);
      detali_select.Database:=DM_Mebeli.IB_Sklad.Database;
      detali_select.SelectSQL.Add('delete from DETALI_LIST_FOR_REPORT');
      try
        detali_select.ExecSQL;
      finally
        detali_select.Free;
      end;
      IB_DETALI_LIST_FOR_REPORT.Close;
      IB_DETALI_LIST_FOR_REPORT.Open;
     end;
end;

procedure TF_Rashod_na_gotovprod_detali.B_SelectFurnituraClick(
  Sender: TObject);
begin
  if not DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.StartTransaction;
  operation:='SELECT_FOR_LIST';
  F_Pilomat.ShowModal;
  IB_DETALI_LIST_FOR_REPORT.Close;
  IB_DETALI_LIST_FOR_REPORT.Open;
end;

procedure TF_Rashod_na_gotovprod_detali.B_ShowReportClick(Sender: TObject);
const
  jobexec_vew: array [1..4] of char=('|','/','-','\');
var
  j:byte;
  detali_list: TIBDataSet;
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
  SaveDialog1.FileName:='расход_детали_период';
  if not SaveDialog1.Execute then
    begin
      SaveDialog1.Free;
      exit;
    end;

  filename:=SaveDialog1.FileName;
  SaveDialog1.Free;

  xf:= TXLSFile.Create;

  detali_list:=TIBDataSet.Create(nil);
  detali_list.Database:=DM_Mebeli.IB_Sklad.Database;
  gotovprod_list:=TIBDataSet.Create(nil);
  gotovprod_list.Database:=DM_Mebeli.IB_Sklad.Database;
  data_search:=TIBDataSet.Create(nil);
  data_search.Database:=DM_Mebeli.IB_Sklad.Database;

  sql_temp:=TIBDataSet.Create(nil);
  sql_temp.Database:=DM_Mebeli.IB_Sklad.Database;

  detali_list.SelectSQL.Add('select * from detali_list_for_report order by grupa_name, detali_name');

  gotovprod_list.SelectSQL.Clear;
  gotovprod_list.SelectSQL.Add('execute procedure ANALIZ_DETALI_FROM_LIST(:period_start, :period_end)');
  gotovprod_list.ParamByName('period_start').Value:=period_start.DateTime;
  gotovprod_list.ParamByName('period_end').Value:=period_end.DateTime;
  gotovprod_list.ExecSQL;
  gotovprod_list.SelectSQL.Clear;
  gotovprod_list.SelectSQL.Add('select * from ANALIZ_DETALI order by gotovprod_name');

  data_search.SelectSQL.Add('select KOLVO_DETALI from ANALIZ_DETALI where (id_detali=:id_detali) and (id_gotovprod=:id_gotovprod)');
  detali_list.Open;
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

      cells[5,1].Value:='расход деталей за период: с '+DateToStr(Period_Start.Date)+' по '+DateToStr(Period_End.Date);
      cells[5,1].FontBold:=true;
    end;//with xf.Workbook.Sheets[0]
  col:=2;
  while not gotovprod_list.Eof do
    begin
      detali_list.first;
      col:=2;
      j:=1;
      xf.Workbook.Sheets[0].cells[row, 0].value:=gotovprod_list.FieldByName('article_gotovprod').AsInteger;
      xf.Workbook.Sheets[0].cells[row, 1].value:=gotovprod_list.FieldByName('gotovprod_name').AsString;
      while not detali_list.Eof do
        begin
          with xf.Workbook.Sheets[0] do
            begin
              data_search.Close;
              cells[0,col].Value:=detali_list.FieldByName('detali_name').AsString;
              cells[0,col].Wrap:=true;
              cells[0,col].HAlign:=xlHAlignCenter;
              data_search.ParamByName('id_detali').Value:=detali_list.FieldByName('id_detali').AsInteger;
              data_search.ParamByName('id_gotovprod').Value:=gotovprod_list.FieldByName('id_gotovprod').AsInteger;
              data_search.Open;
              if data_search.FieldByName('KOLVO_DETALI').AsFloat>0 then
                cells[row, col].value:=data_search.FieldByName('KOLVO_DETALI').AsFloat;

              //остаток на начало периода
              sql_temp.SelectSQL.Clear;
              sql_temp.SelectSQL.Add('select ostatok from DETALI_OSTATOK_VSE_SKLADY(:id_detali, :period_end)');
              sql_temp.ParamByName('id_detali').Value:=detali_list.FieldByName('id_detali').AsInteger;;
              sql_temp.ParamByName('period_end').Value:=IncDay(Period_start.DateTime,-1);
              sql_temp.Open;
              cells[1,col].value:=sql_temp.FieldByName('ostatok').AsFloat;
              cells[1,col].FontColorRGB := clMaroon;
              sql_temp.Close;
              //остаток на конец периода
              sql_temp.SelectSQL.Clear;
              sql_temp.SelectSQL.Add('select ostatok from DETALI_OSTATOK_VSE_SKLADY(:id_detali, :period_end)');
              sql_temp.ParamByName('id_detali').Value:=detali_list.FieldByName('id_detali').AsInteger;;
              sql_temp.ParamByName('period_end').Value:=Period_End.DateTime;
              sql_temp.Open;
              cells[4,col].value:=sql_temp.FieldByName('ostatok').AsFloat;
              cells[4,col].FontColorRGB := clMaroon;
              sql_temp.Close;

              //приход за период
              sql_temp.SelectSQL.Clear;
              sql_temp.SelectSQL.Add('select prihod from DETALI_PRIHOD_PERIOD(:id_detali, :period_start, :period_end)');
              sql_temp.ParamByName('id_detali').Value:=detali_list.FieldByName('id_detali').AsInteger;;
              sql_temp.ParamByName('period_start').Value:=Period_start.DateTime;
              sql_temp.ParamByName('period_end').Value:=Period_End.DateTime;
              sql_temp.Open;
              if sql_temp.FieldByName('prihod').AsFloat>0 then
                cells[2, col].value:=sql_temp.FieldByName('prihod').AsFloat;
              cells[2,col].FontColorRGB := clMaroon;
              sql_temp.Close;
              //расход за период
              sql_temp.SelectSQL.Clear;
              sql_temp.SelectSQL.Add('select rashod from detali_rashod_period(:id_detali, :period_start, :period_end)');
              sql_temp.ParamByName('id_detali').Value:=detali_list.FieldByName('id_detali').AsInteger;;
              sql_temp.ParamByName('period_start').Value:=Period_start.DateTime;
              sql_temp.ParamByName('period_end').Value:=Period_End.DateTime;
              sql_temp.Open;
              if sql_temp.FieldByName('rashod').AsFloat>0 then
                cells[3, col].value:=sql_temp.FieldByName('rashod').AsFloat;
              cells[3,col].FontColorRGB := clMaroon;
              sql_temp.Close;

              inc(col);
              detali_list.Next;
              Application.ProcessMessages;
              L_Process.caption:=jobexec_vew[j];
              Inc(j);
              if j>4 then
                j:=1;
            end;//with xf.Workbook.Sheets[0]
        end;//while not detali_list.Eof

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
      detali_list.Free;
      gotovprod_list.Free;
      sql_temp.Free;
  end;
  ShowMessage('Данные выгружены');
end;

end.
