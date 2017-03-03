unit about;

interface

uses Windows, SysUtils, Forms, ExtCtrls, StdCtrls,
     Controls, Graphics, Classes, Registry, Dialogs;

type
  TF_About = class(TForm)
    OKButton: TButton;
    Panel1: TPanel;
    Version: TLabel;
    Copyright: TLabel;
    Label1: TLabel;
    L_OS: TLabel;
    Bevel1: TBevel;
    TotMem: TLabel;
    Label4: TLabel;
    CPU1: TLabel;
    PhysMem: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Free: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ProgramIcon: TImage;
    Label10: TLabel;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_About: TF_About;
      Reg: TRegistry;
implementation


{$R *.dfm}

procedure TF_About.FormActivate(Sender: TObject);
var     os : string;
      build: string;
         MS: TMemoryStatus;
     SysInf: TSystemInfo;
begin
  build:='';
  IF (Win32MajorVersion >= 5) and (Win32Platform = VER_PLATFORM_WIN32_NT) Then os:='Windows 2000';
  IF (Win32MajorVersion >= 5) and (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32BuildNumber=2600) Then
    os:='Windows XP';

  IF (Win32MajorVersion >= 5) and (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32BuildNumber>2600) Then
    os:='Windows 7 or Higher';

  IF (Win32MajorVersion <= 4) and (Win32Platform = VER_PLATFORM_WIN32_NT) Then os:='Windows NT';
  IF (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and (Win32MajorVersion >= 4) and (Win32MinorVersion >= 90) then os:='Windows ME';
  IF (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and (Win32MajorVersion >= 4) and (Win32MinorVersion in [10..89]) then
      begin
        os:='Windows 98';
        build:='.'+IntToStr(Win32BuildNumber and $0000FFFF);
      end;
  IF (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and (Win32MajorVersion < 4) then
      begin
        os:='Windows 95';
        build:='.'+IntToStr(Win32BuildNumber and $0000FFFF);
      end;
  L_OS.Caption:=os+' (Build '+IntToStr(Win32MajorVersion)+'.'+IntToStr(Win32MinorVersion)+build+')';
    MS.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MS);
  PhysMem.Caption:=FormatFloat('#,###" KB"', MS.dwTotalPhys div 1024);
  Free.Caption:=FormatFloat('#,###" KB"', ms.dwAvailPhys / 1024);
  Label2.caption:=FormatFloat('#,###" KB"', MS.dwAvailPageFile div 1024);
  //CPU Type************
  Reg:=TRegistry.Create;
  GetSystemInfo(SysInf);
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKeyReadOnly('\Hardware\Description\System\CentralProcessor\0');
  CPU1.Caption:=Reg.ReadString('ProcessorNameString')+', level '+IntToStr(sysinf.wProcessorLevel);
end;//Proc

procedure TF_About.Label9Click(Sender: TObject);
var s:string;
begin
  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CLASSES_ROOT;
  Reg.OpenKeyReadOnly('\mailto\shell\open\command');
  s:=Reg.ReadString('');
  Delete(s,Pos('%',s),2);
  s:=s+'mailto:ursuag@yahoo.com';
//  WinExec (Pchar(s),SW_SHOWDEFAULT);
end;//proc

procedure TF_About.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Reg.Free;
end;//proc

END.

