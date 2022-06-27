unit uLocationDTO;

interface

uses System.SysUtils, System.Classes;

type
  TLocationDTO = class
  private
    FPostalCode: Integer;
    FAddress: string;
    FNumberOfAddress: string;
    FComplement: string;
    FNeighborhood: string;
    FCity: string;
    FState: string;
    FCountry: string;
    function  GetPostalCode: Integer;
    function  GetAddress: string;
    function  GetNumberOfAddress: string;
    function  GetComplement: string;
    function  GetNeighborhood: string;
    function  GetCity: string;
    function  GetState: string;
    function  GetCountry: string;
    function  GetFullAddress: string;
    procedure SetPostalCode(APostalCode: Integer);
    procedure SetAddress(AAddress: string);
    procedure SetNumberOfAddress(ANumberOfAddress: string);
    procedure SetComplement(AComplement: string);
    procedure SetNeighborhoood(ANeighborhood: string);
    procedure SetCity(ACity: string);
    procedure SetState(AState: string);
    procedure SetCountry(ACountry: string);
  public
    constructor Create;
    destructor  Destroy; override;
    procedure   Clear;
    property PostalCode:      Integer read GetPostalCode      write SetPostalCode;
    property Address:         string  read GetAddress         write SetAddress;
    property NumberOfAddress: string  read GetNumberOfAddress write SetNumberOfAddress;
    property Complement:      string  read GetComplement      write SetComplement;
    property Neighborhood:    string  read GetNeighborhood    write SetNeighborhoood;
    property City:            string  read GetCity            write SetCity;
    property State:           string  read GetState           write SetState;
    property Country:         string  read GetCountry         write SetCountry;
    property FullAddress:     string  read GetFullAddress;
  end;

implementation

{ TLocationDTO }

procedure TLocationDTO.Clear;
begin
  FPostalCode      := 0;
  FAddress         := EmptyStr;
  FNumberOfAddress := EmptyStr;
  FComplement      := EmptyStr;
  FNeighborhood    := EmptyStr;
  FCity            := EmptyStr;
  FState           := EmptyStr;
  FCountry         := EmptyStr;
end;

constructor TLocationDTO.Create;
begin
  inherited Create;

  Clear;
end;

destructor TLocationDTO.Destroy;
begin
  {}
  inherited;
end;

function TLocationDTO.GetAddress: string;
begin
  Result := FAddress;
end;

function TLocationDTO.GetCity: string;
begin
  Result := FCity;
end;

function TLocationDTO.GetComplement: string;
begin
  Result := FComplement;
end;

function TLocationDTO.GetCountry: string;
begin
  Result := FCountry;
end;

function TLocationDTO.GetFullAddress: string;
begin
  Result := 'Endereço: ' + FAddress + ', ' + FNumberOfAddress + ', ' +
            FNeighborhood + ', ' + FCity + ', ' + FState + ', ' + FCountry +
            '. ' + IntToStr(FPostalCode) + '.';
end;

function TLocationDTO.GetNeighborhood: string;
begin
  Result := FNeighborhood;
end;

function TLocationDTO.GetNumberOfAddress: string;
begin
  Result := FNumberOfAddress;
end;

function TLocationDTO.GetPostalCode: Integer;
begin
  Result := FPostalCode;
end;

function TLocationDTO.GetState: string;
begin
  Result := FState;
end;

procedure TLocationDTO.SetAddress(AAddress: string);
begin
  FAddress := AAddress;
end;

procedure TLocationDTO.SetCity(ACity: string);
begin
  FCity := ACity;
end;

procedure TLocationDTO.SetComplement(AComplement: string);
begin
  FComplement := AComplement;
end;

procedure TLocationDTO.SetCountry(ACountry: string);
begin
  FCountry := ACountry;
end;

procedure TLocationDTO.SetNeighborhoood(ANeighborhood: string);
begin
  FNeighborhood := ANeighborhood;
end;

procedure TLocationDTO.SetNumberOfAddress(ANumberOfAddress: string);
begin
  FNumberOfAddress := ANumberOfAddress;
end;

procedure TLocationDTO.SetPostalCode(APostalCode: Integer);
begin
  FPostalCode := APostalCode;
end;

procedure TLocationDTO.SetState(AState: string);
begin
  FState := AState;
end;

end.
