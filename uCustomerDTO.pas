unit uCustomerDTO;

interface

uses System.SysUtils, System.Classes, uLocationDTO;

type
  TCustomerDTO = class
  private
    FName: string;
    FIDNumber: Integer;
    FSocialSecurity: string;
    FPhoneNumber: Integer;
    FEmail: string;
    FLocation: TLocationDTO;
    function  GetName: string;
    function  GetIDNumber: Integer;
    function  GetSocialSecurity: string;
    function  GetPhoneNumber: Integer;
    function  GetEmail: string;
    function  GetLocation: TLocationDTO;
    procedure SetName(AName: string);
    procedure SetIDNumber(AIDNumber: Integer);
    procedure SetSocialSecurity(ASocialSecurity: string);
    procedure SetPhoneNumber(APhoneNumber: Integer);
    procedure SetEmail(AEmail: string);
    procedure SetLocation(ALocation: TLocationDTO);
  public
    constructor Create;
    destructor  Destroy; override;
    procedure   Clear;
    property Name:           string       read GetName           write SetName;
    property IDNumber:       Integer      read GetIDNumber       write SetIDNumber;
    property SocialSecurity: string       read GetSocialSecurity write SetSocialSecurity;
    property PhoneNumber:    Integer      read GetPhoneNumber    write SetPhoneNumber;
    property Email:          string       read GetEmail          write SetEmail;
    property Location:       TLocationDTO read GetLocation       write SetLocation;
  end;

implementation

{ TCustomerDTO }

procedure TCustomerDTO.Clear;
begin
  FName           := EmptyStr;
  FIDNumber       := 0;
  FSocialSecurity := EmptyStr;
  FPhoneNumber    := 0;
  FEmail          := EmptyStr;
end;

constructor TCustomerDTO.Create;
begin
  Clear;

  FLocation := TLocationDTO.Create;
  FLocation.Clear;
end;

destructor TCustomerDTO.Destroy;
begin
  FLocation.Free;
  inherited;
end;

function TCustomerDTO.GetEmail: string;
begin
  Result := FEmail;
end;

function TCustomerDTO.GetIDNumber: Integer;
begin
  Result := FIDNumber;
end;

function TCustomerDTO.GetLocation: TLocationDTO;
begin
  Result := FLocation;
end;

function TCustomerDTO.GetName: string;
begin
  Result := FName;
end;

function TCustomerDTO.GetPhoneNumber: Integer;
begin
  Result := FPhoneNumber;
end;

function TCustomerDTO.GetSocialSecurity: string;
begin
  Result := FSocialSecurity;
end;

procedure TCustomerDTO.SetEmail(AEmail: string);
begin
  FEmail := AEmail;
end;

procedure TCustomerDTO.SetIDNumber(AIDNumber: Integer);
begin
  FIDNumber := AIDNumber;
end;

procedure TCustomerDTO.SetLocation(ALocation: TLocationDTO);
begin
  FLocation := ALocation;
end;

procedure TCustomerDTO.SetName(AName: string);
begin
  FName := AName;
end;

procedure TCustomerDTO.SetPhoneNumber(APhoneNumber: Integer);
begin
  FPhoneNumber := APhoneNumber;
end;

procedure TCustomerDTO.SetSocialSecurity(ASocialSecurity: string);
begin
  FSocialSecurity := ASocialSecurity;
end;

end.
