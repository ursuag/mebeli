unit Report_Get_Zakaz_Ostalosi_Sdelati_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DateUtils, IBCustomDataSet,
  Hyperination, XLSFile, XLSFormat, XLSWorkbook;

type
  TF_Report_Get_Zakaz_Ostalosi_Sdelati = class(TForm)
    Label24: TLabel;
    B_AVR_gotovprod_select: TSpeedButton;
    B_AVR_gotovprod_clear: TSpeedButton;
    B_AVR_zakaz_select: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label22: TLabel;
    Label25: TLabel;
    Panel1: TPanel;
    B_Exit: TButton;
    B_ShowReport: TButton;
    Period_End: TDateTimePicker;
    E_AVR_Gotovprod: TEdit;
    E_AVR_Zakaz: TEdit;
    CB_Export_Excel: TCheckBox;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure B_ShowReportClick(Sender: TObject);
    procedure B_AVR_gotovprod_selectClick(Sender: TObject);
    procedure B_AVR_zakaz_selectClick(Sender: TObject);
    procedure B_AVR_gotovprod_clearClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Report_Get_Zakaz_Ostalosi_Sdelati: TF_Report_Get_Zakaz_Ostalosi_Sdelati;

implementation

uses mebeli_dm, main_f, gotov_prod_f, zakaz_select_f,
  print_forms, Print_Forms_2_f;

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
  SaveDialog1.FileName:='заказ_осталось_сделать';
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
      cells[0,0].Value:='Сколько осталовь сделать продукции по видам работ на дату '+DateToStr(F_Report_Get_Zakaz_Ostalosi_Sdelati.Period_End.Date);
      cells[0, 0].FontBold:=true;
      cells[2,0].Value:='Заказ';
      cells[2,1].Value:='Заказ кол-во';
      cells[2,2].Value:='Заказ дней';
      cells[2,3].Value:='Артикул';
      cells[2,4].Value:='Готовая продукция';
      for i:=5 to 16 do
        begin
          cells[2,i].Value:=FIB_Query.FieldByname('name').AsString;
          FIB_Query.Next;
        end;
      cells[2,17].Value:='Отгрузка';
      for i:=0 to 17 do
        begin
          cells[2,i].FontBold:=true;
          cells[2,i].BorderColorIndex[xlBorderAll]:= xlColorBlack;
          cells[2,i].BorderStyle[xlBorderAll]:= bsThin;
        end;
      //
      FIB_Query.Close;
      FIB_Query.SelectSQL.Clear;
      FIB_Query.SelectSQL.Add('select zakaz, zakaz_kolvo, dney_v_rabote, (select article from gotov_prod_0 where id=id_gotov_prod), gotovprod_name, is_raspileno, akt_kolvo_ostatok2, akt_kolvo_ostatok3,');
      FIB_Query.SelectSQL.Add('akt_kolvo_ostatok4, akt_kolvo_ostatok5, akt_kolvo_ostatok6, akt_kolvo_ostatok7, akt_kolvo_ostatok8, akt_kolvo_ostatok9, akt_kolvo_ostatok10, akt_kolvo_ostatok11, akt_kolvo_ostatok12, prodaja_ostatok');
      FIB_Query.SelectSQL.Add('from GET_ZAKAZ_OSTALOSI_SDELATI (:period_end, :id_zakaz) where (prodaja_ostatok>0) order by zakaz, gotovprod_name');
      FIB_Query.ParamByName('id_zakaz').Value:=id_zakaz;
      FIB_Query.ParamByName('period_end').Value:=F_Report_Get_Zakaz_Ostalosi_Sdelati.Period_End.DateTime;
      FIB_Query.Open;
      i:=3;
      while not FIB_Query.Eof
      do
        begin
          for j:=0 to 17 do
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
  xf.Workbook.Sheets[0].Columns.AutoFit(1,17);
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

procedure TF_Report_Get_Zakaz_Ostalosi_Sdelati.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
end;

procedure TF_Report_Get_Zakaz_Ostalosi_Sdelati.FormCreate(Sender: TObject);
begin
  period_end.Date:=Date;
  cb_export_excel.Checked:=false;
end;

procedure TF_Report_Get_Zakaz_Ostalosi_Sdelati.B_ShowReportClick(
  Sender: TObject);
begin
  if cb_export_excel.Checked then
    export_excel
  else
    begin
      F_print_forms_2.IBQuery1.Close;
      F_print_forms_2.IBQuery1.SQL.Clear;
      F_print_forms_2.IBQuery1.SQL.Add('select * from GET_ZAKAZ_OSTALOSI_SDELATI (:period_end, :id_zakaz) where (prodaja_ostatok>0) order by zakaz, gotovprod_name');
      F_print_forms_2.IBQuery1.ParamByName('id_zakaz').value:=id_zakaz;
      F_print_forms_2.IBQuery1.ParamByName('period_end').Value:=Period_End.DateTime;
      F_print_forms_2.IBQuery1.Open;

      DM_Mebeli.IB_Vidy_rabot.Open;
      DM_Mebeli.IB_Vidy_rabot.First;
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo2.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo3.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo4.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo5.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo6.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo7.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo8.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo9.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo10.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo11.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Next;
      F_print_forms_2.L_Zakaz_ostalosi_sdelati_kolvo12.Caption:=BreakWord(DM_Mebeli.IB_Vidy_rabot.FieldByName('name').AsString);
      DM_Mebeli.IB_Vidy_rabot.Close;

      F_print_forms_2.L_Zakaz_ostalosi_sdelati_date.Caption:='на дату '+DateToStr(Period_End.Date);
      F_print_forms_2.QR_Zakaz_ostalosi_sdelati.Preview;
    end;
end;

procedure TF_Report_Get_Zakaz_Ostalosi_Sdelati.B_AVR_gotovprod_selectClick(
  Sender: TObject);
begin
  operation:='SELECT';
  F_Gotov_prod.ShowModal;
end;

procedure TF_Report_Get_Zakaz_Ostalosi_Sdelati.B_AVR_zakaz_selectClick(
  Sender: TObject);
begin
  operation:='SELECT';
  F_Zakaz_select.ShowModal;
  E_AVR_Zakaz.Text:=IntToStr(id_zakaz);
end;

procedure TF_Report_Get_Zakaz_Ostalosi_Sdelati.B_AVR_gotovprod_clearClick(
  Sender: TObject);
begin
  E_AVR_gotovprod.Text:='';
end;

procedure TF_Report_Get_Zakaz_Ostalosi_Sdelati.SpeedButton2Click(
  Sender: TObject);
begin
  E_AVR_Zakaz.Text:='';
  id_zakaz:=-1;
end;

end.
