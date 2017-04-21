unit Akt_raspil_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, DB, DBTables, IBQuery,
  IBCustomDataSet, Buttons, Menus;

type
  TF_Akt_raspil_edit = class(TForm)
    DBGR_LISTY: TDBGrid;
    DBGR_DETALI: TDBGrid;
    P_Buttons: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    P_Shapka: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBE_Date_R: TDBEdit;
    Label3: TLabel;
    DBGR_OSTATKI: TDBGrid;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    IB_Akt_raspil_detali: TIBDataSet;
    Label8: TLabel;
    DBE_ID_Zakaz: TDBEdit;
    B_Select_Zakaz: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    Label10: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DS_Akt_raspil_detali: TDataSource;
    E_Ostatok: TEdit;
    B_Sotrudnik2_clear: TSpeedButton;
    IB_Akt_raspil_listy: TIBDataSet;
    DS_Akt_raspil_listy: TDataSource;
    DBE_OTHOD_SUMMA: TDBEdit;
    Label7: TLabel;
    Label11: TLabel;
    Button1: TButton;
    IB_Akt_raspil_listyID_PARENT: TIntegerField;
    IB_Akt_raspil_listyID_PILOMAT_LISTY: TIntegerField;
    IB_Akt_raspil_listyKOL_VO: TIntegerField;
    IB_Akt_raspil_listyID: TIntegerField;
    IB_Pilomat_Listy_F: TIBDataSet;
    IB_Akt_raspil_listyGRUPA_NAME: TStringField;
    IB_Akt_raspil_listyLISTY_NAME: TStringField;
    IB_Pilomat_Detali_F: TIBDataSet;
    IB_Akt_raspil_detaliID_PARENT: TIntegerField;
    IB_Akt_raspil_detaliID_PILOMAT_DETALI: TIntegerField;
    IB_Akt_raspil_detaliKOL_VO: TIntegerField;
    IB_Akt_raspil_detaliID_SKLAD: TIntegerField;
    IB_Akt_raspil_detaliID: TIntegerField;
    IB_Akt_raspil_detaliGRUPA_NAME: TStringField;
    IB_Akt_raspil_detaliDETALY_NAME: TStringField;
    IB_Akt_raspil_detaliIS_REMONT: TSmallintField;
    IB_Akt_raspil_detaliREMONT_NAME: TStringField;
    PMenu_Detali: TPopupMenu;
    N_Set_Remont: TMenuItem;
    N_Clear_Remont: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGR_LISTYEditButtonClick(Sender: TObject);
    procedure DBGR_LISTYKeyPress(Sender: TObject; var Key: Char);
    procedure DBGR_DETALIEditButtonClick(Sender: TObject);
    procedure DBGR_DETALIKeyPress(Sender: TObject; var Key: Char);
    procedure IB_Akt_raspil_detaliNewRecord(DataSet: TDataSet);
    procedure B_Select_ZakazClick(Sender: TObject);
    procedure P_ShapkaExit(Sender: TObject);
    procedure DBE_Date_RExit(Sender: TObject);
    procedure B_Sotrudnik2_clearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IB_Akt_raspil_detaliDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Akt_raspil_listyNewRecord(DataSet: TDataSet);
    procedure IB_Akt_raspil_listyPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure DBGR_LISTYExit(Sender: TObject);
    procedure IB_Akt_raspil_listyBeforePost(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure DBGR_DETALIExit(Sender: TObject);
    procedure IB_Akt_raspil_detaliCalcFields(DataSet: TDataSet);
    procedure N_Set_RemontClick(Sender: TObject);
    procedure N_Clear_RemontClick(Sender: TObject);
    procedure DBGR_DETALIEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Akt_raspil_edit: TF_Akt_raspil_edit;
         OK_Pressed: boolean;
      ID_Akt_raspil: integer;
           is_error: boolean;//true если возникла ошибка удаления из справочника Pilomat_listy
           Old_Date: TDateTime;
          read_only: boolean;
implementation

uses main_f, mebeli_dm, gotov_prod_f, pilomat_f, zakaz_select_f,
  akt_raspil_jurnal_f;

{$R *.dfm}

procedure Generate_price;
var
  sql_listy_price: TIBQuery;
  sql_prihod_price: TIBQuery;
  kolvo_listy: integer;
begin
  DecimalSeparator_Old:=DecimalSeparator;
  DecimalSeparator:='.';
  sql_listy_price:=TIBQuery.Create(nil);
  sql_listy_price.Database:=F_Main.IBQuery1.Database;
  sql_listy_price.SQL.Add('delete from akt_raspil_listy_price where id_parent='+DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsString);
  sql_listy_price.ExecSQL;
  sql_listy_price.SQL.Clear;
  sql_listy_price.SQL.Add('insert into akt_raspil_listy_price (id_parent, id_pilomat_listy, kol_vo, id_prihod_listy, summa, price_m2)');
  sql_listy_price.SQL.Add('values (:id_parent, :id_pilomat_listy, :kol_vo, :id_prihod_listy, :summa, :price_m2)');

  sql_prihod_price:=TIBQuery.Create(nil);
  sql_prihod_price.Database:=F_Main.IBQuery1.Database;
  sql_prihod_price.SQL.Add('select * from GET_OSTATOK_PRIHOD_LISTY(:id_listy, :id_sklad, :date_ost) where kol_vo>0');
  sql_prihod_price.ParamByName('id_sklad').Value:=sklad_listy;
  sql_prihod_price.ParamByName('date_ost').Value:=Date();

  F_Akt_raspil_edit.IB_Akt_raspil_listy.First;
  while not F_Akt_raspil_edit.IB_Akt_raspil_listy.Eof do
    begin
      kolvo_listy:=F_Akt_raspil_edit.IB_Akt_raspil_listy.FieldByName('kol_vo').AsInteger;
      sql_prihod_price.Close;
      sql_prihod_price.ParamByName('id_listy').Value:=F_Akt_raspil_edit.IB_Akt_raspil_listy.FieldByName('id_pilomat_listy').AsInteger;
      sql_prihod_price.Open;
      sql_prihod_price.First;
      while not sql_prihod_price.Eof do
        begin
          if sql_prihod_price.FieldByName('kol_vo').AsInteger>=kolvo_listy then
            begin
              sql_listy_price.ParamByname('id_parent').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsInteger;
              sql_listy_price.ParamByname('id_pilomat_listy').Value:=F_Akt_raspil_edit.IB_Akt_raspil_listy.FieldByName('id_pilomat_listy').AsInteger;
              sql_listy_price.ParamByname('kol_vo').Value:=kolvo_listy;
              sql_listy_price.ParamByname('id_prihod_listy').Value:=sql_prihod_price.FieldByName('id_prihod').AsInteger;
              sql_listy_price.ParamByname('summa').Value:=sql_prihod_price.FieldByName('price_m2').AsFloat*kolvo_listy*sql_prihod_price.FieldByName('area_m2').AsFloat;
              sql_listy_price.ParamByname('price_m2').Value:=sql_prihod_price.FieldByName('price_m2').AsFloat;
              sql_listy_price.ExecSQL;
              break;
            end//if
          else
            begin
              sql_listy_price.ParamByname('id_parent').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsInteger;
              sql_listy_price.ParamByname('id_pilomat_listy').Value:=F_Akt_raspil_edit.IB_Akt_raspil_listy.FieldByName('id_pilomat_listy').AsInteger;
              sql_listy_price.ParamByname('kol_vo').Value:=sql_prihod_price.FieldByName('kol_vo').AsInteger;
              sql_listy_price.ParamByname('id_prihod_listy').Value:=sql_prihod_price.FieldByName('id_prihod').AsInteger;
              sql_listy_price.ParamByname('summa').Value:=sql_prihod_price.FieldByName('price_m2').AsFloat*sql_prihod_price.FieldByName('kol_vo').AsInteger*sql_prihod_price.FieldByName('area_m2').AsFloat;
              sql_listy_price.ParamByname('price_m2').Value:=sql_prihod_price.FieldByName('price_m2').AsFloat;
              sql_listy_price.ExecSQL;
              kolvo_listy:=kolvo_listy-sql_prihod_price.FieldByName('kol_vo').AsInteger;
            end;//else
          sql_prihod_price.Next;
        end;
      F_Akt_raspil_edit.IB_Akt_raspil_listy.Next;
    end;//while

  DecimalSeparator:=DecimalSeparator_Old;
  sql_listy_price.Close;
  sql_listy_price.Free;
  sql_prihod_price.Close;
  sql_prihod_price.Free;
end;//

procedure Update_othod;
var     sql_detali: TIBQuery;
         sql_listy: TIBQuery;
             othod_prc: real;
              othod_m2: real;
              price_m2: real;
        area_listy: integer;
       area_detali: integer;
      area_ostatok: integer;
     id_akt_prihod: integer;
begin
  DecimalSeparator_Old:=DecimalSeparator;
  DecimalSeparator:='.';

  SQL_detali:=TIBQuery.Create(nil);
  SQL_detali.Database:=F_Main.IBQuery1.Database;
  SQL_listy:=TIBQuery.Create(nil);
  SQL_listy.Database:=F_Main.IBQuery1.Database;

  F_Main.IBQuery1.Close;
  //площадь листов в акте
  SQL_listy.SQL.Clear;
  SQL_listy.SQL.Add('select sum (area_list) as area_listy from (select pl.id, sum(arl.kol_vo)*pl.area as area_list from pilomat_listy as pl, akt_raspil_listy as arl');
  SQL_listy.SQL.Add('where (arl.id_parent=:ID_Akt_raspil) and (arl.id_pilomat_listy=pl.id)');
  SQL_listy.SQL.Add('group by pl.id, pl.area)');
  SQL_listy.ParamByName('ID_Akt_raspil').Value:=ID_Akt_raspil;
  SQL_listy.Open;
  area_listy:=SQL_listy.FieldByName('area_listy').AsInteger;
  //площадь деталей в акте
  SQL_detali.SQL.Clear;
  SQL_detali.SQL.Add('select sum(area_detali) as area_detalei from');
  SQL_detali.SQL.Add('(select pd.id, sum(ard.kol_vo)*pd.area as area_detali from pilomat_detali as pd, akt_raspil_detali as ard');
  SQL_detali.SQL.Add('where (ard.id_parent=:ID_Akt_raspil) and (ard.id_pilomat_detali=pd.id)');
  SQL_detali.SQL.Add('group by pd.id, pd.area)');
  SQL_detali.ParamByName('ID_Akt_raspil').Value:=ID_Akt_raspil;
  SQL_detali.Open;
  area_detali:=SQL_detali.FieldByName('area_detalei').AsInteger;
  //площадь остатков в акте
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('select sum (ostatok) as ostatok_area from');
  F_Main.IBQuery1.SQL.Add('(select id, cast(sum(razmer_x*razmer_y)*kol_vo as integer) as ostatok from akt_raspil_ostatok as aro');
  F_Main.IBQuery1.SQL.Add('where (id_parent=:id_akt_raspil)');
  F_Main.IBQuery1.SQL.Add('group by id, kol_vo)');
  F_Main.IBQuery1.ParamByName('id_akt_raspil').Value:=ID_Akt_raspil;
  F_Main.IBQuery1.Open;
  DM_Mebeli.Ib_Akt_raspil.Edit;
  area_ostatok:=F_Main.IBQuery1.FieldByName('ostatok_area').AsInteger;
  DM_Mebeli.Ib_Akt_raspil.FieldByName('OSTATOK').Value:=area_ostatok;
  DM_Mebeli.Ib_Akt_raspil.Post;
  //процент отхода по акту
  othod_prc:=0;
  F_Main.IBQuery1.Close;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('select sum(arlp.summa)/sum(arlp.kol_vo*pl.area/1000000.000) price_m2');
  F_Main.IBQuery1.SQL.Add('from akt_raspil_listy_price arlp, pilomat_listy pl');
  F_Main.IBQuery1.SQL.Add('where (arlp.id_parent=:ID_Akt_raspil) and (arlp.id_pilomat_listy=pl.id)');

  F_Main.IBQuery1.ParamByname('ID_Akt_raspil').Value:=ID_Akt_raspil;
  F_Main.IBQuery1.Open;
  price_m2:=F_Main.IBQuery1.FieldByName('price_m2').AsFloat;

  IF area_listy>0 Then
    othod_prc:=(area_listy-area_detali-area_ostatok)/area_listy*100;
  othod_m2:=(area_listy-area_detali-area_ostatok)/1000000.000;
  F_Main.IBQuery1.Close;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('update akt_raspil set OTHOD=:othod_prc, othod_m2= :othod_sqm, othod_summa= :othod_summa' );
  F_Main.IBQuery1.SQL.Add('where id=:ID_Akt_raspil');
  F_Main.IBQuery1.ParamByname('ID_Akt_raspil').Value:=ID_Akt_raspil;
  F_Main.IBQuery1.ParamByname('othod_prc').Value:=othod_prc;
  F_Main.IBQuery1.ParamByname('othod_sqm').Value:=othod_m2;
  F_Main.IBQuery1.ParamByname('othod_summa').Value:=othod_m2*price_m2;
  F_Main.IBQuery1.ExecSQL;

  //если есть остатки, заводим их в справочник листов
  IF area_ostatok>0 Then
    begin
      DM_Mebeli.IB_Akt_raspil_ostatok.Open;
      //подготавливаем справочник "Pilomat_listy" для вставки новых позиций
      F_Main.IBQuery2.SQL.Clear;
      F_Main.IBQuery2.SQL.Add('insert into pilomat_listy (id,id_grupa,razmer_x,razmer_y,area,name)');
      F_Main.IBQuery2.SQL.Add('values (:id,:id_grupa,:razmer_x,:razmer_y,:area,:name)');
      //определяем группу "Pilomat_grupa" которой принадлежат листы в акте
      F_Main.IBQuery1.SQL.Clear;
      F_Main.IBQuery1.SQL.Add('select id_grupa from pilomat_listy');
      F_Main.IBQuery1.SQL.Add('where id='+F_Akt_raspil_edit.IB_Akt_raspil_listy.FieldByName('ID_PILOMAT_LISTY').AsString);
      F_Main.IBQuery1.Open;

      F_Main.IBQuery2.ParamByName('id_grupa').Value:=F_Main.IBQuery1.FieldByname('ID_GRUPA').AsInteger;

      DM_Mebeli.IB_Akt_raspil_ostatok.First;
      SQL_listy.SQL.Clear;
      SQL_listy.SQL.Add('SELECT GEN_ID(GEN_PILOMAT_LISTY_ID, 1) from RDB$DATABASE');
      //готовим запрос на удаление из справ "Pilomat_listy" записей введенных по "Akt_raspil_ostatok"
      //а также из "Prihod_listy", если "Акт раскроя" редактируется
      F_Main.IBQuery3.SQL.Clear;
      F_Main.IBQuery3.SQL.Add('delete from pilomat_listy where id=:id_po_ostatok');
      F_Main.IBQuery4.SQL.Clear;
      F_Main.IBQuery4.SQL.Add('delete from prihod_listy_0 where id_akt_raspil='+IntToStr(ID_Akt_raspil));
      While not DM_Mebeli.IB_Akt_raspil_ostatok.Eof Do
        begin
          SQL_listy.Open;
          //Проверяем если в справочнике листов нет уже введенного остатка
          //то вводим их в справочник
          IF DM_Mebeli.IB_Akt_raspil_ostatok.FieldByName('ID_PILOMAT_LISTY').IsNull Then
            begin
              F_Main.IBQuery2.ParamByName('id').Value:=SQL_listy.FieldByName('GEN_ID').AsString;
              F_Main.IBQuery2.ParamByName('razmer_x').Value:=DM_Mebeli.IB_Akt_raspil_ostatok.FieldByName('RAZMER_X').AsInteger;
              F_Main.IBQuery2.ParamByName('razmer_y').Value:=DM_Mebeli.IB_Akt_raspil_ostatok.FieldByName('RAZMER_Y').AsInteger;
              F_Main.IBQuery2.ParamByName('name').Value:=DM_Mebeli.IB_Akt_raspil_ostatok.FieldByName('NAME').AsString;
              F_Main.IBQuery2.ParamByName('area').Value:=DM_Mebeli.IB_Akt_raspil_ostatok.FieldByName('RAZMER_X').AsInteger*DM_Mebeli.IB_Akt_raspil_ostatok.FieldByName('RAZMER_Y').AsInteger;
              F_Main.IBQuery2.ExecSQL;
              DM_Mebeli.IB_Akt_raspil_ostatok.Edit;
              DM_Mebeli.IB_Akt_raspil_ostatok.FieldByName('ID_PILOMAT_LISTY').Value:=SQL_listy.FieldByName('GEN_ID').AsInteger;
              DM_Mebeli.IB_Akt_raspil_ostatok.Post;
            end;//IF not DM_Mebeli.IB_Pilomat_listy.Locate
          SQl_listy.Close;
          DM_Mebeli.IB_Akt_raspil_ostatok.Next;
        end;//While
      //Делаем приход остатков листов
      SQL_Listy.Close;
      SQL_Listy.SQL.Clear;
      SQL_Listy.SQL.Add('update or insert into PRIHOD_LISTY_0 (DATE_P,ID_SKLAD,ID_AKT_RASPIL,PRIMECHANIE)');
      SQL_Listy.SQL.Add('values (:date_P,:ID_SKLAD,:ID_AKT_RASPIL,:PRIMECHANIE)');
      SQL_Listy.SQL.Add('MATCHING (ID_AKT_RASPIL)');
      SQL_Listy.ParamByName('date_P').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('date_r').AsDateTime;
      SQL_Listy.ParamByName('ID_SKLAD').Value:=sklad_listy;
      SQL_Listy.ParamByName('ID_AKT_RASPIL').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsInteger;
      SQL_Listy.ParamByName('PRIMECHANIE').Value:='Приход остатков из Акта распила №'+DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsString+' от '+DM_Mebeli.IB_Akt_raspil.FieldByName('date_r').AsString;
      SQL_Listy.ExecSQL;

      SQL_Listy.Close;
      SQL_Listy.SQL.Clear;
      SQL_Listy.SQL.Add('select id from prihod_listy_0 where id_akt_raspil=:id_akt_raspil');
      SQL_Listy.ParamByName('ID_AKT_RASPIL').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsInteger;
      SQL_Listy.Open;
      id_akt_prihod:=SQL_Listy.FieldByName('id').AsInteger;
      SQL_Listy.Close;
      SQL_Listy.SQL.Clear;
      SQL_Listy.SQL.Add('merge');
      SQL_Listy.SQL.Add('into PRIHOD_LISTY_1 pl1');
      SQL_Listy.SQL.Add('using (select '+IntToStr(id_akt_prihod)+' as id_akt_prihod,ID_PILOMAT_LISTY,KOL_VO,(select ID_GRUPA from pilomat_listy where id=AKT_RASPIL_OSTATOK.id_pilomat_listy),');
      SQL_Listy.SQL.Add('(select first 1');
      SQL_Listy.SQL.Add('(select sum(pl.area*arlp.kol_vo*arlp.price_m2)/sum(arlp.kol_vo*pl.area)');
      SQL_Listy.SQL.Add('from akt_raspil_listy_price arlp, pilomat_listy pl');
      SQL_Listy.SQL.Add('where (arlp.id_parent=:id_raspil) and (arlp.id_pilomat_listy=pl.id)');
      SQL_Listy.SQL.Add(') as tsena_m2');
      SQL_Listy.SQL.Add('from prihod_listy_0 prl0, prihod_listy_1 prl1, pilomat_listy pl');
      SQL_Listy.SQL.Add('where (prl0.id=prl1.id_parent) and (prl1.id_listy=pl.id)');
      SQL_Listy.SQL.Add('and (prl1.id_listy=');
      SQL_Listy.SQL.Add('( select first 1 arl.id_pilomat_listy');
      SQL_Listy.SQL.Add('from akt_raspil_listy arl, pilomat_listy pl');
      SQL_Listy.SQL.Add('where (arl.id_parent=:id_raspil) and (pl.id=arl.id_pilomat_listy)');
      SQL_Listy.SQL.Add('order by pl.islist desc ) )');
      SQL_Listy.SQL.Add('and (prl0.date_p<=(select date_r from akt_raspil where id=:id_raspil))');
      SQL_Listy.SQL.Add('order by prl0.date_p desc)');
      SQL_Listy.SQL.Add('from AKT_RASPIL_OSTATOK where id_parent=:id_raspil) aro');
      SQL_Listy.SQL.Add('on (pl1.id_parent=aro.id_akt_prihod) and (pl1.id_listy=aro.ID_PILOMAT_LISTY)');
      SQL_Listy.SQL.Add('when matched then');
      SQL_Listy.SQL.Add('update set kol_vo=aro.kol_vo, summa=aro.tsena_m2*aro.kol_vo*(select Razmer_X*Razmer_Y from akt_raspil_ostatok where id_pilomat_listy=aro.ID_PILOMAT_LISTY)/1000000.000');
      SQL_Listy.SQL.Add('when not matched then');
      SQL_Listy.SQL.Add('insert (ID_PARENT,ID_LISTY,KOL_VO,ID_GRUPA, SUMMA)');
      SQL_Listy.SQL.Add('values ('+IntToStr(id_akt_prihod)+',aro.ID_PILOMAT_LISTY, aro.kol_vo, aro.id_grupa, aro.tsena_m2*(select Razmer_X*Razmer_Y from akt_raspil_ostatok where id_pilomat_listy=aro.ID_PILOMAT_LISTY)/1000000.000)');
      SQL_Listy.ParamByName('id_raspil').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsInteger;
      SQL_Listy.ExecSQL;
    end;//IF
  SQL_detali.Free;
  SQL_listy.Free;
  DecimalSeparator:=DecimalSeparator_Old;
end;//proc

//Процедура генерирует записи в таблицах PRIHOD_DETALI_0 и PRIHOD_DETALI_1
procedure Generate_prihod;
var sql_detali: TIBQuery;
    ID_PRIHOD: string[20];
    sql_detali_sklad: TIBQuery;
begin
  DecimalSeparator_Old:=DecimalSeparator;
  DecimalSeparator:='.';

  SQL_detali:=TIBQuery.Create(nil);
  SQL_detali.Database:=F_Main.IBQuery1.Database;
  SQL_detali_sklad:=TIBQuery.Create(nil);
  SQL_detali_sklad.Database:=F_Main.IBQuery1.Database;

  SQL_detali.SQL.Clear;
  SQL_detali.SQL.Add('select id');
  SQL_detali.SQL.Add('from akt_raspil_detali ard');
  SQL_detali.SQL.Add('where not exists (');
  SQL_detali.SQL.Add('select prd1.id_pilomat_detali');
  SQL_detali.SQL.Add('from prihod_detali_0 prd0, prihod_detali_1 prd1');
  SQL_detali.SQL.Add('where (prd0.id=prd1.id_parent) and (prd0.id_akt_raspil= :id_akt_raspil) and (ard.id_pilomat_detali=prd1.id_pilomat_detali))');
  SQL_detali.ParamByname('id_akt_raspil').Value:=ID_Akt_raspil;
  SQL_detali.Open;
  if SQL_detali.FieldByName('id').IsNull then
    exit;

  With DM_Mebeli do
    begin
      IB_Prihod_detali_0.Open;
      IB_Akt_raspil.Open;

      sql_detali_sklad.SQL.Clear;
      sql_detali_sklad.SQL.Add('select distinct id_sklad from akt_raspil_detali where id_parent='+IntToStr(ID_Akt_raspil));
      sql_detali_sklad.Open;
      sql_detali_sklad.First;
      While not sql_detali_sklad.Eof Do
        begin
          SQL_detali.SQL.Clear;
          SQL_detali.SQL.Add('SELECT GEN_ID(GEN_PRIHOD_DETALI_0_ID, 1) from RDB$DATABASE');
          SQL_detali.Open;
          ID_PRIHOD:=SQL_Detali.FieldByName('GEN_ID').AsString;

          SQL_detali.SQL.Clear;

          SQL_detali.SQL.Add('select ID_PILOMAT_DETALI');
          SQL_detali.SQL.Add('from akt_raspil_detali ard where (ID_PARENT=:id_raspil) and (ID_SKLAD='+IntToStr(sklad_detali)+') and');
          SQL_detali.SQL.Add('not exists (');
          SQL_detali.SQL.Add('select prd1.id_pilomat_detali');
          SQL_detali.SQL.Add('from prihod_detali_0 prd0, prihod_detali_1 prd1');
          SQL_detali.SQL.Add('where (prd0.id=prd1.id_parent) and (prd0.id_akt_raspil=:id_raspil) and (ard.id_pilomat_detali=prd1.id_pilomat_detali) ) ');
          SQL_detali.ParamByName('id_raspil').Value:=ID_Akt_raspil;
          SQL_detali.Open;
          if SQL_detali.FieldByName('ID_PILOMAT_DETALI').IsNull then
            exit;

          SQL_detali.Close;
          SQL_detali.SQL.Clear;
          SQL_detali.SQL.Add('insert into prihod_detali_0 (ID, DATE_P, ID_SKLAD, ID_VID_RABOT, ID_AKT_RASPIL, ID_ZAKAZ)');
          SQL_detali.SQL.Add('SELECT '+ID_PRIHOD+', DATE_R,'+sql_detali_sklad.FieldByName('ID_SKLAD').AsString+', 1, ID, ID_ZAKAZ from akt_raspil where ID='+IntToStr(ID_Akt_raspil));
          SQL_detali.ExecSql;

          SQL_detali.SQL.Clear;
            SQL_detali.SQL.Add('insert into prihod_detali_1 (ID_PARENT, ID_PILOMAT_DETALI, KOL_VO, SUMMA)');
          SQL_detali.SQL.Add('select '+ID_PRIHOD+', ID_PILOMAT_DETALI, SUM(KOL_VO),');
          SQL_detali.SQL.Add('(select sum(arlp.summa)/sum(arlp.kol_vo*pl.area/1000000.000) price_m2');
          SQL_detali.SQL.Add('from akt_raspil_listy_price arlp, pilomat_listy pl');
          SQL_detali.SQL.Add('where (arlp.id_parent=:id_raspil) and (arlp.id_pilomat_listy=pl.id)');
          SQL_detali.SQL.Add(')*SUM(KOL_VO)*(select razmer_x*razmer_y from pilomat_detali where id=ard.id_pilomat_detali)/1000000.000 as summa_m2');
          SQL_detali.SQL.Add('from akt_raspil_detali ard where (ID_PARENT=:id_raspil)and (ID_SKLAD='+IntToStr(sklad_detali)+') and');
          SQL_detali.SQL.Add('not exists (');
          SQL_detali.SQL.Add('select prd1.id_pilomat_detali');
          SQL_detali.SQL.Add('from prihod_detali_0 prd0, prihod_detali_1 prd1');
          SQL_detali.SQL.Add('where (prd0.id=prd1.id_parent) and (prd0.id_akt_raspil=:id_raspil) and (ard.id_pilomat_detali=prd1.id_pilomat_detali) )');
          SQL_detali.SQL.Add('group by ID_PILOMAT_DETALI');
          SQL_detali.ParamByName('id_raspil').Value:=ID_Akt_raspil;
          SQL_detali.ExecSql;
          sql_detali_sklad.Next;
        end;//While not sql_detali_sklad.SQL.Eof
    end;//With DM_Mebeli
    sql_detali.Close;
    sql_detali_sklad.Close;
    sql_detali.Free;
    sql_detali_sklad.Free;
    DecimalSeparator:=DecimalSeparator_Old;
end;//proc

procedure TF_Akt_raspil_edit.FormActivate(Sender: TObject);
begin
//  IB_Akt_raspil_ostatok.Open;
  IB_Akt_raspil_listy.Open;
  IB_Akt_raspil_detali.Open;

  B_Ok.Enabled:=true;
  DBGR_Listy.Enabled:=true;
  DBGR_Ostatki.Enabled:=true;
  DBGR_Detali.Enabled:=true;
  Read_Only:=false;
  OK_Pressed:=False;
  DBE_Date_R.ReadOnly:=False;
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       DM_Mebeli.IB_Akt_raspil.Insert;
       DM_Mebeli.IB_Akt_raspil.FieldByName('DATE_R').Value:=Date;
       DM_Mebeli.IB_Akt_raspil.FieldByName('OTHOD').Value:=0;
       DM_Mebeli.IB_Akt_raspil.Post;
       DM_Mebeli.IB_Akt_raspil.Edit;
       IF role_name='USER' Then
          DBE_Date_R.ReadOnly:=True;
     end;//IF 'INSERT'
  IF operation='EDIT' Then
    DM_Mebeli.IB_Akt_raspil.Edit;
  Old_Date:=DM_Mebeli.IB_Akt_raspil.FieldByName('DATE_R').AsDateTime;
  IF (DM_Mebeli.IB_Akt_raspil.FieldByName('DATE_R').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      B_Ok.Enabled:=false;
      ShowMessage('Дата документа меньше даты запрета редактирования. Документ только для чтения');
      DBGR_Listy.Enabled:=false;
      DBGR_Ostatki.Enabled:=false;
      DBGR_Detali.Enabled:=false;
      Read_Only:=true;
    end;//IF DataZapretaRedakt
  DBE_Id_Zakaz.SetFocus;
  ID_Akt_raspil:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
  E_Ostatok.Text:=FloatToStrF((DM_Mebeli.IB_Akt_raspil.FieldByName('OSTATOK').AsInteger/1000000.000),ffNumber,9,3)+' м2';
end;//proc

procedure TF_Akt_raspil_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Akt_raspil_edit.B_OkClick(Sender: TObject);
begin
  IF (DM_Mebeli.IB_Akt_raspil.FieldByName('DATE_R').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      DM_Mebeli.IBTransaction1.Rollback;
      OK_Pressed:=True;
      close;
    end;//IF DataZapretaRedakt

  is_error:=False;
  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (DM_Mebeli.IB_Akt_raspil.State=dsEdit) OR (DM_Mebeli.IB_Akt_raspil.State=dsInsert) Then
          DM_Mebeli.IB_Akt_raspil.Post;
       IF (IB_Akt_raspil_listy.State=dsEdit) OR (IB_Akt_raspil_listy.State=dsInsert) Then
          IB_Akt_raspil_listy.Post;
       IF (IB_Akt_raspil_detali.State=dsEdit) OR (IB_Akt_raspil_detali.State=dsInsert) Then
          IB_Akt_raspil_detali.Post;
       Generate_price;
       Update_othod;

       DM_Mebeli.IB_Akt_raspil.Refresh;
       if DM_Mebeli.IB_Akt_raspil.FieldByName('othod_m2').AsFloat<0 then
          begin
            ShowMessage('Площадь деталей больше площади листов! Проверьте.');
            exit;
          end;

       Generate_prihod;

       IF not is_error Then
        begin
          DM_Mebeli.IBTransaction1.Commit;
          OK_Pressed:=True;
          close
        end
       ELSE
        DM_Mebeli.IBTransaction1.Rollback;
     end;//IF
end;//proc

procedure TF_Akt_raspil_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  IF read_only then
    begin
      IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback;
      exit;
    end;

  IF OK_Pressed Then
    begin
//      IB_Akt_raspil_ostatok.Close;
      IB_Akt_raspil_detali.Close;
      IB_Akt_raspil_detali.Close;
      exit;
    end;
  is_error:=false;
  res:=MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     Action:=caNone;
  IF res=mrNo Then
     IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback;
  IF res=mrYes Then
    begin
      ok_pressed:=true;
      B_OkClick(Sender);
    end;//IF res=mrYes
  IF res<>mrCancel Then
    begin
      IB_Akt_raspil_detali.Close;
      IB_Akt_raspil_detali.Close;
    end;
end;//proc

procedure TF_Akt_raspil_edit.DBGR_LISTYEditButtonClick(Sender: TObject);
var old_operation: string [6];
begin
  old_operation:=operation;
  operation:='SELECT_STOCKS';
  IF F_Pilomat.ShowModal=mrOk Then
    begin
      if IB_Akt_raspil_listy.State=dsBrowse then
        IB_Akt_raspil_listy.Insert
      else
        IB_Akt_raspil_listy.Edit;
      IB_Akt_raspil_listy.FieldByName('ID_PILOMAT_LISTY').Value:=F_Pilomat.id_listy;
      IB_Akt_raspil_listy.Post;
    end;//IF =mrOk
  operation:=old_operation;
  DBGR_LISTY.SelectedIndex:=3;
end;//proc

procedure TF_Akt_raspil_edit.DBGR_LISTYKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key=' ' Then
    DBGR_LISTYEditButtonClick(Sender);
end;//proc

procedure TF_Akt_raspil_edit.DBGR_DETALIEditButtonClick(Sender: TObject);
var old_operation: string [6];
begin
  old_operation:=operation;
  operation:='SELECT_STOCKS';
  IF F_Pilomat.ShowModal=mrOk Then
    begin
      IB_Akt_raspil_detali.Edit;
      IB_Akt_raspil_detali.FieldByName('ID_PILOMAT_DETALI').Value:=F_Pilomat.id_detali;
      IB_Akt_raspil_detali.Post;
    end;//IF =mrOk
  operation:=old_operation;
  DBGR_Detali.SelectedIndex:=3;
end;//proc

procedure TF_Akt_raspil_edit.DBGR_DETALIKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key=' ' Then
    DBGR_DETALIEditButtonClick(Sender);
end;//proc


procedure TF_Akt_raspil_edit.IB_Akt_raspil_detaliNewRecord(
  DataSet: TDataSet);
begin
  IB_Akt_raspil_detali.FieldByName('ID_PARENT').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
  IB_Akt_raspil_detali.FieldByName('ID_SKLAD').Value:=sklad_detali;
end;//proc

procedure TF_Akt_raspil_edit.B_Select_ZakazClick(Sender: TObject);
begin
  F_Zakaz_select.ShowModal;
  DM_Mebeli.IB_Akt_raspil.Edit;
  IF F_Zakaz_select.ModalResult=mrOk Then
    DM_Mebeli.IB_Akt_raspil.FieldByName('ID_ZAKAZ').Value:=id_zakaz;
end;//proc

procedure TF_Akt_raspil_edit.P_ShapkaExit(Sender: TObject);
begin
  IF DM_Mebeli.IB_Akt_raspil.FieldByName('id_zakaz').IsNull Then
    begin
      ShowMessage('Не указан Заказ!!!');
      DBE_ID_Zakaz.SetFocus;
    end;//if
end;

procedure TF_Akt_raspil_edit.DBE_Date_RExit(Sender: TObject);
begin
  IF (DM_Mebeli.IB_Akt_raspil.FieldByName('DATE_R').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      ShowMessage('Дата документа меньше даты запрета редактирования: '+DateToStr(DataZapretaRedakt));
      DM_Mebeli.IB_Akt_raspil.FieldByName('DATE_R').Value:=Old_Date;
      DBE_Date_r.SetFocus;
    end;//IF DataZapretaRedakt
end;//proc

procedure TF_Akt_raspil_edit.B_Sotrudnik2_clearClick(Sender: TObject);
begin
  DM_Mebeli.IB_Akt_raspil.FieldByName('id_sotrudnik_2').Value:=null;
end;

procedure TF_Akt_raspil_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Akt_raspil_edit);
  F_Akt_raspil_edit.Width:=Screen.Width;
  F_Akt_raspil_edit.Height:=Screen.Height;
end;

procedure TF_Akt_raspil_edit.IB_Akt_raspil_detaliDeleteError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  dm_mebeli.trigger_error(e.Message);
end;

procedure TF_Akt_raspil_edit.IB_Akt_raspil_listyNewRecord(
  DataSet: TDataSet);
begin
  IB_Akt_raspil_listy.FieldByName('ID_PARENT').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
end;

procedure TF_Akt_raspil_edit.IB_Akt_raspil_listyPostError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  dm_mebeli.trigger_error(e.Message);
  IB_Akt_raspil_listy.Cancel;
  IB_Akt_raspil_listy.Refresh;
  DBGR_Listy.SetFocus;
end;

procedure TF_Akt_raspil_edit.DBGR_LISTYExit(Sender: TObject);
begin
  IF (IB_Akt_raspil_listy.State=dsEdit) OR (IB_Akt_raspil_listy.State=dsInsert) Then
    IB_Akt_raspil_listy.Post;
end;

procedure TF_Akt_raspil_edit.IB_Akt_raspil_listyBeforePost(
  DataSet: TDataSet);
var  sql_listy_ostatok: TIBQuery;
begin
  sql_listy_ostatok:=TIBQuery.Create(nil);
  sql_listy_ostatok.Database:=F_Main.IBQuery1.Database;
  sql_listy_ostatok.SQL.Add('select LIST_OSTATOK from ostatok_list(:id_pilomat_listy, 1, :period_end)');
  sql_listy_ostatok.ParamByName('id_pilomat_listy').Value:=IB_Akt_raspil_listy.FieldByName('id_pilomat_listy').AsInteger;
  sql_listy_ostatok.ParamByName('period_end').Value:=Date();
  sql_listy_ostatok.Open;
  if (sql_listy_ostatok.FieldByName('LIST_OSTATOK').AsInteger - IB_Akt_raspil_listy.FieldByName('kol_vo').AsInteger)<0 then
    begin
      ShowMessage('Листов не хватает на складе');
      Abort;
    end;
end;

procedure TF_Akt_raspil_edit.Button1Click(Sender: TObject);
begin
IB_Akt_raspil_listy.Refresh;
end;

procedure TF_Akt_raspil_edit.DBGR_DETALIExit(Sender: TObject);
begin
  IF (IB_Akt_raspil_detali.State=dsEdit) OR (IB_Akt_raspil_detali.State=dsInsert) Then
    IB_Akt_raspil_detali.Post;
end;

procedure TF_Akt_raspil_edit.IB_Akt_raspil_detaliCalcFields(
  DataSet: TDataSet);
begin
  if IB_Akt_raspil_detali.FieldByname('is_remont').AsInteger=0 then
    IB_Akt_raspil_detali.FieldByname('remont_name').value:='Нет'
  else
    IB_Akt_raspil_detali.FieldByname('remont_name').value:='Да';
end;

procedure TF_Akt_raspil_edit.N_Set_RemontClick(Sender: TObject);
begin
  IB_Akt_raspil_detali.Edit;
  IB_Akt_raspil_detali.FieldByname('is_remont').Value:=1;
  IB_Akt_raspil_detali.Post;
end;

procedure TF_Akt_raspil_edit.N_Clear_RemontClick(Sender: TObject);
begin
  IB_Akt_raspil_detali.Edit;
  IB_Akt_raspil_detali.FieldByname('is_remont').Value:=0;
  IB_Akt_raspil_detali.post;
end;

procedure TF_Akt_raspil_edit.DBGR_DETALIEnter(Sender: TObject);
begin
  DM_Mebeli.IB_Akt_raspil.Post;
end;

end.
