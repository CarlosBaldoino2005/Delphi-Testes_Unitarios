unit uPessoa;

interface

type
  TPessoa = class
  private
    FNome: String;
    procedure SetNome(const Value: String);
    public
      procedure ValidarCampos;
    published
      function TratarCPF(AValue : String):String;
      property Nome : String read FNome write SetNome;
  end;

implementation

uses
  System.SysUtils;

{ TPessoa }

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

function TPessoa.TratarCPF(AValue: String): String;
var I : Integer;
begin
  result := '';
  for I := 1 to length(AValue) do begin
    if AValue[i] in ['0','1','2','3','4','5','6','7','8','9'] then
      result := result + AValue[i];
  end;
end;

procedure TPessoa.ValidarCampos;
begin
  if FNome = '' then
    raise Exception.Create('Nome nao pode ser Vazio');
end;

end.
