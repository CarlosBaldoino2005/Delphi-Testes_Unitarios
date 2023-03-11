unit Unit2;

interface
uses
  DUnitX.TestFramework,uPessoa;

type

  [TestFixture]
  TMyTestObject = class(TObject)
  private
    FPessoa : TPessoa;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TesteTratarCPF;

    [Test]
    [TestCase('CaseCPF','123.123.123.12,12312312312')]
    [TestCase('CaseCNPJ','123.123.123.0001.12,123123123000112')]
    procedure TratarCPF(AValue:String;AResult : String);

    [Test]
    procedure ValidaNome;

    [Test]
    procedure ValidarCampos;
  end;

implementation

procedure TMyTestObject.Setup;
begin
  FPessoa := TPessoa.Create;
end;

procedure TMyTestObject.TearDown;
begin
  FPessoa.Free;
end;


procedure TMyTestObject.TesteTratarCPF;
var Resultado : String;
begin
  Resultado := FPessoa.TratarCPF('123,123,123-12');
  Assert.IsTrue(Resultado = '12312312312','Pessoa.TratarCPF Retornou erro:'+Resultado);
end;

procedure TMyTestObject.TratarCPF(AValue, AResult: String);
var Resultado : String;
begin
  Resultado := FPessoa.TratarCPF(AValue);
//  Assert.IsTrue(Resultado = AResult,'Pessoa.TratarCPF Retornou erro:'+Resultado);
  Assert.AreEqual(Resultado,AResult);
end;

procedure TMyTestObject.ValidaNome;
begin
  FPessoa.Nome := 'Carlos';
  Assert.IsNotEmpty(FPessoa.Nome,'TPessoa.Nome nao pode ser vazio');
end;

procedure TMyTestObject.ValidarCampos;
begin
  FPessoa.Nome := '';
  Assert.WillRaise(FPessoa.ValidarCampos,nil,'TPessoa.ValidarCampos');
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.
