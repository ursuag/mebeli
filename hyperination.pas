unit hyperination;

interface

uses SysUtils;

type
  TWordBreaks = String;

const
  gl: set of Char = ['À', 'Å', '¨', 'È', 'Î', 'Ó', 'Û', 'İ', 'Ş', 'ß'];
  r_sogl: set of Char = ['Ú', 'Ü'];
  spaces: set of Char = [' ', '.', ',', '-'];

function BreakWord(s: String): TWordBreaks;

implementation

function BreakWord(s: String): TWordBreaks;
var
  i: Integer;
  ins: integer;
  CanBreak: Boolean;
begin
  Result := '';
  s := AnsiUpperCase(s);
  Result:=s;
  ins:=1;
  if Length(s) >= 4 then
  begin
    i := 2;
    repeat
      CanBreak := False;
      if s[i] in gl then
      begin
        if (s[i + 1] in gl) or (s[i + 2] in gl) then
          CanBreak := True;
      end
      else
       if (s[i] in r_sogl) and (not(s[i+2] in spaces)) then
       begin
          CanBreak := True;
       end
      else
      begin
        if not (s[i + 1] in gl) and not (s[i + 1] in r_sogl) and (s[i + 2] in gl) then
          CanBreak := True;
      end;
      if CanBreak then
        begin
//          Result := Result + Chr(i);
          Insert('-',Result,i+ins);
          Inc(ins);
        end;
      Inc(i);
    until i > Length(s) - 2;
  end;
end;


end.
