unit reports_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, Mask, DB,
  XPMan, EXLReportExcelTLB, EXLReportBand, EXLReport, Buttons, 
  IBCustomDataSet, IBQuery, DateUtils;

type
  TF_Reports = class(TForm)
    PC_Report_select: TPageControl;
    Ostat_sklad: TTabSheet;
    Ostat_vid_rab: TTabSheet;
    Dvij_mater: TTabSheet;
    Label1: TLabel;
    Panel1: TPanel;
    B_Exit: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Date_Ostatok_vidrab: TDateTimePicker;
    Label9: TLabel;
    DBGrid2: TDBGrid;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    Button2: TButton;
    Panel2: TPanel;
    B_OK_Ostatok_vidrab: TButton;
    CheckBox1: TCheckBox;
    PB_Ostatki_vidrab: TProgressBar;
    Label11: TLabel;
    Dvij_mater_date_Begin: TDateTimePicker;
    Label12: TLabel;
    Dvij_mater_date_End: TDateTimePicker;
    Panel3: TPanel;
    B_dvijenie_materialov: TButton;
    Label14: TLabel;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    B_Ostatki_sklad: TButton;
    Label15: TLabel;
    D_ostatok_sklad: TDateTimePicker;
    GroupBox1: TGroupBox;
    B_select_furnitura: TButton;
    DBE_Detali: TDBEdit;
    DBE_Furnitura: TDBEdit;
    RB_Listy: TRadioButton;
    RB_Detali: TRadioButton;
    RB_Furnitura: TRadioButton;
    CB_Excel: TCheckBox;
    Label13: TLabel;
    DBG_Sklad: TDBGrid;
    Bevel3: TBevel;
    Bevel2: TBevel;
    CB_Excel_ostat_sklad: TCheckBox;
    DataSource1: TDataSource;
    Report_Akt_vip_rab: TTabSheet;
    Period_Start: TDateTimePicker;
    Period_End: TDateTimePicker;
    Label23: TLabel;
    Label24: TLabel;
    Panel8: TPanel;
    Button4: TButton;
    RG_AVR_Report_Type: TRadioGroup;
    B_AVR_Sotrudnik_select: TSpeedButton;
    E_AVR_Sotrudnik: TEdit;
    E_AVR_Gotovprod: TEdit;
    B_AVR_Sotrudnik_clear: TSpeedButton;
    B_AVR_gotovprod_clear: TSpeedButton;
    B_AVR_gotovprod_select: TSpeedButton;
    E_AVR_Category: TEdit;
    B_AVR_Category_select: TSpeedButton;
    B_AVR_Category_clear: TSpeedButton;
    E_AVR_Vidrabot: TEdit;
    B_AVR_Vidrabot_select: TSpeedButton;
    B_AVR_Vidrabot_clear: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    CB_AVR_Podrobno: TCheckBox;
    Label25: TLabel;
    E_AVR_Zakaz: TEdit;
    B_AVR_zakaz_select: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBE_Listy: TDBEdit;
    E_OSTSKL_Listy: TEdit;
    CB_OSTSKL_Listy_grupa: TCheckBox;
    E_OstSkl_Detali: TEdit;
    CB_OstSkl_Detali_grupa: TCheckBox;
    E_OstSkl_Furnitura: TEdit;
    CB_OstSkl_Furnitura_grupa: TCheckBox;
    RG_OstSkl: TRadioGroup;
    B_OSTSKL_Listy_select: TSpeedButton;
    B_OSTSKL_Listy_clear: TSpeedButton;
    B_OstSkl_Detali_select: TSpeedButton;
    B_OstSkl_Detali_clear: TSpeedButton;
    B_OstSkl_Furnitura_select: TSpeedButton;
    B_OstSkl_Furnitura_clear: TSpeedButton;
    Tab_Sverka: TTabSheet;
    Tab_Sebestoimosti: TTabSheet;
    Label2: TLabel;
    Panel4: TPanel;
    B_Show_sverka: TButton;
    Panel6: TPanel;
    Sverka_fileName: TEdit;
    OpenDialog1: TOpenDialog;
    B_load_from_1c: TBitBtn;
    DBG_Sverka: TDBGrid;
    Label3: TLabel;
    DT_Sverka_date: TDateTimePicker;
    RG_Sverka: TRadioGroup;
    L_Export1C_date: TLabel;
    EXL_Sverka: TEXLReport;
    SaveDialog1: TSaveDialog;
    procedure B_Ostatki_skladClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure Spisanie_periodEnter(Sender: TObject);
    procedure B_Select_detaliClick(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_OK_Ostatok_vidrabClick(Sender: TObject);
    procedure PC_Report_selectChange(Sender: TObject);
    procedure B_select_furnituraClick(Sender: TObject);
    procedure B_dvijenie_materialovClick(Sender: TObject);
    procedure RB_ListyClick(Sender: TObject);
    procedure RB_DetaliClick(Sender: TObject);
    procedure RB_FurnituraClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EXLR_Ostatki_skladGetFieldValue(Sender: TObject;
      const Field: String; var Value: OleVariant);
    procedure B_Show_Gotprod_ostatok_vidrabotClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure B_AVR_Sotrudnik_clearClick(Sender: TObject);
    procedure B_AVR_gotovprod_clearClick(Sender: TObject);
    procedure B_AVR_Sotrudnik_selectClick(Sender: TObject);
    procedure B_AVR_Category_clearClick(Sender: TObject);
    procedure B_AVR_Vidrabot_clearClick(Sender: TObject);
    procedure B_AVR_Category_selectClick(Sender: TObject);
    procedure B_AVR_gotovprod_selectClick(Sender: TObject);
    procedure B_AVR_Vidrabot_selectClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure B_AVR_zakaz_selectClick(Sender: TObject);
    procedure B_Select_ostatki_skladClick(Sender: TObject);
    procedure B_OSTSKL_Listy_selectClick(Sender: TObject);
    procedure Ostat_skladShow(Sender: TObject);
    procedure B_OstSkl_Detali_selectClick(Sender: TObject);
    procedure B_OstSkl_Furnitura_selectClick(Sender: TObject);
    procedure B_OSTSKL_Listy_clearClick(Sender: TObject);
    procedure B_OstSkl_Detali_clearClick(Sender: TObject);
    procedure B_OstSkl_Furnitura_clearClick(Sender: TObject);
    procedure B_load_from_1cClick(Sender: TObject);
    procedure B_Show_sverkaClick(Sender: TObject);
    procedure EXL_SverkaGetFieldValue(Sender: TObject; const Field: String;
      var Value: OleVariant);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
 Dvij_mater_material: string;
        id_gotovprod: integer;
        id_sotrudnik: integer;
         id_vidrabot: integer;
         id_category: integer;
         id_zakaz: integer;
            id_sklad: integer;
            id_listy: integer;
           id_detali: integer;
        id_furnitura: integer;
    id_pilomat_grupa: integer;
  id_furnitura_grupa: integer;

  end;

var
           F_Reports: TF_Reports;
         DateOstatok: TDateTime;
        report_break: boolean; //чтобы прервать выполнение отчета по нажатию ESC
    F_Reports_active: boolean;

 Old_listy_SelectSQL: string;
 Old_furnitura_SelectSQL: string;

  ib_sverka: TIBDataSet;
  ds_sverka: TDataSource;

implementation

uses main_f, mebeli_dm, print_forms, pilomat_f, furnitura_f, sotrudniki_f,
     Gotov_prod_categories_f, gotov_prod_f, vidy_rabot_f, zakaz_select_f,
     hyperination, Print_Forms_2_f;

{$R *.dfm}

procedure TF_Reports.B_Ostatki_skladClick(Sender: TObject);
var
  IB_tmp: TIBQuery;
begin
  B_Ostatki_sklad.Tag:=1;//начали выполнение отчета
  IB_tmp:=TIBQuery.Create(nil);
  IB_tmp.Database:=DM_Mebeli.DB_Mebeli;
  DateOstatok:=D_ostatok_sklad.DateTime;

  Case RG_OstSkl.ItemIndex of
  0: begin
       F_Print_Forms.IBQuery1.SQL.Clear;
       F_Print_Forms.IBQuery1.SQL.Add('select 2 as TIP_MATERIALA, (select name from sklad where id=:id_sklad) as sklad_name, grupa_name, listy_name as name, LIST_OSTATOK as kol_vo, '+Chr(39)+'шт'+Chr(39)+' as ED_IZM, AREA');
       F_Print_Forms.IBQuery1.SQL.Add('from OSTATOK_LIST(:id_listy,:id_sklad,:period_end)');
       F_Print_Forms.IBQuery1.SQL.Add('order by sklad_name, grupa_name, listy_name');
       IF id_listy=-1 Then
         F_Print_Forms.IBQuery1.ParamByName('id_listy').Value:=null
       ELSE
         IF CB_OstSkl_Listy_grupa.Checked Then
           begin
             F_Print_Forms.IBQuery1.SQL[2]:='where id_grupa='+IntToStr(id_pilomat_grupa);
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
       IF id_detali=-1 Then
         F_Print_Forms.IBQuery1.ParamByName('id_detali').Value:=null
       ELSE
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
       IF id_furnitura=-1 Then
         F_Print_Forms.IBQuery1.ParamByName('id_furnitura').Value:=null
       ELSE
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
  F_Print_Forms.IBQuery1.ParamByName('id_sklad').Value:=DM_Mebeli.IB_Sklad.FieldByName('id').AsInteger;
  F_Print_Forms.IBQuery1.ParamByName('period_end').Value:=DateOstatok;
  F_Print_Forms.IBQuery1.Open;
  IF F_Print_Forms.IBQuery1.FieldByName('kol_vo').IsNull Then
    begin
      ShowMessage('Остатков нет');
      exit;
    end;

      IF CB_Excel_ostat_sklad.Checked Then //если отмечено экспортировать в Excel
        begin
//          EXLR_Ostatki_sklad.TemplSheet:='ostat_sklad';
//          EXLR_Ostatki_sklad.Show('');
        end
      ELSE
        begin
          DateOstatok:=D_ostatok_sklad.DateTime;
          F_Print_Forms.QR_Ostatki_sklad.Preview;
        end;
  IF DM_Mebeli.IBTransaction1.Active Then
    DM_Mebeli.IBTransaction1.Rollback;
  IB_tmp.free;
  PC_Report_select.Enabled:=true;
  B_Ostatki_sklad.Tag:=0;//закончили выполнение отчета
  DM_Mebeli.IB_Sklad.Open;
end;//proc

procedure TF_Reports.B_ExitClick(Sender: TObject);
begin
  Close;
end;//proc

procedure TF_Reports.Spisanie_periodEnter(Sender: TObject);
begin
  DM_Mebeli.IB_Vidy_rabot.Open;
  DM_Mebeli.IB_Pilomat_detali.Open;
end;//proc

procedure TF_Reports.DBGrid1Exit(Sender: TObject);
begin
  id_vidrabot:=DM_Mebeli.IB_Vidy_rabot.FieldByname('ID').AsInteger;
end;//proc

procedure TF_Reports.B_Select_detaliClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Pilomat.ShowModal;
  DM_Mebeli.IB_Pilomat_grupa.Open;
  DM_Mebeli.IB_Pilomat_detali.Open;
  DM_Mebeli.IB_Pilomat_listy.Open;
  DM_Mebeli.IB_Pilomat_detali.Locate('ID',F_Pilomat.id_detali,[]);
  DM_Mebeli.IB_Pilomat_grupa.Locate('ID',F_Pilomat.id_listy,[]);
end;//proc

procedure TF_Reports.FormActivate(Sender: TObject);
begin
  Old_listy_SelectSQL:=DM_Mebeli.IB_Pilomat_listy.SelectSQL[1];
  Old_furnitura_SelectSQL:=DM_Mebeli.IB_Furnitura.SelectSQL[1];

  DM_Mebeli.IB_Pilomat_listy.SelectSQL[1]:='';
  DM_Mebeli.IB_Furnitura.SelectSQL[1]:='';
  Date_Ostatok_vidrab.DateTime:=Today;
  D_ostatok_sklad.DateTime:=Today;

  Dvij_mater_date_Begin.DateTime:=StartOfTheMonth(Today);
  Dvij_mater_date_End.DateTime:=Today;

  PC_Report_select.TabIndex:=0;
  RB_Listy.Checked:=true;
  RB_Detali.Checked:=false;
  RB_Furnitura.Checked:=false;
  //оставляем только одну таблицу для вывода отчета: ЛИСТЫ или ДЕТАЛИ или КОМПЛЕКТУЮЩИЕ
  //чтобы пользователь не запутался
  DBE_Listy.Visible:=true;
  DBE_Detali.Visible:=false;
  DBE_Furnitura.Visible:=false;

//  F_Main.Exlreport1.DataSet:=F_Print_Forms.IBQuery1;
//  F_Main.Exlreport1.TemplSheet:='dvij_mater';

  DM_Mebeli.IB_Sklad.Open;
  DM_Mebeli.IB_Vidy_rabot.Open;
  id_sotrudnik:=-1;
  id_gotovprod:=-1;
  id_vidrabot:=-1;
  id_category:=-1;
  id_zakaz:=-1;
  IF role_name='READONLY' Then
    begin
      PC_Report_select.ActivePage:=Report_Akt_vip_rab;
      RG_AVR_Report_Type.ItemIndex:=5;
      RG_AVR_Report_Type.Enabled:=false;
    end;
  period_start.Date:=IncDay(Date,-30);
  period_end.Date:=Date;
  //****
  IB_Sverka:=TIBDataSet.Create(nil);
  DS_Sverka:=TDataSource.Create(nil);
  DS_Sverka.DataSet:=IB_Sverka;
  IB_Sverka.Transaction:=DM_Mebeli.IBTransaction1;
  IB_Sverka.Database:=DM_Mebeli.DB_Mebeli;
  IB_Sverka.SelectSQL.Add('select * from sverka');
  IB_Sverka.ModifySQL.Add('update sverka');
  IB_Sverka.ModifySQL.Add('set  ID = :ID, ID_TOVAR = :ID_TOVAR, ID_TOVAR_1C = :ID_TOVAR_1C, NAME_TOVAR = :NAME_TOVAR,  IS_PILOMAT = :IS_PILOMAT, KOLVO_INTERN = :KOLVO_INTERN,  KOLVO_1C = :KOLVO_1C,  SKLAD = :SKLAD');
  IB_Sverka.ModifySQL.Add('where ID = :OLD_ID');
  IB_Sverka.InsertSQL.Add('insert into sverka');
  IB_Sverka.InsertSQL.Add('(ID, ID_TOVAR, ID_TOVAR_1C, NAME_TOVAR, IS_PILOMAT, KOLVO_INTERN, KOLVO_1C, SKLAD)');
  IB_Sverka.InsertSQL.Add('values');
  IB_Sverka.InsertSQL.Add('(:ID, :ID_TOVAR, :ID_TOVAR_1C, :NAME_TOVAR, :IS_PILOMAT, :KOLVO_INTERN, :KOLVO_1C, :SKLAD)');
  IB_Sverka.GeneratorField.Field:='id';
  IB_Sverka.GeneratorField.Generator:='GEN_SVERKA_ID';
  IB_Sverka.GeneratorField.IncrementBy:=1;
  DT_Sverka_date.Date:=Date;
end;//proc

procedure TF_Reports.B_OK_Ostatok_vidrabClick(Sender: TObject);
var
       kol_vo: integer;
  id_vidrabot: integer;
begin
{  IF Role_name='USERS' Then
    exit;
}
  PC_Report_select.Enabled:=false;
  id_vidrabot:=DM_Mebeli.IB_Vidy_rabot.FieldValues['ID'];
  PB_Ostatki_vidrab.Position:=0;
  F_Print_Forms.IBQuery1.SQL.Clear;
  F_Print_Forms.IBQuery1.SQL.Add('select count(id) as rec_count from pilomat_detali');
  F_Print_Forms.IBQuery1.Open;
  PB_Ostatki_vidrab.Max:=F_Print_Forms.IBQuery1.FieldByName('REC_COUNT').AsInteger;

  DM_Mebeli.IB_Pilomat_detali.Open;
  DM_Mebeli.IB_Pilomat_detali.First;
  //удаляем старые остатки
  F_Print_Forms.IBQuery1.Close;
  F_Print_Forms.IBQuery1.SQL.Clear;
  F_Print_Forms.IBQuery1.SQL.Add('delete from OSTATKI_VID_RAB');
  F_Print_Forms.IBQuery1.ExecSQL;
  //готовим запрос для вставки новых оcтатков
  F_Print_Forms.IBQuery1.SQL.Clear;
  F_Print_Forms.IBQuery1.SQL.Add('insert into OSTATKI_VID_RAB (vid_rabot, detali_name, kol_vo)');
  F_Print_Forms.IBQuery1.SQL.Add('values (:vid_rabot, :detali_name, :kol_vo)');

  While not DM_Mebeli.IB_Pilomat_detali.Eof Do
    begin
      Application.ProcessMessages;
      kol_vo:=F_Main.Kolvo_detali_na_etape(DM_Mebeli.IB_Vidy_rabot.FieldValues['ID'], DM_Mebeli.IB_Pilomat_detali.FieldValues['ID'], DateToStr(Date_Ostatok_vidrab.Date), false);
      PB_Ostatki_vidrab.StepIt;
      IF kol_vo>0 Then
        begin
          F_Print_Forms.IBQuery1.ParamByName('VID_RABOT').Value:=DM_Mebeli.IB_Vidy_rabot.FieldValues['NAME'];
          F_Print_Forms.IBQuery1.ParamByName('DETALI_NAME').Value:=DM_Mebeli.IB_Pilomat_detali.FieldValues['NAME'];
          F_Print_Forms.IBQuery1.ParamByName('KOL_VO').Value:=kol_vo;
          F_Print_Forms.IBQuery1.ExecSQL;
        end;//IF kol_vo<>0
      DM_Mebeli.IB_Pilomat_detali.Next;
    end;//While not DM_Mebeli.IB_Pilomat_detali.Eof

  DM_Mebeli.IB_Vidy_rabot.Open;
  DM_Mebeli.IB_Pilomat_detali.Open;
  F_Print_Forms.IBQuery1.SQL.Clear;
  F_Print_Forms.IBQuery1.SQL.Add('select * from ostatki_vid_rab order by vid_rabot, detali_name');
  F_Print_Forms.IBQuery1.Open;
  F_Print_Forms.QR_Ostatki_vidrabot.Preview;
  DM_Mebeli.IB_Vidy_rabot.Locate('ID',id_vidrabot,[]);
  PC_Report_select.Enabled:=true;
  DM_Mebeli.IBTransaction1.Rollback;
end;//proc

procedure TF_Reports.PC_Report_selectChange(Sender: TObject);
begin
  IF PC_Report_select.ActivePage.Name='Dvij_mater' Then
    begin
      DM_Mebeli.IB_Sklad.Open;
      DM_Mebeli.IB_Furnitura_grupa.Open;
      DM_Mebeli.IB_Furnitura.Open;
    end;//IF PC_Report_select.ActivePage.Name='Dvij_mater'

  IF PC_Report_select.ActivePage.Name='Ostat_vid_rab' Then
    begin
      DM_Mebeli.IB_Vidy_rabot.Open;
      DM_Mebeli.IB_pilomat_detali.Open;
    end;//IF PC_Report_select.ActivePage.Name='Ostat_vid_rab'

  IF PC_Report_select.ActivePage.Name='Ostat_sklad' Then
    begin
      DM_Mebeli.IB_Sklad.Open;
    end;//IF PC_Report_select.ActivePage.Name='Ostat_sklad'

  IF PC_Report_select.ActivePage.Name='Report_Akt_vip_rab' Then
    begin
      DM_Mebeli.IB_Sotrudniki.Open;
      period_start.Date:=IncDay(Date,-30);
      period_end.Date:=Date;
      E_AVR_Sotrudnik.Text:='';
      E_AVR_category.Text:='';
      E_AVR_vidrabot.Text:='';
      E_AVR_gotovprod.Text:='';
      E_AVR_zakaz.Text:='';
      id_sotrudnik:=-1;
      id_gotovprod:=-1;
      id_vidrabot:=-1;
      id_category:=-1;
      id_zakaz:=-1;
    end;
  IF role_name='READONLY' Then
    begin
      Ostat_sklad.Visible:=false;
      Ostat_vid_rab.Visible:=false;
      Dvij_mater.Visible:=false;
      RG_AVR_Report_Type.ItemIndex:=5;
      RG_AVR_Report_Type.Enabled:=false;
    end;
end;//proc

procedure TF_Reports.B_select_furnituraClick(Sender: TObject);
begin
  operation:='SELECT';
  IF RB_Listy.Checked or RB_Detali.Checked Then
    F_Pilomat.ShowModal;

  DM_Mebeli.IB_Pilomat_grupa.Open;

  DM_Mebeli.IB_Pilomat_detali.Open;
  DM_Mebeli.IB_Pilomat_listy.Open;
  DM_Mebeli.IB_Pilomat_grupa.Locate('ID',F_Pilomat.id_group,[]);
  DM_Mebeli.IB_Pilomat_detali.Locate('ID',F_Pilomat.id_detali,[]);
  DM_Mebeli.IB_Pilomat_listy.Locate('ID',F_Pilomat.id_listy,[]);


  IF RB_Furnitura.Checked Then
    F_Furnitura.ShowModal;
  DM_Mebeli.IB_Furnitura_grupa.Open;
  DM_Mebeli.IB_Furnitura.Open;
  DM_Mebeli.IB_Furnitura_grupa.Locate('ID',F_Furnitura.id_furnitura_grupa,[]);
  DM_Mebeli.IB_Furnitura.Locate('ID',id_furnitura,[]);
end;//proc

procedure TF_Reports.B_dvijenie_materialovClick(Sender: TObject);
var
      DateOstatok: TDateTime;
  furnitura_kolvo: double;
begin
  id_sklad:=DM_Mebeli.IB_Sklad.FieldByName('ID').AsInteger;
  id_listy:=DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsInteger;
  id_detali:=DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsInteger;
  id_pilomat_grupa:=DM_Mebeli.IB_Pilomat_grupa.FieldByName('ID').AsInteger;
  id_furnitura_grupa:=DM_Mebeli.IB_furnitura_grupa.FieldByName('ID').AsInteger;
  id_furnitura:=DM_Mebeli.IB_furnitura.FieldByName('ID').AsInteger;
  F_Print_Forms.QRDB_Prihod.Mask:='0';
  F_Print_Forms.QRDB_Rashod.Mask:='0';

//**************** ЛИСТЫ *************************
  IF RB_Listy.Checked Then //если отчет по ЛИСТАМ
    begin
      F_Main.IBQuery1.Close;
      F_Main.IBQuery1.SQL.Clear;
      F_Main.IBQuery1.SQL.Add('select * from OSTATOK_LIST(:id_pilomat_listy,:id_sklad,:period_end)');
      F_Main.IBQuery1.ParamByName('id_pilomat_listy').Value:=DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsInteger;
      F_Main.IBQuery1.ParamByName('id_sklad').Value:=DM_Mebeli.IB_Sklad.FieldByName('ID').AsInteger;
      F_Main.IBQuery1.ParamByName('period_end').Value:=IncDay(Dvij_mater_date_Begin.DateTime,-1);
      F_Main.IBQuery1.Open;
      F_Print_Forms.L_Dvij_mater_ostatok_begin.Caption:='Остаток на начало: '+IntToStr(F_Main.IBQuery1.FieldByName('list_ostatok').AsInteger);
      F_Main.IBQuery1.Close;
      F_Main.IBQuery1.ParamByName('period_end').Value:=Dvij_mater_date_End.DateTime;
      F_Main.IBQuery1.Open;
      F_Print_Forms.L_Dvij_mater_ostatok_end.Caption:='Остаток на конец: '+IntToStr(F_Main.IBQuery1.FieldByName('list_ostatok').AsInteger);
      F_Print_forms.L_Dvij_mater_material.Caption:=F_Reports.Dvij_mater_material +' / '+ DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsString;
      Dvij_mater_material:=DM_Mebeli.IB_Pilomat_listy.FieldByName('name').AsString+' Код:'+DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsString;

      F_Print_Forms.IBQuery1.SQL.Clear;
      F_Print_Forms.IBQuery1.SQL.Add('select * from DVIJENIE_LISTY(:id_sklad,:id_listy,:date_begin,:date_end)');
      F_Print_Forms.IBQuery1.ParamByName('id_sklad').Value:=DM_Mebeli.IB_Sklad.FieldValues['ID'];
      F_Print_Forms.IBQuery1.ParamByName('id_listy').Value:=DM_Mebeli.IB_Pilomat_listy.FieldValues['ID'];
      F_Print_Forms.IBQuery1.ParamByName('date_begin').Value:=Dvij_mater_date_Begin.DateTime;
      F_Print_Forms.IBQuery1.ParamByName('date_end').Value:=Dvij_mater_date_End.DateTime;
      F_Print_Forms.IBQuery1.Open;
    end;//IF RB_Listy.Checked

//**************** ДЕТАЛИ *************************

  IF RB_Detali.Checked Then //если отчет по ДЕТАЛЯМ
    begin
      F_Print_forms.L_Dvij_mater_material.Caption:=F_Reports.Dvij_mater_material +' / '+ DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsString;
      Dvij_mater_material:=DM_Mebeli.IB_Pilomat_detali.FieldByName('name').AsString+' Код:'+DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsString;

      F_Print_Forms.IBQuery1.Close;
      F_Print_Forms.IBQuery1.SQL.Clear;
      F_Print_Forms.IBQuery1.SQL.Add('select DETALI_OSTATOK from DETALI_OSTATOK(:id_pilomat_detali,:id_sklad,:date_ostatok)');
      F_Print_Forms.IBQuery1.ParamByName('date_ostatok').Value:=IncDay(Dvij_mater_date_Begin.DateTime,-1);
      F_Print_Forms.IBQuery1.ParamByName('id_pilomat_detali').Value:=id_detali;
      F_Print_Forms.IBQuery1.ParamByName('id_sklad').Value:=id_sklad;
      F_Print_Forms.IBQuery1.Open;
      F_Print_Forms.L_Dvij_mater_ostatok_begin.Caption:='Остаток на начало: '+F_Print_Forms.IBQuery1.FieldByName('DETALI_OSTATOK').AsString;
      F_Print_Forms.IBQuery1.Close;
      F_Print_Forms.IBQuery1.ParamByName('date_ostatok').Value:=Dvij_mater_date_End.DateTime;
      F_Print_Forms.IBQuery1.Open;
      F_Print_Forms.L_Dvij_mater_ostatok_end.Caption:='Остаток на конец: '+F_Print_Forms.IBQuery1.FieldByName('DETALI_OSTATOK').AsString;

      F_Print_Forms.IBQuery1.SQL.Clear;
      F_Print_Forms.IBQuery1.SQL.Add('select * from DVIJENIE_DETALI (:id_sklad,:id_detali,:date_begin,:date_end)');
      F_Print_Forms.IBQuery1.ParamByName('id_sklad').Value:=DM_Mebeli.IB_Sklad.FieldValues['ID'];
      F_Print_Forms.IBQuery1.ParamByName('id_detali').Value:=DM_Mebeli.IB_Pilomat_detali.FieldValues['ID'];
      F_Print_Forms.IBQuery1.ParamByName('date_begin').Value:=Dvij_mater_date_Begin.DateTime;
      F_Print_Forms.IBQuery1.ParamByName('date_end').Value:=Dvij_mater_date_End.DateTime;
      F_Print_Forms.IBQuery1.Open;
    end;//IF RB_Detali.Checked

//**************** КОМПЛЕКТУЮЩИЕ *************************

  IF RB_Furnitura.Checked Then //если отчет по КОМПЛЕКУЮЩИМ
    begin
      Dvij_mater_material:=DM_Mebeli.IB_Furnitura.FieldByName('name').AsString+' Код:'+DM_Mebeli.IB_Furnitura.FieldByName('ID').AsString;

      DateOstatok:=IncDay(Dvij_mater_date_Begin.DateTime,-1);
      F_Main.IBQuery1.Close;
      F_Main.IBQuery1.SQL.Clear;
      F_Main.IBQuery1.SQL.Add('select FURNITURA_OSTATOK from FURNITURA_OSTATOK(:id_furnitura, :id_sklad, :period_end)');
      F_Main.IBQuery1.ParamByName('id_furnitura').Value:=DM_Mebeli.IB_Furnitura.FieldByName('ID').AsInteger;
      F_Main.IBQuery1.ParamByName('id_sklad').Value:=DM_Mebeli.IB_Sklad.FieldByName('ID').AsInteger;
      F_Main.IBQuery1.ParamByName('period_end').Value:=DateOstatok;
      F_Main.IBQuery1.Open;
      furnitura_kolvo:=F_Main.IBQuery1.fieldByName('FURNITURA_OSTATOK').AsFloat;

      F_Print_Forms.L_Dvij_mater_ostatok_begin.Caption:='Остаток на начало: '+FloatToStr(furnitura_kolvo);
      DateOstatok:=Dvij_mater_date_End.DateTime;
      F_Main.IBQuery1.Close;
      F_Main.IBQuery1.ParamByName('period_end').Value:=DateOstatok;
      F_Main.IBQuery1.Open;
      furnitura_kolvo:=F_Main.IBQuery1.fieldByName('FURNITURA_OSTATOK').AsFloat;
      F_Print_Forms.L_Dvij_mater_ostatok_end.Caption:='Остаток на конец: '+FloatToStr(furnitura_kolvo);

      F_Print_Forms.IBQuery1.SQL.Clear;
      F_Print_Forms.IBQuery1.SQL.Add('select DOC_NAME, KOLVO_PRIHOD, KOLVO_RASHOD, DATE_DOC, GOTOVPROD_NAME, 0 prihod_area, 0 rashod_area from DVIJENIE_FURNITURA (:id_sklad,:id_furnitura,:date_begin,:date_end)');
      F_Print_Forms.IBQuery1.ParamByName('id_sklad').Value:=id_sklad;
      F_Print_Forms.IBQuery1.ParamByName('id_furnitura').Value:=id_furnitura;
      F_Print_Forms.IBQuery1.ParamByName('date_begin').Value:=Dvij_mater_date_Begin.DateTime;
      F_Print_Forms.IBQuery1.ParamByName('date_end').Value:=Dvij_mater_date_End.DateTime;
      F_Print_Forms.IBQuery1.Open;
      F_Print_Forms.QRDB_Prihod.Mask:='0.000';
      F_Print_Forms.QRDB_Rashod.Mask:='0.000';
    end;//IF RB_Furnitura.Checked

  DM_Mebeli.IB_Sklad.Open;
  DM_Mebeli.IB_Pilomat_grupa.Open;
  DM_Mebeli.IB_Pilomat_listy.Open;
  DM_Mebeli.IB_Pilomat_detali.Open;
  DM_Mebeli.IB_Furnitura_grupa.Open;
  DM_Mebeli.IB_Furnitura.Open;

  DM_Mebeli.IB_Sklad.Locate('ID',id_sklad,[]);
  DM_Mebeli.IB_Pilomat_listy.Locate('ID',id_listy,[]);
  DM_Mebeli.IB_Pilomat_detali.Locate('ID',id_detali,[]);
  DM_Mebeli.IB_Pilomat_grupa.Locate('ID',id_pilomat_grupa,[]);
  DM_Mebeli.IB_Furnitura_grupa.Locate('ID',id_furnitura_grupa,[]);
  DM_Mebeli.IB_Furnitura.Locate('ID',id_furnitura,[]);


  IF F_Print_Forms.IBQuery1.fieldbyname('doc_name').IsNull Then
    begin
      ShowMessage('Нет движений');
      F_Print_Forms.IBQuery1.Close;
      exit;
    end;

    IF CB_Excel.Checked Then //если отмечено экспортировать в Excel
  //    F_Main.Exlreport1.Show('')
    ELSE
      F_Print_Forms.QR_Dvij_mater.Preview;

  DM_Mebeli.IB_Sklad.Open;
  DM_Mebeli.IB_Pilomat_grupa.Open;
  DM_Mebeli.IB_Pilomat_listy.Open;
  DM_Mebeli.IB_Pilomat_detali.Open;
  DM_Mebeli.IB_Furnitura_grupa.Open;
  DM_Mebeli.IB_Furnitura.Open;

  DM_Mebeli.IB_Sklad.Locate('ID',id_sklad,[]);
  DM_Mebeli.IB_Pilomat_grupa.Locate('ID',id_pilomat_grupa,[]);
  DM_Mebeli.IB_Pilomat_listy.Locate('ID',id_listy,[]);
  DM_Mebeli.IB_Pilomat_detali.Locate('ID',id_detali,[]);
  DM_Mebeli.IB_Furnitura_grupa.Locate('ID',id_furnitura_grupa,[]);
  DM_Mebeli.IB_Furnitura.Locate('ID',id_furnitura,[]);
end;//proc

procedure TF_Reports.RB_ListyClick(Sender: TObject);
begin
  RB_Listy.Checked:=true;
  RB_Detali.Checked:=false;
  RB_Furnitura.Checked:=false;
  //оставляем только одну таблицу для вывода отчета: ЛИСТЫ или ДЕТАЛИ или КОМПЛЕКТУЮЩИЕ
  //чтобы пользователь не запутался
  DBE_Listy.Visible:=true;
  DBE_Detali.Visible:=false;
  DBE_Furnitura.Visible:=false;
end;//proc

procedure TF_Reports.RB_DetaliClick(Sender: TObject);
begin
  RB_Listy.Checked:=false;
  RB_Detali.Checked:=true;
  RB_Furnitura.Checked:=false;
  //оставляем только одну таблицу для вывода отчета: ЛИСТЫ или ДЕТАЛИ или КОМПЛЕКТУЮЩИЕ
  //чтобы пользователь не запутался
  DBE_Listy.Visible:=false;
  DBE_Detali.Visible:=true;
  DBE_Furnitura.Visible:=false;
end;//proc

procedure TF_Reports.RB_FurnituraClick(Sender: TObject);
begin
  RB_Listy.Checked:=false;
  RB_Detali.Checked:=false;
  RB_Furnitura.Checked:=true;
  //оставляем только одну таблицу для вывода отчета: ЛИСТЫ или ДЕТАЛИ или КОМПЛЕКТУЮЩИЕ
  //чтобы пользователь не запутался
  DBE_Listy.Visible:=false;
  DBE_Detali.Visible:=false;
  DBE_Furnitura.Visible:=true;
end;//proc

procedure TF_Reports.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Key=VK_ESCAPE) and (B_Ostatki_sklad.Tag=1) Then
    IF MessageDlg('Прервать расчет отчета?',mtConfirmation,[mbYes,mbNo],0)=mrYes Then
      report_break:=true;
end;//proc

procedure TF_Reports.EXLR_Ostatki_skladGetFieldValue(Sender: TObject;
  const Field: String; var Value: OleVariant);
begin
  IF UpperCase(Field)='DATE_BEGIN' Then
    Value:=DateToStr(Dvij_mater_date_Begin.DateTime);
  IF UpperCase(Field)='DATE_END' Then
    Value:=DateToStr(Dvij_mater_date_End.DateTime);
  IF UpperCase(Field)='MATERIAL_NAME' Then
    Value:=Dvij_mater_material;
  IF UpperCase(Field)='DOC_NAME_NOMER' Then
    Value:=F_Print_Forms.IBQuery1.FieldValues['DOC_NAME']+ ' '+IntToStr(F_Print_Forms.IBQuery1.FieldValues['DOC_NOMER']);
  IF UpperCase(Field)='SKLAD_NAME' Then
    Value:=DM_Mebeli.IB_Sklad.FieldValues['NAME'];
  IF UpperCase(Field)='DATE_OSTATOK_SKLAD' Then
    Value:=DateOstatok;
end;//proc

procedure TF_Reports.B_Show_Gotprod_ostatok_vidrabotClick(Sender: TObject);
var
       kol_vo: integer;
begin
{  IF Role_name='USERS' Then
    exit;
}
  id_vidrabot:=DM_Mebeli.IB_Vidy_rabot.FieldValues['ID'];
  PB_Ostatki_vidrab.Position:=0;
  DM_Mebeli.IB_Gotov_prod_0.Open;

  //удаляем старые остатки
  F_Print_Forms.IBQuery1.Close;
  F_Print_Forms.IBQuery1.SQL.Clear;
  F_Print_Forms.IBQuery1.SQL.Add('delete from OSTATOK_GOTOVPROD_VIDRABOT');
  F_Print_Forms.IBQuery1.ExecSQL;
  //готовим запрос для вставки новых оcтатков
  F_Print_Forms.IBQuery1.SQL.Clear;
  F_Print_Forms.IBQuery1.SQL.Add('insert into OSTATOK_GOTOVPROD_VIDRABOT (gotovprod_name, KOL_VO, vidrabot_id, vidrabot_name)');
  F_Print_Forms.IBQuery1.SQL.Add('values (:gotovprod_name, :KOL_VO, :vidrabot_id, :vidrabot_name)');

  While not DM_Mebeli.IB_Pilomat_detali.Eof Do
    begin
      Application.ProcessMessages;
      kol_vo:=F_Main.Kolvo_detali_na_etape(DM_Mebeli.IB_Vidy_rabot.FieldValues['ID'], DM_Mebeli.IB_Pilomat_detali.FieldValues['ID'], DateToStr(Date_Ostatok_vidrab.Date), false);
      PB_Ostatki_vidrab.StepIt;
      IF kol_vo>0 Then
        begin
          F_Print_Forms.IBQuery1.ParamByName('VID_RABOT').Value:=DM_Mebeli.IB_Vidy_rabot.FieldValues['NAME'];
          F_Print_Forms.IBQuery1.ParamByName('DETALI_NAME').Value:=DM_Mebeli.IB_Pilomat_detali.FieldValues['NAME'];
          F_Print_Forms.IBQuery1.ParamByName('KOL_VO').Value:=kol_vo;
          F_Print_Forms.IBQuery1.ExecSQL;
        end;//IF kol_vo<>0
      DM_Mebeli.IB_Pilomat_detali.Next;
    end;//While not DM_Mebeli.IB_Pilomat_detali.Eof
end;//proc

procedure TF_Reports.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_Mebeli.IB_Pilomat_listy.Close;
  DM_Mebeli.IB_Furnitura.Close;
  DM_Mebeli.IB_Pilomat_listy.SelectSQL[1]:=Old_listy_SelectSQL;
  DM_Mebeli.IB_Furnitura.SelectSQL[1]:=Old_furnitura_SelectSQL;
  F_print_forms.IBQuery1.Close;
  operation:='';
  IB_Sverka.Free;
  DS_Sverka.Free;
  if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.Rollback;
  F_Reports_active:=false;
  DM_Mebeli.IB_Zakaz_0.Open;
  DM_Mebeli.IB_Zakaz_1.Open;
end;//proc

procedure TF_Reports.Button4Click(Sender: TObject);
begin
  IF RG_AVR_Report_Type.ItemIndex=0 Then
    begin
      IF CB_AVR_Podrobno.Checked Then
        begin
          F_print_forms.IBQuery1.Close;
          F_print_forms.IBQuery1.SQL.Clear;
          F_print_forms.IBQuery1.SQL.Add('select * from get_kolvo_vidrabot_category_gpr(:period_start,:period_end,:idsotrudnik,:idvidrabot,:idcategory)');
          F_print_forms.IBQuery1.SQL.Add('order by sotrudnik_name, category_name, vidrabot_name, gotovprod_name');
          F_print_forms.IBQuery1.ParamByName('idsotrudnik').Value:=null;
          F_print_forms.IBQuery1.ParamByName('idvidrabot').Value:=null;
          F_print_forms.IBQuery1.ParamByName('idcategory').Value:=null;
          IF id_sotrudnik>-1 Then
            F_print_forms.IBQuery1.ParamByName('idsotrudnik').Value:=id_sotrudnik;
          IF id_vidrabot>-1 Then
            F_print_forms.IBQuery1.ParamByName('idvidrabot').Value:=id_vidrabot;
          IF id_category>-1 Then
            F_print_forms.IBQuery1.ParamByName('idcategory').Value:=id_category;
          F_print_forms.IBQuery1.ParamByName('period_start').Value:=Period_Start.DateTime;
          F_print_forms.IBQuery1.ParamByName('period_end').Value:=Period_End.DateTime;
          F_print_forms.IBQuery1.Open;
          F_PRINT_FORMS.QRL_AVR_Sotrudnik_period.Caption:='период с '+DateToStr(Period_Start.Date)+' по '+DateToStr(Period_End.Date);
          F_Print_Forms.QRDB_AVR_Vidrabot_grupa.DataField:='category_name';
          F_Print_Forms.QRDB_AVR_Category_name.DataField:='gotovprod_name';
          F_Print_Forms.QRGR_AVR_Vidrabot_grupa.Expression:='IBQuery1.category_name';
          F_PRINT_FORMS.QR_AVR_Sotrudnik.Preview;
        end
      ELSE
        begin
          F_print_forms.IBQuery1.Close;
          F_print_forms.IBQuery1.SQL.Clear;
          F_print_forms.IBQuery1.SQL.Add('select * from GET_KOLVO_VIDRABOT_category(:period_start,:period_end,:idsotrudnik,:idvidrabot,:idcategory)');
          F_print_forms.IBQuery1.SQL.Add('order by sotrudnik_name, vidrabot_name, category_name');
          F_print_forms.IBQuery1.ParamByName('idsotrudnik').Value:=null;
          F_print_forms.IBQuery1.ParamByName('idvidrabot').Value:=null;
          F_print_forms.IBQuery1.ParamByName('idcategory').Value:=null;
          IF id_sotrudnik>-1 Then
            F_print_forms.IBQuery1.ParamByName('idsotrudnik').Value:=id_sotrudnik;
          IF id_vidrabot>-1 Then
            F_print_forms.IBQuery1.ParamByName('idvidrabot').Value:=id_vidrabot;
          IF id_category>-1 Then
            F_print_forms.IBQuery1.ParamByName('idcategory').Value:=id_category;
          F_print_forms.IBQuery1.ParamByName('period_start').Value:=Period_Start.DateTime;
          F_print_forms.IBQuery1.ParamByName('period_end').Value:=Period_End.DateTime;
          F_print_forms.IBQuery1.Open;
          F_PRINT_FORMS.QRL_AVR_Sotrudnik_period.Caption:='период с '+DateToStr(Period_Start.Date)+' по '+DateToStr(Period_End.Date);
          F_Print_Forms.QRDB_AVR_Vidrabot_grupa.DataField:='VIDRABOT_NAME';
          F_Print_Forms.QRDB_AVR_Category_name.DataField:='CATEGORY_NAME';
          F_Print_Forms.QRGR_AVR_Vidrabot_grupa.Expression:='IBQuery1.VIDRABOT_NAME';
          F_PRINT_FORMS.QR_AVR_Sotrudnik.Preview;
        end;//ELSE
    end;//IF

  IF RG_AVR_Report_Type.ItemIndex=3 Then
    begin
      F_print_forms.IBQuery1.Close;
      F_print_forms.IBQuery1.SQL.Clear;
      F_print_forms.IBQuery1.SQL.Add('select * from GET_KOLVO_RASPIL(:period_start,:period_end,:idsotrudnik,:idlisty)');
      F_print_forms.IBQuery1.ParamByName('idsotrudnik').Value:=null;
      F_print_forms.IBQuery1.ParamByName('idlisty').Value:=null;
      IF id_sotrudnik>-1 Then
        F_print_forms.IBQuery1.ParamByName('idsotrudnik').Value:=id_sotrudnik;
      F_print_forms.IBQuery1.ParamByName('period_start').Value:=Period_Start.DateTime;
      F_print_forms.IBQuery1.ParamByName('period_end').Value:=Period_End.DateTime;
      F_print_forms.IBQuery1.Open;
      F_PRINT_FORMS.QRL_Akt_raspila_period.Caption:='период с '+DateToStr(Period_Start.Date)+' по '+DateToStr(Period_End.Date);
      F_PRINT_FORMS.QR_Akt_raspila.Preview;
    end;

  //Ход работы над заказом
  IF RG_AVR_Report_Type.ItemIndex=4 Then
    begin
      F_print_forms.IBQuery1.Close;
      F_print_forms.IBQuery1.SQL.Clear;
      F_print_forms.IBQuery1.SQL.Add('select * from GET_ZAKAZ_RABOTA_KOLVO(:id_zakaz,:period_end) where ((zakaz_kolvo-prodaja_kolvo)<>0) and (zakaz>150) order by zakaz, gotovprod_name');
      F_print_forms.IBQuery1.ParamByName('id_zakaz').Value:=null;
      IF id_zakaz>-1 Then
        F_print_forms.IBQuery1.ParamByName('id_zakaz').Value:=id_zakaz;
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
    end;//if

  IF RG_AVR_Report_Type.ItemIndex=5 Then
    begin
      F_print_forms_2.IBQuery1.Close;
      F_print_forms_2.IBQuery1.SQL.Clear;
      F_print_forms_2.IBQuery1.SQL.Add('select * from GET_ZAKAZ_OSTALOSI_SDELATI (:period_end)');
      IF (id_zakaz=-1) and (id_gotovprod=-1) Then
        F_print_forms_2.IBQuery1.SQL.Add('where (prodaja_ostatok>0) and (zakaz>150) order by zakaz, gotovprod_name');
      IF (id_zakaz=-1) and (id_gotovprod>0) Then
        F_print_forms_2.IBQuery1.SQL.Add('where (prodaja_ostatok>0) and (id_gotov_prod='+IntToStr(id_gotovprod)+') order by zakaz, gotovprod_name');
      IF (id_zakaz>0) and (id_gotovprod=-1) Then
        F_print_forms_2.IBQuery1.SQL.Add('where (prodaja_ostatok>0) and (zakaz='+IntToStr(id_zakaz)+') order by zakaz, gotovprod_name');
      IF (id_zakaz>0) and (id_gotovprod>0) Then
        F_print_forms_2.IBQuery1.SQL.Add('where (prodaja_ostatok>0) and (zakaz='+IntToStr(id_zakaz)+') and (id_gotovprod='+IntToStr(id_gotovprod)+') order by zakaz, gotovprod_name');
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
    end;//if
end;//proc

procedure TF_Reports.B_AVR_Sotrudnik_clearClick(Sender: TObject);
begin
  E_AVR_Sotrudnik.Text:='';
  id_sotrudnik:=-1;
end;//proc

procedure TF_Reports.B_AVR_gotovprod_clearClick(Sender: TObject);
begin
  E_AVR_gotovprod.Text:='';
  id_gotovprod:=-1;
end;//proc

procedure TF_Reports.B_AVR_Sotrudnik_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Sotrudniki.ShowModal;
end;//proc

procedure TF_Reports.B_AVR_Category_clearClick(Sender: TObject);
begin
  E_AVR_category.Text:='';
  id_category:=-1;
end;

procedure TF_Reports.B_AVR_Vidrabot_clearClick(Sender: TObject);
begin
  E_AVR_Vidrabot.Text:='';
  id_vidrabot:=-1;
end;

procedure TF_Reports.B_AVR_Category_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Gotov_prod_categories.ShowModal;
end;

procedure TF_Reports.B_AVR_gotovprod_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Gotov_prod.ShowModal;
end;

procedure TF_Reports.B_AVR_Vidrabot_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Vidy_rabot.ShowModal;
end;

procedure TF_Reports.SpeedButton2Click(Sender: TObject);
begin
  E_AVR_Zakaz.Text:='';
  id_zakaz:=-1;
end;

procedure TF_Reports.B_AVR_zakaz_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Zakaz_select.ShowModal;
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  E_AVR_Zakaz.Text:=IntToStr(id_zakaz);
end;//proc

procedure TF_Reports.B_Select_ostatki_skladClick(Sender: TObject);
begin
{id_listy
id_detali
id_furnitura
id_pilomat_grupa
id_furnitura_grupa}
end;//proc

procedure TF_Reports.B_OSTSKL_Listy_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Pilomat.ShowModal;
  id_detali:=-1;
  E_OstSkl_Detali.Text:='';
  RG_OstSkl.ItemIndex:=0;
end;//proc

procedure TF_Reports.Ostat_skladShow(Sender: TObject);
begin
  id_listy:=-1;
  id_detali:=-1;
  id_furnitura:=-1;
  id_pilomat_grupa:=-1;
  id_furnitura_grupa:=-1;
  CB_OSTSKL_Listy_grupa.Checked:=false;
  CB_OSTSKL_Detali_grupa.Checked:=false;
  CB_OSTSKL_Furnitura_grupa.Checked:=false;
  E_OSTSKL_Listy.Text:='';
  E_OSTSKL_Detali.Text:='';
  E_OSTSKL_Furnitura.Text:='';
end;//proc

procedure TF_Reports.B_OstSkl_Detali_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Pilomat.ShowModal;
  id_listy:=-1;
  E_OstSkl_Listy.Text:='';
  RG_OstSkl.ItemIndex:=1;
end;//proc

procedure TF_Reports.B_OstSkl_Furnitura_selectClick(Sender: TObject);
begin
  RG_OstSkl.ItemIndex:=2;
  operation:='SELECT';
  F_Furnitura.ShowModal;
end;

procedure TF_Reports.B_OSTSKL_Listy_clearClick(Sender: TObject);
begin
  E_OstSkl_listy.Text:='';
  id_listy:=-1;
  id_pilomat_grupa:=-1;
end;//proc

procedure TF_Reports.B_OstSkl_Detali_clearClick(Sender: TObject);
begin
  E_OstSkl_detali.Text:='';
  id_detali:=-1;
  id_pilomat_grupa:=-1;
end;//proc

procedure TF_Reports.B_OstSkl_Furnitura_clearClick(Sender: TObject);
begin
  E_OstSkl_furnitura.Text:='';
  id_furnitura:=-1;
end;//proc

procedure TF_Reports.B_load_from_1cClick(Sender: TObject);
var
  sverka_txt: textfile;
  s: string;
  ts: TStringList;
  old_DecimalSeparator: char;
begin
  if OpenDialog1.Execute=false then exit;
  old_DecimalSeparator:=DecimalSeparator;
  DecimalSeparator:='.';
  if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.Rollback;
  IB_Sverka.Close;
  IB_Sverka.SelectSQL.Clear;
  IB_Sverka.SelectSQL.Add('select * from sverka');
  IB_Sverka.Open;
  DBG_Sverka.DataSource:=DS_Sverka;
  ts:=TStringList.Create;
  ts.Delimiter:=';';
  Sverka_fileName.text:=OpenDialog1.FileName;
  AssignFile(sverka_txt,Sverka_fileName.text);
  Reset(sverka_txt);
  IB_Sverka.Open;
  Readln(sverka_txt,s);
  L_Export1C_date.Caption:=s;
  Readln(sverka_txt,s);
  While not Eof(Sverka_txt) do
    begin
      Readln(sverka_txt,s);
      ts.DelimitedText:=s;
      if ts.count<>5 then continue;
      IB_Sverka.Insert;
      IB_Sverka.FieldByName('id_tovar').Value:=ts[1];
      IB_Sverka.FieldByName('id_tovar_1c').Value:=ts[0];
      IB_Sverka.FieldByName('IS_PILOMAT').Value:=ts[4];
      IB_Sverka.FieldByName('kolvo_1c').Value:=ts[3];
      IB_Sverka.FieldByName('sklad').Value:=ts[2];
      IB_Sverka.Post;
    end;//while
  CloseFile(sverka_txt);
  DecimalSeparator:=old_DecimalSeparator;
  Ts.free;
end;

procedure TF_Reports.B_Show_sverkaClick(Sender: TObject);
var ib_ostatki: TIBDataSet;
    maxid: integer;
    old_DecimalSeparator: char;
begin
  SaveDialog1.FileName:='сверка_1с_'+IntToStr(YearOf(DT_Sverka_date.Date))+'_'+IntToStr(MonthOf(DT_Sverka_date.Date))+IntToStr(DayOf(DT_Sverka_date.Date));
  if SaveDialog1.Execute=false then exit;
  old_DecimalSeparator:=DecimalSeparator;
  DecimalSeparator:='.';
  IB_Ostatki:=TIBDataSet.Create(nil);
  IB_Ostatki.Transaction:=DM_Mebeli.IBTransaction1;
  IB_Ostatki.Database:=DM_Mebeli.DB_Mebeli;
  //***************************
  if RG_Sverka.ItemIndex=0 then //сборочный склад
    begin
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('delete from sverka where sklad<>3');
      IB_Ostatki.ExecSQL;
      //пиломатериалы
      IB_Sverka.Close;
      IB_Sverka.SelectSQL.Clear;
      IB_Sverka.SelectSQL.Add('select * from sverka where is_pilomat=1');
      IB_Sverka.Open;
      IB_Sverka.First;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('select * from GET_OSTATOK_PILOMATGRUPA_SKLAD(:period_end) where id_sklad=3');
      IB_Ostatki.ParamByName('period_end').Value:=DateToStr(DT_Sverka_date.Date);
      IB_Ostatki.Open;
      while not IB_Sverka.Eof do
        begin
          if IB_Ostatki.Locate('ID_GRUPA',IB_Sverka.FieldByName('id_tovar').AsInteger,[]) then
            begin
              IB_Sverka.Edit;
              IB_Sverka.FieldByName('KOLVO_INTERN').Value:=IB_Ostatki.FieldByName('kol_vo').AsFloat;
              IB_Sverka.FieldByName('NAME_TOVAR').Value:=IB_Ostatki.FieldByName('NAME_TOVAR').AsString;
              IB_Sverka.Post;
            end;
          IB_Sverka.Next;
        end;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('insert into sverka');
      IB_Ostatki.SelectSQL.Add('(id_tovar, name_tovar, kolvo_intern, kolvo_1c, sklad, is_pilomat)');
      IB_Ostatki.SelectSQL.Add('select id_grupa, name_tovar, kol_vo,0, id_sklad,1 from GET_OSTATOK_PILOMATGRUPA_SKLAD(:period_end) where id_sklad=3');
      IB_Ostatki.SelectSQL.Add('and (not exists (select id from sverka where id_tovar=id_grupa))');
      IB_Ostatki.ParamByname('period_end').Value:=DateToStr(DT_Sverka_date.Date);
      IB_Ostatki.ExecSQL;

      //комплектующие
      IB_Sverka.Close;
      IB_Sverka.SelectSQL.Clear;
      IB_Sverka.SelectSQL.Add('select * from sverka where is_pilomat=0');
      IB_Sverka.Open;
      IB_Sverka.First;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('select fg.name||'+Chr(39)+' / '+Chr(39)+'||f.name tovar_name,');
      IB_Ostatki.SelectSQL.Add('(select coalesce(FURNITURA_OSTATOK,0) as kol_vo');
      IB_Ostatki.SelectSQL.Add('from FURNITURA_OSTATOK(f.id,3,:period_end))');
      IB_Ostatki.SelectSQL.Add('from furnitura f, furnitura_grupa fg');
      IB_Ostatki.SelectSQL.Add('where (f.id=:id_furnitura) and (fg.id=f.id_parent)');
      while not IB_Sverka.Eof do
        begin
          IB_Ostatki.Close;
          IB_Ostatki.ParamByName('id_furnitura').Value:=IB_Sverka.FieldByName('id_tovar').AsInteger;
          IB_Ostatki.ParamByName('period_end').Value:=DateToStr(DT_Sverka_date.Date);
          IB_Ostatki.Open;
          if not IB_Ostatki.FieldByName('kol_vo').IsNull then
            begin
              IB_Sverka.Edit;
              IB_Sverka.FieldByName('KOLVO_INTERN').Value:=IB_Ostatki.FieldByName('kol_vo').AsFloat;
              IB_Sverka.FieldByName('NAME_TOVAR').Value:=IB_Ostatki.FieldByName('tovar_name').AsString;
              IB_Sverka.Post;
            end;
          IB_Sverka.Next;
        end;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('insert into sverka');
      IB_Ostatki.SelectSQL.Add('(id_tovar, name_tovar, kolvo_intern, kolvo_1c, sklad, is_pilomat)');
      IB_Ostatki.SelectSQL.Add('select id_furnitura, tovar_name, kol_vo, 0,3,0 from');
      IB_Ostatki.SelectSQL.Add('(select f.id id_furnitura, fg.name||'+Chr(39)+' / '+Chr(39)+'||f.name tovar_name,');
      IB_Ostatki.SelectSQL.Add('(select coalesce(FURNITURA_OSTATOK,0) as kol_vo');
      IB_Ostatki.SelectSQL.Add('from FURNITURA_OSTATOK(f.id,3,:period_end))');
      IB_Ostatki.SelectSQL.Add('from furnitura f, furnitura_grupa fg');
      IB_Ostatki.SelectSQL.Add('where (not exists (select id from sverka where id_tovar=f.id)) and (fg.id=f.id_parent) )');
      IB_Ostatki.SelectSQL.Add('where kol_vo<>0');
      IB_Ostatki.ExecSQL;
    end;//if RG_Sverka.ItemIndex=0

  //***************************
  if RG_Sverka.ItemIndex=1 then //склад цех
    begin
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('delete from sverka where (sklad<>2)');
      IB_Ostatki.ExecSQL;
      //пиломатериалы
      IB_Sverka.Close;
      IB_Sverka.SelectSQL.Clear;
      IB_Sverka.SelectSQL.Add('select * from sverka where is_pilomat=1');
      IB_Sverka.Open;
      IB_Sverka.First;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('select * from GET_OSTATOK_PILOMATGRUPA_SKLAD(:period_end) where (id_sklad=1) or (id_sklad=4)');
      IB_Ostatki.ParamByName('period_end').Value:=DateToStr(DT_Sverka_date.Date);
      IB_Ostatki.Open;
      while not IB_Sverka.Eof do
        begin
          if IB_Ostatki.Locate('ID_GRUPA',IB_Sverka.FieldByName('id_tovar').AsInteger,[]) then
            begin
              IB_Sverka.Edit;
              IB_Sverka.FieldByName('KOLVO_INTERN').Value:=IB_Ostatki.FieldByName('kol_vo').AsFloat;
              IB_Sverka.FieldByName('NAME_TOVAR').Value:=IB_Ostatki.FieldByName('NAME_TOVAR').AsString;
              IB_Sverka.Post;
            end;
          IB_Sverka.Next;
        end;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('insert into sverka');
      IB_Ostatki.SelectSQL.Add('(id_tovar, name_tovar, kolvo_intern, kolvo_1c, sklad, is_pilomat)');
      IB_Ostatki.SelectSQL.Add('select id_grupa, name_tovar, kol_vo,0, id_sklad,1 from GET_OSTATOK_PILOMATGRUPA_SKLAD(:period_end) where (id_sklad=1) or (id_sklad=4)');
      IB_Ostatki.SelectSQL.Add('and (not exists (select id from sverka where id_tovar=id_grupa))');
      IB_Ostatki.ParamByname('period_end').Value:=DateToStr(DT_Sverka_date.Date);
      IB_Ostatki.ExecSQL;

      //комплектующие
      IB_Sverka.Close;
      IB_Sverka.SelectSQL.Clear;
      IB_Sverka.SelectSQL.Add('select * from sverka where is_pilomat=0');
      IB_Sverka.Open;
      IB_Sverka.First;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('select fg.name||'+Chr(39)+' / '+Chr(39)+'||f.name tovar_name,');
      IB_Ostatki.SelectSQL.Add('(select coalesce(FURNITURA_OSTATOK,0) as kol_vo');
      IB_Ostatki.SelectSQL.Add('from FURNITURA_OSTATOK(f.id,4,:period_end))');
      IB_Ostatki.SelectSQL.Add('from furnitura f, furnitura_grupa fg');
      IB_Ostatki.SelectSQL.Add('where (f.id=:id_furnitura) and (fg.id=f.id_parent)');
      while not IB_Sverka.Eof do
        begin
          IB_Ostatki.Close;
          IB_Ostatki.ParamByName('id_furnitura').Value:=IB_Sverka.FieldByName('id_tovar').AsInteger;
          IB_Ostatki.ParamByName('period_end').Value:=DateToStr(DT_Sverka_date.Date);
          IB_Ostatki.Open;
          if not IB_Ostatki.FieldByName('kol_vo').IsNull then
            begin
              IB_Sverka.Edit;
              IB_Sverka.FieldByName('KOLVO_INTERN').Value:=IB_Ostatki.FieldByName('kol_vo').AsFloat;
              IB_Sverka.FieldByName('NAME_TOVAR').Value:=IB_Ostatki.FieldByName('tovar_name').AsString;
              IB_Sverka.Post;
            end;
          IB_Sverka.Next;
        end;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('insert into sverka');
      IB_Ostatki.SelectSQL.Add('(id_tovar, name_tovar, kolvo_intern, kolvo_1c, sklad, is_pilomat)');
      IB_Ostatki.SelectSQL.Add('select id_furnitura, tovar_name, kol_vo, 0,2,0 from');
      IB_Ostatki.SelectSQL.Add('(select f.id id_furnitura, fg.name||'+Chr(39)+' / '+Chr(39)+'||f.name tovar_name,');
      IB_Ostatki.SelectSQL.Add('(select coalesce(FURNITURA_OSTATOK,0) as kol_vo');
      IB_Ostatki.SelectSQL.Add('from FURNITURA_OSTATOK(f.id,4,:period_end))');
      IB_Ostatki.SelectSQL.Add('from furnitura f, furnitura_grupa fg');
      IB_Ostatki.SelectSQL.Add('where (not exists (select id from sverka where id_tovar=f.id)) and (fg.id=f.id_parent) )');
      IB_Ostatki.SelectSQL.Add('where kol_vo<>0');
      IB_Ostatki.ExecSQL;
    end;//if RG_Sverka.ItemIndex=1

  if RG_Sverka.ItemIndex=2 then //все склады
    begin
      IB_Ostatki.SelectSQL.Add('select max(id) as maxid from sverka');
      IB_Ostatki.Open;
      maxid:=IB_Ostatki.FieldByName('maxid').AsInteger;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('insert into sverka (id_tovar, id_tovar_1c, name_tovar, is_pilomat, kolvo_1c)');
      IB_Ostatki.SelectSQL.Add('select id_tovar, id_tovar_1c, name_tovar, is_pilomat, sum(kolvo_1c) from sverka where id<=:maxid');
      IB_Ostatki.SelectSQL.Add('group by 1,2,3,4');
      IB_Ostatki.ParamByName('maxid').Value:=maxid;
      IB_Ostatki.ExecSQL;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('delete from sverka where id<='+IntToStr(maxid));
      IB_Ostatki.ExecSQL;

      //пиломатериалы
      IB_Sverka.Close;
      IB_Sverka.SelectSQL.Clear;
      IB_Sverka.SelectSQL.Add('select * from sverka where is_pilomat=1');
      IB_Sverka.Open;
      IB_Sverka.First;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('select * from GET_OSTATOK_PILOMAT_GRUPA_ONE(:id_grupa,:period_end)');
      while not IB_Sverka.Eof do
        begin
          IB_Ostatki.Close;
          IB_Ostatki.ParamByName('id_grupa').Value:=IB_Sverka.FieldByName('id_tovar').AsInteger;
          IB_Ostatki.ParamByName('period_end').Value:=DateToStr(DT_Sverka_date.Date);
          IB_Ostatki.Open;
          if not IB_Ostatki.FieldByName('kol_vo').IsNull then
            begin
              IB_Sverka.Edit;
              IB_Sverka.FieldByName('KOLVO_INTERN').Value:=IB_Ostatki.FieldByName('kol_vo').AsFloat;
              IB_Sverka.FieldByName('NAME_TOVAR').Value:=IB_Ostatki.FieldByName('NAME_TOVAR').AsString;
              IB_Sverka.Post;
            end;
          IB_Sverka.Next;
        end;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('insert into sverka');
      IB_Ostatki.SelectSQL.Add('(id_tovar, name_tovar, kolvo_intern, kolvo_1c, is_pilomat)');
      IB_Ostatki.SelectSQL.Add('select id_grupa, name_tovar, kol_vo,0,1 from GET_OSTATOK_PILOMAT_GRUPA_ALL(:period_end)');
      IB_Ostatki.SelectSQL.Add('where (not exists (select id from sverka where id_tovar=id_grupa))');
      IB_Ostatki.ParamByname('period_end').Value:=DateToStr(DT_Sverka_date.Date);
      IB_Ostatki.ExecSQL;

      //комплектующие
      IB_Sverka.Close;
      IB_Sverka.SelectSQL.Clear;
      IB_Sverka.SelectSQL.Add('select * from sverka where is_pilomat=0');
      IB_Sverka.Open;
      IB_Sverka.First;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('select fg.name||'+Chr(39)+' / '+Chr(39)+'||f.name tovar_name,');
      IB_Ostatki.SelectSQL.Add('(select coalesce(FURNITURA_OSTATOK,0) +');
      IB_Ostatki.SelectSQL.Add('(select coalesce(FURNITURA_OSTATOK,0) as kol_vo');
      IB_Ostatki.SelectSQL.Add('from FURNITURA_OSTATOK(f.id,4,:period_end))');
      IB_Ostatki.SelectSQL.Add('as kol_vo');
      IB_Ostatki.SelectSQL.Add('from FURNITURA_OSTATOK(f.id,3,:period_end))');
      IB_Ostatki.SelectSQL.Add('from furnitura f, furnitura_grupa fg');
      IB_Ostatki.SelectSQL.Add('where (f.id=:id_furnitura) and (fg.id=f.id_parent)');
      while not IB_Sverka.Eof do
        begin
          IB_Ostatki.Close;
          IB_Ostatki.ParamByName('id_furnitura').Value:=IB_Sverka.FieldByName('id_tovar').AsInteger;
          IB_Ostatki.ParamByName('period_end').Value:=DateToStr(DT_Sverka_date.Date);
          IB_Ostatki.Open;
          if not IB_Ostatki.FieldByName('kol_vo').IsNull then
            begin
              IB_Sverka.Edit;
              IB_Sverka.FieldByName('KOLVO_INTERN').Value:=IB_Ostatki.FieldByName('kol_vo').AsFloat;
              IB_Sverka.FieldByName('NAME_TOVAR').Value:=IB_Ostatki.FieldByName('tovar_name').AsString;
              IB_Sverka.Post;
            end;
          IB_Sverka.Next;
        end;
      IB_Ostatki.Close;
      IB_Ostatki.SelectSQL.Clear;
      IB_Ostatki.SelectSQL.Add('insert into sverka');
      IB_Ostatki.SelectSQL.Add('(id_tovar, name_tovar, kolvo_intern, kolvo_1c, sklad, is_pilomat)');
      IB_Ostatki.SelectSQL.Add('select id_furnitura, tovar_name, kol_vo, 0,3,0 from');
      IB_Ostatki.SelectSQL.Add('(select f.id id_furnitura, fg.name||'+Chr(39)+' / '+Chr(39)+'||f.name tovar_name,');
      IB_Ostatki.SelectSQL.Add('(select coalesce(FURNITURA_OSTATOK,0) +');
      IB_Ostatki.SelectSQL.Add('(select coalesce(FURNITURA_OSTATOK,0) as kol_vo');
      IB_Ostatki.SelectSQL.Add('from FURNITURA_OSTATOK(f.id,4,:period_end)) as kol_vo');
      IB_Ostatki.SelectSQL.Add('from FURNITURA_OSTATOK(f.id,3,:period_end))');
      IB_Ostatki.SelectSQL.Add('from furnitura f, furnitura_grupa fg');
      IB_Ostatki.SelectSQL.Add('where (not exists (select id from sverka where id_tovar=f.id)) and (fg.id=f.id_parent) )');
      IB_Ostatki.SelectSQL.Add('where kol_vo<>0');
      IB_Ostatki.ExecSQL;
    end;//if RG_Sverka.ItemIndex=2

  IB_Sverka.Close;
  IB_Sverka.SelectSQL[0]:='select * from sverka';
  IB_Sverka.Open;
  DecimalSeparator:=old_DecimalSeparator;
  EXL_Sverka.DataSet:=IB_Sverka;
  EXL_Sverka.Show(SaveDialog1.FileName);
  IB_Ostatki.Free;
  ShowMessage('Отчет был сохранен в '+SaveDialog1.FileName);
end;

procedure TF_Reports.EXL_SverkaGetFieldValue(Sender: TObject;
  const Field: String; var Value: OleVariant);
begin
  value:=DateToStr(DT_Sverka_date.DateTime);
end;

procedure TF_Reports.FormCreate(Sender: TObject);
begin
  F_Reports_active:=false;
end;

end.

