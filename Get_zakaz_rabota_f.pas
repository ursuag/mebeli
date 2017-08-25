unit Get_zakaz_rabota_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DateUtils, IBCustomDataSet,
  Hyperination, XLSFile;

type
  TF_Report_Get_zakaz_rabota = class(TForm)
    Panel1: TPanel;
    B_Exit: TButton;
    Label24: TLabel;
    Period_End: TDateTimePicker;
    E_AVR_Gotovprod: TEdit;
    B_AVR_gotovprod_select: TSpeedButton;
    B_AVR_gotovprod_clear: TSpeedButton;
    E_AVR_Zakaz: TEdit;
    B_AVR_zakaz_select: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label22: TLabel;
    Label25: TLabel;
    B_ShowReport: TButton;
    CB_Export_Excel: TCheckBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_AVR_gotovprod_selectClick(Sender: TObject);
    procedure B_AVR_gotovprod_clearClick(Sender: TObject);
    procedure B_AVR_zakaz_selectClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure B_ShowReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Report_Get_zakaz_rabota: TF_Report_Get_zakaz_rabota;
  id_zakaz_report: integer;
implementation

uses mebeli_dm, main_f, gotov_prod_f, zakaz_select_f,
  print_forms;
{$R *.dfm}

procedure export_excel;
var xf: TXLSFile;
    i,j: integer;
 FIB_Query: TIBDataSet;
 SaveDialog1: TSaveDialog;
 filename: string;
 fieldvalue:integer;
begin
  SaveDialog1:=TSaveDialog.Create(nil);
  SaveDialog1.Filter:='Excel files  |*.XLS';
  SaveDialog1.FileName:='ход_работы_заказами';
  SaveDialog1.Options := [ofOverwritePrompt];
  if not SaveDialog1.Execute then
    begin
      SaveDialog1.Free;
      exit;
    end;

  filename:=SaveDialog1.FileName+'.xls';
  xf:= TXLSFile.Create;
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;
  FIB_Query.SelectSQL.Add('select name from vidy_rabot where id>1 order by id');
  FIB_Query.Open;
  FIB_Query.first;
    with xf.Workbook.Sheets[0] do
    begin
      cells[0,0].Value:='Ход работ по выполнению заказа на дату '+DateToStr(F_Report_Get_zakaz_rabota.Period_End.Date);
      cells[0, 0].FontBold:=true;
      cells[2,0].Value:='Заказ';
      cells[2,1].Value:='Заказ кол-во';
      cells[2,2].Value:='Артикул';
      cells[2,3].Value:='Готовая продукция';
      for i:=4 to 14 do
        begin
          cells[2,i].Value:=FIB_Query.FieldByname('name').AsString;
          FIB_Query.Next;
        end;
      cells[2,15].Value:='Отгрузка';
      //
      FIB_Query.Close;
      FIB_Query.SelectSQL.Clear;
      FIB_Query.SelectSQL.Add('select zakaz, zakaz_kolvo, (select article from gotov_prod_0 where id=id_gotov_prod), gotovprod_name, akt_kolvo2, akt_kolvo3, akt_kolvo4, akt_kolvo5, akt_kolvo6, akt_kolvo7,');
      FIB_Query.SelectSQL.Add('akt_kolvo8, akt_kolvo9, akt_kolvo10, akt_kolvo11, akt_kolvo12, prodaja_kolvo');
      FIB_Query.SelectSQL.Add('from GET_ZAKAZ_RABOTA_KOLVO(:id_zakaz_report,:period_end)');
      FIB_Query.SelectSQL.Add('where ((zakaz_kolvo-prodaja_kolvo)<>0) order by zakaz, gotovprod_name');
      FIB_Query.ParamByName('id_zakaz_report').Value:=id_zakaz_report;
      FIB_Query.ParamByName('period_end').Value:=F_Report_Get_zakaz_rabota.Period_End.DateTime;
      FIB_Query.Open;
      i:=3;
      while not FIB_Query.Eof
      do
        begin
          for j:=0 to 15 do
            if TryStrToInt(FIB_Query.Fields[j].AsString,fieldvalue) then
              if FIB_Query.Fields[j].AsInteger>0 then
                Cells[i, j].Value:=FIB_Query.Fields[j].AsInteger
                else
            else
              Cells[i,j].Value:=FIB_Query.Fields[j].AsString;
          FIB_Query.Next;
          inc(i);
        end;
    end;
  xf.Workbook.Sheets[0].Columns.AutoFit(1,16);
  try
    xf.SaveAs(filename);
  finally
    begin
      xf.Destroy;
      SaveDialog1.Free;
      FIB_Query.Close;
      FIB_Query.Free;
   end;
  end;
  ShowMessage('Данные успешно сохранены');
end;

procedure TF_Report_Get_zakaz_rabota.FormCreate(Sender: TObject);
begin
  period_end.Date:=Date;
  cb_export_excel.Checked:=false;
  id_zakaz_report:=-1;
end;

procedure TF_Report_Get_zakaz_rabota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
end;

procedure TF_Report_Get_zakaz_rabota.B_AVR_gotovprod_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Gotov_prod.ShowModal;
end;

procedure TF_Report_Get_zakaz_rabota.B_AVR_gotovprod_clearClick(Sender: TObject);
begin
  E_AVR_gotovprod.Text:='';
end;

procedure TF_Report_Get_zakaz_rabota.B_AVR_zakaz_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Zakaz_select.ShowModal;
  id_zakaz_report:=id_zakaz;
  E_AVR_Zakaz.Text:=IntToStr(id_zakaz_report);
end;

procedure TF_Report_Get_zakaz_rabota.SpeedButton2Click(Sender: TObject);
begin
  E_AVR_Zakaz.Text:='';
  id_zakaz_report:=-1;
end;

procedure TF_Report_Get_zakaz_rabota.B_ShowReportClick(Sender: TObject);
begin
  if cb_export_excel.Checked then
    export_excel
  else
    begin
      F_print_forms.IBQuery1.Close;
      F_print_forms.IBQuery1.SQL.Clear;
      F_print_forms.IBQuery1.SQL.Add('select * from GET_ZAKAZ_RABOTA_KOLVO(:id_zakaz_report,:period_end) where ((zakaz_kolvo-prodaja_kolvo)<>0) order by zakaz, gotovprod_name');
      F_print_forms.IBQuery1.ParamByName('id_zakaz_report').Value:=id_zakaz_report;
      F_print_forms.IBQuery1.ParamByName('period_end').Value:=Period_End.DateTime;
      F_print_forms.IBQuery1.Open;

      DM_Mebeli.IB_Vidy_rabot.Open;
      DM_Mebeli.IB_Vidy_rabot.First;
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo2.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo3.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo4.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo5.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo6.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo7.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo8.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo9.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo10.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo11.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_kolvo12.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Close;
      F_PRINT_FORMS.L_Zakaz_hod_raboty_date.Caption:='на дату '+DateToStr(Period_End.Date);
      F_PRINT_FORMS.QR_Zakaz_hod_raboty.Preview;
    end;
end;

end.
