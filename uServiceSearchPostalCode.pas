unit uServiceSearchPostalCode;

interface

uses System.Classes, System.SysUtils, System.JSON, REST.Types, REST.Client,
     Data.Bind.Components, Data.Bind.ObjectScope;

type
  TServiceSearchPostalCode = class
  private
    FPostalCode: Integer;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FRESTClient: TRESTClient;
  protected
    procedure PrepareRequest;
  public
    constructor Create;
    destructor Destroy; override;
    function Search(APostalCode: Integer): TJSONObject;
  end;


implementation

{ TServiceSearchPostalCode }

constructor TServiceSearchPostalCode.Create;
begin
  FRESTRequest  := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);
  FRESTClient   := TRESTClient.Create(nil)
end;

destructor TServiceSearchPostalCode.Destroy;
begin
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);
  FreeAndNil(FRESTClient);

  inherited;
end;

procedure TServiceSearchPostalCode.PrepareRequest;
begin
  FRESTClient.BaseURL   := 'https://viacep.com.br/ws/' + IntToStr(FPostalCode) + '/json';
  FRESTRequest.Response := FRESTResponse;
  FRESTRequest.Client   := FRESTClient;
end;

function TServiceSearchPostalCode.Search(APostalCode: Integer): TJSONObject;
begin
  FPostalCode := APostalCode;
  PrepareRequest;

  FRESTRequest.Execute;

  Result := (FRESTResponse.JSONValue as TJSONObject);

  if Pos('erro', LowerCase(Result.ToJSON)) > 0 then
    Result := nil;
end;

end.
