unit Report_Ostatok_materialy_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls, DateUtils,
  IBCustomDataSet, Hyperination, XLSFile, IBQuery;

type
  TF_Report_Ostatok_materialy = class(TForm)
    Label15: TLabel;
    D_ostatok_sklad: TDateTimePicker;
    Label13: TLabel;
    DBG_Sklad: TDBGrid;
    B_OSTSKL_Listy_select: TSpeedButton;
    B_OSTSKL_Listy_clear: TSpeedButton;
    CB_OSTSKL_Listy_grupa: TCheckBox;
    B_OstSkl_Detali_select: TSpeedButton;
    B_OstSkl_Detali_clear: TSpeedButton;
    CB_OstSkl_Detali_grupa: TCheckBox;
    B_OstSkl_Furnitura_select: TSpeedButton;
    B_OstSkl_Furnitura_clear: TSpeedButton;
    CB_OstSkl_Furnitura_grupa: TCheckBox;
    CB_Excel_ostat_sklad: TCheckBox;
    Panel5: TPanel;
    B_Ostatki_sklad: TButton;
    RG_OstSkl: TRadioGroup;
    E_OSTSKL_Listy: TEdit;
    E_OstSkl_Detali: TEdit;
    E_OstSkl_Furnitura: TEdit;
    B_Exit: TButton;
    procedure B_Ostatki_skladClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_OSTSKL_Listy_selectClick(Sender: TObject);
    procedure B_OstSkl_Detali_selectClick(Sender: TObject);
    procedure B_OstSkl_Furnitura_selectClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure B_OstSkl_Furnitura_clearClick(Sender: TObject);
    procedure B_OstSkl_Detali_clearClick(Sender: TObject);
    procedure B_OSTSKL_Listy_clearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Report_Ostatok_materialy: TF_Report_Ostatok_materialy;
  id_sklad: integer;
  id_pilomat_grupa: integer;
  id_listy: integer;
  id_detali: integer;
//        id_furnitura: integer;
  id_furnitura_grupa: integer;

implementation

uses mebeli_dm, main_f, print_forms, pilomat_f, furnitura_f;

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
      cells[0,0].Value:='Ход работ по выполнению заказа на дату '+DateToStr(F_Report_Ostatok_materialy.D_ostatok_sklad.Date);
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
{      FIB_Query.Close;
      FIB_Query.SelectSQL.Clear;
      FIB_Query.SelectSQL.Add('select zakaz, zakaz_kolvo, (select article from gotov_prod_0 where id=id_gotov_prod), gotovprod_name, akt_kolvo2, akt_kolvo3, akt_kolvo4, akt_kolvo5, akt_kolvo6, akt_kolvo7,');
      FIB_Query.SelectSQL.Add('akt_kolvo8, akt_kolvo9, akt_kolvo10, akt_kolvo11, akt_kolvo12, prodaja_kolvo');
      FIB_Query.SelectSQL.Add('from GET_ZAKAZ_RABOTA_KOLVO(:id_zakaz_report,:period_end)');
      FIB_Query.SelectSQL.Add('where ((zakaz_kolvo-prodaja_kolvo)<>0) order by zakaz, gotovprod_name');
      FIB_Query.ParamByName('id_zakaz_report').Value:=id_zakaz_report;
      FIB_Query.ParamByName('period_end').Value:=F_Report_Get_zakaz_rabota.Period_End.DateTime;
      FIB_Query.Open;}
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

procedure TF_Report_Ostatok_materialy.B_Ostatki_skladClick(
  Sender: TObject);
var
  IB_tmp: TIBQuery;
begin
  B_Ostatki_sklad.Tag:=1;//начали выполнение отчета
  IB_tmp:=TIBQuery.Create(nil);
  IB_tmp.Database:=DM_Mebeli.DB_Mebeli;
  id_sklad:=DM_Mebeli.IB_Sklad.FieldByname('id').AsInteger;
  Case RG_OstSkl.ItemIndex of
  0: begin
       F_Print_Forms.IBQuery1.SQL.Clear;
       F_Print_Forms.IBQuery1.SQL.Add('select 2 as TIP_MATERIALA, (select name from sklad where id=:id_sklad) as sklad_name, (select article from pilomat_grupa where id=id_grupa)||'+Chr(39)+'_'+Chr(39)+'||grupa_name grupa_name, ');
       F_Print_Forms.IBQuery1.SQL.Add('listy_name as name, LIST_OSTATOK as kol_vo, '+Chr(39)+'шт'+Chr(39)+' as ED_IZM, AREA');
       F_Print_Forms.IBQuery1.SQL.Add('from OSTATOK_LIST( :id_listy, :id_sklad, :period_end) ost');
       F_Print_Forms.IBQuery1.SQL.Add('order by sklad_name, ost.grupa_name, ost.listy_name');
       IF CB_OstSkl_Listy_grupa.Checked Then
         begin
           F_Print_Forms.IBQuery1.SQL[3]:='where id_grupa='+IntToStr(id_pilomat_grupa);
           F_Print_Forms.IBQuery1.SQL.Add('order by sklad_name, grupa_name, id_listy');
           F_Print_Forms.IBQuery1.ParamByName('id_listy').Value:=null;
         end
       ELSE
         F_Print_Forms.IBQuery1.ParamByName('id_listy').Value:=id_listy;
     end;
  1: begin
       F_Print_Forms.IBQuery1.SQL.Clear;
       F_Print_Forms.IBQuery1.SQL.Add('select 1 as TIP_MATERIALA, (select name from sklad where id=:id_sklad) as sklad_name, grupa_name, detali_name as name, ID_DETALI, DETALI_OSTATOK as kol_vo, '+Chr(39)+'шт'+Chr(39)+' as ED_IZM, AREA');
       F_Print_Forms.IBQuery1.SQL.Add('from DETALI_OSTATOK(:id_detali,:id_sklad,:period_end)');
       F_Print_Forms.IBQuery1.SQL.Add('order by sklad_name, grupa_name, detali_name');
       IF CB_OstSkl_Detali_grupa.Checked Then
         begin
           F_Print_Forms.IBQuery1.SQL[2]:='where id_grupa='+IntToStr(id_pilomat_grupa);
           F_Print_Forms.IBQuery1.SQL.Add('order by sklad_name, grupa_name, detali_name');
           F_Print_Forms.IBQuery1.ParamByName('id_detali').Value:=null;
         end
       ELSE
         F_Print_Forms.IBQuery1.ParamByName('id_detali').Value:=id_detali;
     end;
  2: begin
       F_Print_Forms.IBQuery1.SQL.Clear;
       F_Print_Forms.IBQuery1.SQL.Add('select 3 as TIP_MATERIALA, (select name from sklad where id=:id_sklad) as sklad_name, grupa_name, furnitura_name as name, FURNITURA_OSTATOK as kol_vo, (select ed_izm from furnitura where id=ID_FURNITURA_OUT) as ED_IZM, 0 as AREA');
       F_Print_Forms.IBQuery1.SQL.Add('from FURNITURA_OSTATOK(:id_furnitura,:id_sklad,:period_end)');
       F_Print_Forms.IBQuery1.SQL.Add('order by sklad_name, grupa_name, furnitura_name');
       IF CB_OstSkl_Furnitura_grupa.Checked Then
         begin
           F_Print_Forms.IBQuery1.SQL[2]:='where id_grupa='+IntToStr(id_furnitura_grupa);
           F_Print_Forms.IBQuery1.SQL.Add('order by sklad_name, grupa_name, furnitura_name');
           F_Print_Forms.IBQuery1.ParamByName('id_furnitura').Value:=null;
         end
       ELSE
         F_Print_Forms.IBQuery1.ParamByName('id_furnitura').Value:=id_furnitura;
     end;
  end;//Case
  F_Print_Forms.IBQuery1.ParamByName('id_sklad').Value:=id_sklad;
  F_Print_Forms.IBQuery1.ParamByName('period_end').Value:=D_ostatok_sklad.DateTime;
  F_Print_Forms.IBQuery1.Open;
  IF F_Print_Forms.IBQuery1.FieldByName('kol_vo').IsNull Then
    begin
      ShowMessage('Остатков нет');
      exit;
    end;

      IF CB_Excel_ostat_sklad.Checked Then
        export_excel
      ELSE
          F_Print_Forms.QR_Ostatki_sklad.Preview;

  IF DM_Mebeli.IBTransaction1.Active Then
    DM_Mebeli.IBTransaction1.Rollback;
  IB_tmp.free;
  DM_Mebeli.IB_Sklad.Open;
  DM_Mebeli.IB_Sklad.Locate('id',id_sklad,[]);
end;//proc

procedure TF_Report_Ostatok_materialy.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_Sklad.Open;
end;

procedure TF_Report_Ostatok_materialy.FormCreate(Sender: TObject);
begin
  D_ostatok_sklad.Date:=Today();
  E_OSTSKL_Listy.Text:='';
  E_OSTSKL_Detali.Text:='';
  E_OSTSKL_Furnitura.Text:='';

end;

procedure TF_Report_Ostatok_materialy.B_OSTSKL_Listy_selectClick(
  Sender: TObject);
var
   FIB_Query: TIBDataSet;
begin
  operation:='SELECT_STOCKS';
  if F_Pilomat.ShowModal=mrOk then
    begin
      id_detali:=-1;
      E_OstSkl_Detali.Text:='';
      RG_OstSkl.ItemIndex:=0;
      id_listy:=F_Pilomat.id_listy;
      id_pilomat_grupa:=F_Pilomat.id_group;
      FIB_Query:=TIBDataSet.Create(nil);
      FIB_Query.Database:=DM_Mebeli.DB_Mebeli;
      FIB_Query.SelectSQL.Add('select pg.name grupa_name, pl.name list_name from pilomat_grupa pg, pilomat_listy pl where (pg.id=pl.id_grupa) and (pl.id=:id_list)');
      FIB_Query.ParamByname('id_list').value:=id_listy;
      FIB_Query.Open;
      E_OSTSKL_Listy.Text:=FIB_Query.FieldByName('grupa_name').AsString+' / '+FIB_Query.FieldByName('list_name').AsString;
      FIB_Query.Close;
      FIB_Query.Free;
    end;
end;//proc

procedure TF_Report_Ostatok_materialy.B_OstSkl_Detali_selectClick(
  Sender: TObject);
var
   FIB_Query: TIBDataSet;
begin
  operation:='SELECT';
  if F_Pilomat.ShowModal=mrOk then
    begin
      id_listy:=-1;
      E_OstSkl_Listy.Text:='';
      RG_OstSkl.ItemIndex:=1;
      id_detali:=F_Pilomat.id_detali;
      id_pilomat_grupa:=F_Pilomat.id_group;
      FIB_Query:=TIBDataSet.Create(nil);
      FIB_Query.Database:=DM_Mebeli.DB_Mebeli;
      FIB_Query.SelectSQL.Add('select pg.name grupa_name, pd.name detali_name from pilomat_grupa pg, pilomat_detali pd where (pg.id=pd.id_grupa) and (pd.id=:id_detali)');
      FIB_Query.ParamByname('id_detali').value:=id_detali;
      FIB_Query.Open;
      E_OstSkl_Detali.Text:=FIB_Query.FieldByName('grupa_name').AsString+' / '+FIB_Query.FieldByName('detali_name').AsString;
      FIB_Query.Close;
      FIB_Query.Free;
    end;
end;//proc

procedure TF_Report_Ostatok_materialy.B_OstSkl_Furnitura_selectClick(
  Sender: TObject);
var
   FIB_Query: TIBDataSet;
begin
  operation:='SELECT';
  if F_Furnitura.ShowModal=mrOk then
    begin
      E_OstSkl_Listy.Text:='';
      E_OstSkl_Detali.Text:='';
      RG_OstSkl.ItemIndex:=2;
      FIB_Query:=TIBDataSet.Create(nil);
      FIB_Query.Database:=DM_Mebeli.DB_Mebeli;
      FIB_Query.SelectSQL.Add('select fg.id id_grupa, fg.name grupa_name, f.name furnitura_name from furnitura_grupa fg, furnitura f where (fg.id=f.id_parent) and (f.id=:id_furnitura)');
      FIB_Query.ParamByname('id_furnitura').value:=id_furnitura;
      FIB_Query.Open;
      E_OstSkl_Furnitura.Text:=FIB_Query.FieldByName('grupa_name').AsString+' / '+FIB_Query.FieldByName('furnitura_name').AsString;
      id_furnitura_grupa:=FIB_Query.FieldByName('id_grupa').AsInteger;
      FIB_Query.Close;
      FIB_Query.Free;
    end;
end;

procedure TF_Report_Ostatok_materialy.B_ExitClick(Sender: TObject);
begin
  F_Report_Ostatok_materialy.Close;
end;

procedure TF_Report_Ostatok_materialy.B_OstSkl_Furnitura_clearClick(
  Sender: TObject);
begin
  E_OstSkl_furnitura.Text:='';
  id_furnitura:=-1;
end;

procedure TF_Report_Ostatok_materialy.B_OstSkl_Detali_clearClick(
  Sender: TObject);
begin
  E_OstSkl_detali.Text:='';
  id_detali:=-1;
  id_pilomat_grupa:=-1;
end;

procedure TF_Report_Ostatok_materialy.B_OSTSKL_Listy_clearClick(
  Sender: TObject);
begin
  E_OstSkl_listy.Text:='';
  id_listy:=-1;
  id_pilomat_grupa:=-1;
end;

end.
