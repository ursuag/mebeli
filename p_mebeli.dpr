program p_mebeli;



uses
  Forms,
  main_f in 'main_f.pas' {F_Main},
  mebeli_dm in 'mebeli_dm.pas' {DM_Mebeli: TDataModule},
  password_dlg in 'password_dlg.pas' {PasswordDlg},
  sotrudniki_f in 'sotrudniki_f.pas' {F_Sotrudniki},
  sklad_f in 'sklad_f.pas' {F_Sklad},
  password_f in 'password_f.pas' {F_Password},
  vidy_rabot_f in 'vidy_rabot_f.pas' {F_Vidy_rabot},
  pilomat_f in 'pilomat_f.pas' {F_Pilomat},
  pilomat_grupa_f in 'pilomat_grupa_f.pas' {F_pilomat_grupa},
  pilomat_listy_f in 'pilomat_listy_f.pas' {F_Pilomat_listy},
  pilomat_detali_f in 'pilomat_detali_f.pas' {F_Pilomat_detali},
  furnitura_f in 'furnitura_f.pas' {F_Furnitura},
  gotov_prod_f in 'gotov_prod_f.pas' {F_Gotov_prod},
  gotov_prod_edit_f in 'gotov_prod_edit_f.pas' {F_Gotov_prod_edit},
  zakaz_edit_f in 'zakaz_edit_f.pas' {F_Zakaz_edit},
  akt_raspil_jurnal_f in 'akt_raspil_jurnal_f.pas' {F_Akt_raspil_jurnal},
  Akt_raspil_edit_f in 'Akt_raspil_edit_f.pas' {F_Akt_raspil_edit},
  akt_vip_rabot_jurnal_f in 'akt_vip_rabot_jurnal_f.pas' {F_Akt_vip_rabot_jurnal},
  Akt_vip_rab_edit_f in 'Akt_vip_rab_edit_f.pas' {F_Akt_vip_rab_edit},
  Prihod_detali_jurnal_f in 'Prihod_detali_jurnal_f.pas' {F_Prihod_detali_jurnal},
  Prihod_detali_edit_f in 'Prihod_detali_edit_f.pas' {F_Prihod_detali_edit},
  zakaz_select_f in 'zakaz_select_f.pas' {F_Zakaz_select},
  akt_vip_prod_jurnal_f in 'akt_vip_prod_jurnal_f.pas' {F_Akt_vip_prod_jurnal},
  akt_vip_prod_edit_f in 'akt_vip_prod_edit_f.pas' {F_Akt_vip_prod_edit},
  prihod_listy_jurnal_f in 'prihod_listy_jurnal_f.pas' {F_Prihod_listy_jurnal},
  prihod_listy_edit_f in 'prihod_listy_edit_f.pas' {F_Prihod_listy_edit},
  furnitura_edit_f in 'furnitura_edit_f.pas' {F_Furnitura_edit},
  furnitura_grupa_vidrabot_f in 'furnitura_grupa_vidrabot_f.pas' {F_furnitura_grupa_vidrabot},
  Vidy_rabot_stoimosti_edit_f in 'Vidy_rabot_stoimosti_edit_f.pas' {F_Vidy_rabot_stoimosti_edit},
  prihod_furnitura_jurnal_f in 'prihod_furnitura_jurnal_f.pas' {F_Prihod_furnitura_jurnal},
  prihod_furnitura_edit_f in 'prihod_furnitura_edit_f.pas' {F_prihod_furnitura_edit},
  Peremeschenie_jurnal_f in 'Peremeschenie_jurnal_f.pas' {F_Peremeschenie_jurnal},
  Peremeschenie_edit_f in 'Peremeschenie_edit_f.pas' {F_Peremeschenie_edit},
  about in 'about.pas' {F_About},
  spisanie_jurnal_f in 'spisanie_jurnal_f.pas' {F_Spisanie_jurnal},
  spisanie_edit_f in 'spisanie_edit_f.pas' {F_Spisanie_edit},
  reports_f in 'reports_f.pas' {F_Reports},
  print_forms in 'print_forms.pas' {F_Print_Forms},
  Akt_vip_prod_rashod_furnitura_f in 'Akt_vip_prod_rashod_furnitura_f.pas' {F_Akt_vip_prod_rashod_furnitura},
  Gotov_prod_categories_f in 'Gotov_prod_categories_f.pas' {F_Gotov_prod_categories},
  Contragenty_f in 'Contragenty_f.pas' {F_Contragenty},
  Prodaja_jurnal_f in 'Prodaja_jurnal_f.pas' {F_Prodaja_jurnal},
  Prodaja_edit_f in 'Prodaja_edit_f.pas' {F_Prodaja_edit},
  hyperination in 'hyperination.pas',
  Zakaz_Gotovprod_Ostatok_f in 'Zakaz_Gotovprod_Ostatok_f.pas' {F_Zakaz_Gotovprod_Ostatok},
  constanty_f in 'constanty_f.pas' {F_Constanty},
  Peremeschenie_jurnal_print_f in 'Peremeschenie_jurnal_print_f.pas' {F_Peremeschenie_jurnal_print},
  Spisanie_jurnal_print_f in 'Spisanie_jurnal_print_f.pas' {F_Spisanie_jurnal_print},
  Print_Forms_2_f in 'Print_Forms_2_f.pas' {F_Print_Forms_2},
  Statyi_Rashoda_f in 'Statyi_Rashoda_f.pas' {F_Statyi_Rashoda},
  Statyi_Rashoda_edit_f in 'Statyi_Rashoda_edit_f.pas' {F_Statyi_Rashoda_edit},
  Gotov_prod_normy_f in 'Gotov_prod_normy_f.pas' {F_Gotov_prod_normy},
  Signs_Management_f in 'Signs_Management_f.pas' {F_Signs_Management},
  Bank_Jurnal_f in 'Bank_Jurnal_f.pas' {F_Bank_Jurnal},
  bank_prihod_f in 'bank_prihod_f.pas' {F_Bank_prihod},
  Statyi_Dohoda_f in 'Statyi_Dohoda_f.pas' {F_Statyi_Dohoda},
  statyi_Dohoda_edit_f in 'statyi_Dohoda_edit_f.pas' {F_Statyi_Dohoda_edit},
  Bank_rashod_f in 'Bank_rashod_f.pas' {F_Bank_rashod},
  Cassa_Jurnal_f in 'Cassa_Jurnal_f.pas' {F_Cassa_Jurnal},
  Cassa_prihod_f in 'Cassa_prihod_f.pas' {F_Cassa_prihod},
  Cassa_rashod_f in 'Cassa_rashod_f.pas' {F_Cassa_rashod},
  Remont_jurnal_f in 'Remont_jurnal_f.pas' {F_Remont_jurnal},
  Remont_edit_f in 'Remont_edit_f.pas' {F_Remont_edit},
  Lavoare_list_f in 'Lavoare_list_f.pas' {F_Lavoare_list},
  Lavoare_edit_f in 'Lavoare_edit_f.pas' {F_Lavoare_edit},
  Calc_sebestoimosti_f in 'Calc_sebestoimosti_f.pas' {F_Calc_sebestoimosti},
  Revizii_jurnal_df in 'Revizii_jurnal_df.pas' {F_Revizii_jurnal},
  Revizia_edit_f in 'Revizia_edit_f.pas' {F_Revizia_edit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Мебельный цех';
  Application.CreateForm(TF_Main, F_Main);
  Application.CreateForm(TDM_Mebeli, DM_Mebeli);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.CreateForm(TF_Sotrudniki, F_Sotrudniki);
  Application.CreateForm(TF_Sklad, F_Sklad);
  Application.CreateForm(TF_Password, F_Password);
  Application.CreateForm(TF_Vidy_rabot, F_Vidy_rabot);
  Application.CreateForm(TF_Pilomat, F_Pilomat);
  Application.CreateForm(TF_pilomat_grupa, F_pilomat_grupa);
  Application.CreateForm(TF_Pilomat_listy, F_Pilomat_listy);
  Application.CreateForm(TF_Pilomat_detali, F_Pilomat_detali);
  Application.CreateForm(TF_Furnitura, F_Furnitura);
  Application.CreateForm(TF_Gotov_prod, F_Gotov_prod);
  Application.CreateForm(TF_Gotov_prod_edit, F_Gotov_prod_edit);
  Application.CreateForm(TF_Zakaz_edit, F_Zakaz_edit);
  Application.CreateForm(TF_Akt_raspil_jurnal, F_Akt_raspil_jurnal);
  Application.CreateForm(TF_Akt_raspil_edit, F_Akt_raspil_edit);
  Application.CreateForm(TF_Akt_vip_rabot_jurnal, F_Akt_vip_rabot_jurnal);
  Application.CreateForm(TF_Akt_vip_rab_edit, F_Akt_vip_rab_edit);
  Application.CreateForm(TF_Prihod_detali_jurnal, F_Prihod_detali_jurnal);
  Application.CreateForm(TF_Prihod_detali_edit, F_Prihod_detali_edit);
  Application.CreateForm(TF_Zakaz_select, F_Zakaz_select);
  Application.CreateForm(TF_Akt_vip_prod_jurnal, F_Akt_vip_prod_jurnal);
  Application.CreateForm(TF_Akt_vip_prod_edit, F_Akt_vip_prod_edit);
  Application.CreateForm(TF_Prihod_listy_jurnal, F_Prihod_listy_jurnal);
  Application.CreateForm(TF_Prihod_listy_edit, F_Prihod_listy_edit);
  Application.CreateForm(TF_Furnitura_edit, F_Furnitura_edit);
  Application.CreateForm(TF_furnitura_grupa_vidrabot, F_furnitura_grupa_vidrabot);
  Application.CreateForm(TF_Vidy_rabot_stoimosti_edit, F_Vidy_rabot_stoimosti_edit);
  Application.CreateForm(TF_Prihod_furnitura_jurnal, F_Prihod_furnitura_jurnal);
  Application.CreateForm(TF_prihod_furnitura_edit, F_prihod_furnitura_edit);
  Application.CreateForm(TF_Peremeschenie_jurnal, F_Peremeschenie_jurnal);
  Application.CreateForm(TF_Peremeschenie_edit, F_Peremeschenie_edit);
  Application.CreateForm(TF_About, F_About);
  Application.CreateForm(TF_Spisanie_jurnal, F_Spisanie_jurnal);
  Application.CreateForm(TF_Spisanie_edit, F_Spisanie_edit);
  Application.CreateForm(TF_Reports, F_Reports);
  Application.CreateForm(TF_Print_Forms, F_Print_Forms);
  Application.CreateForm(TF_Akt_vip_prod_rashod_furnitura, F_Akt_vip_prod_rashod_furnitura);
  Application.CreateForm(TF_Gotov_prod_categories, F_Gotov_prod_categories);
  Application.CreateForm(TF_Contragenty, F_Contragenty);
  Application.CreateForm(TF_Prodaja_jurnal, F_Prodaja_jurnal);
  Application.CreateForm(TF_Prodaja_edit, F_Prodaja_edit);
  Application.CreateForm(TF_Zakaz_Gotovprod_Ostatok, F_Zakaz_Gotovprod_Ostatok);
  Application.CreateForm(TF_Constanty, F_Constanty);
  Application.CreateForm(TF_Peremeschenie_jurnal_print, F_Peremeschenie_jurnal_print);
  Application.CreateForm(TF_Spisanie_jurnal_print, F_Spisanie_jurnal_print);
  Application.CreateForm(TF_Print_Forms_2, F_Print_Forms_2);
  Application.CreateForm(TF_Statyi_Rashoda, F_Statyi_Rashoda);
  Application.CreateForm(TF_Statyi_Rashoda_edit, F_Statyi_Rashoda_edit);
  Application.CreateForm(TF_Gotov_prod_normy, F_Gotov_prod_normy);
  Application.CreateForm(TF_Signs_Management, F_Signs_Management);
  Application.CreateForm(TF_Bank_Jurnal, F_Bank_Jurnal);
  Application.CreateForm(TF_Bank_prihod, F_Bank_prihod);
  Application.CreateForm(TF_Statyi_Dohoda, F_Statyi_Dohoda);
  Application.CreateForm(TF_Statyi_Dohoda_edit, F_Statyi_Dohoda_edit);
  Application.CreateForm(TF_Bank_rashod, F_Bank_rashod);
  Application.CreateForm(TF_Cassa_Jurnal, F_Cassa_Jurnal);
  Application.CreateForm(TF_Cassa_prihod, F_Cassa_prihod);
  Application.CreateForm(TF_Cassa_rashod, F_Cassa_rashod);
  Application.CreateForm(TF_Remont_jurnal, F_Remont_jurnal);
  Application.CreateForm(TF_Remont_edit, F_Remont_edit);
  Application.CreateForm(TF_Lavoare_list, F_Lavoare_list);
  Application.CreateForm(TF_Lavoare_edit, F_Lavoare_edit);
  Application.CreateForm(TF_Calc_sebestoimosti, F_Calc_sebestoimosti);
  Application.CreateForm(TF_Revizii_jurnal, F_Revizii_jurnal);
  Application.CreateForm(TF_Revizia_edit, F_Revizia_edit);
  Application.Run;
end.
