unit uServiceSendEmail;

interface

uses System.SysUtils, System.Classes, IdMessage, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdAttachment, uCustomerDTO;

type
  TServiceSendEmail = class
  private
    FIdSMTP: TIdSMTP;
    FIdMessage: TIdMessage;
    FIdSSL: TIdSSLIOHandlerSocketOpenSSL;
    FCustomerDTO: TCustomerDTO;
    function  GetCustomerDTO: TCustomerDTO;
    procedure SetCustomerDTO(ACustomerDTO: TCustomerDTO);
  public
    constructor Create;
    destructor  Destroy; override;
    procedure SendEmail(AHost, AUsername, APassword, AFrom, AAttachment: string);
    property CustomerDTO: TCustomerDTO read GetCustomerDTO write SetCustomerDTO;
  end;

implementation

{ TServiceSendEmail }

constructor TServiceSendEmail.Create;
begin
  FIdSMTP      := TIdSMTP.Create(nil);
  FIdMessage   := TIdMessage.Create(nil);
  FIdSSL       := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FCustomerDTO := TCustomerDTO.Create;
end;

destructor TServiceSendEmail.Destroy;
begin
  FIdSMTP.Free;
  FIdMessage.Free;
  FIdSSL.Free;
  FCustomerDTO.Free;

  inherited;
end;

function TServiceSendEmail.GetCustomerDTO: TCustomerDTO;
begin
  Result := FCustomerDTO;
end;

procedure TServiceSendEmail.SendEmail(AHost, AUsername, APassword, AFrom,
  AAttachment: string);
begin
  try
    FIdSMTP.IOHandler := FIdSSL;
    FIdSMTP.Host      := AHost;
    FIdSMTP.Username  := AUsername;
    FIdSMTP.Password  := APassword;

    FIdMessage.From.Address := AFrom;
    FIdMessage.Subject      := 'Dados cadastrados ' + DateTimeToStr(Now);

    FIdMessage.Body.Add('Nome: ' + FCustomerDTO.Name);
    FIdMessage.Body.Add('Identidade: ' + IntToStr(FCustomerDTO.IDNumber));
    FIdMessage.Body.Add('CPF: ' + FCustomerDTO.SocialSecurity);
    FIdMessage.Body.Add('Telefone: ' + IntToStr(FCustomerDTO.PhoneNumber));
    FIdMessage.Body.Add('E-mail: ' + FCustomerDTO.Email);
    FIdMessage.Body.Add('Endereço: ' + FCustomerDTO.Location.FullAddress);

    //Falta incluir o anexo

    FIdSMTP.Connect;
    FIdSMTP.Send(FIdMessage);
  except
    on E: Exception do
    begin
      E.Message := 'Erro ao enviar e-mail: ' + E.Message;
      raise;
    end;
  end;
end;

procedure TServiceSendEmail.SetCustomerDTO(ACustomerDTO: TCustomerDTO);
begin
  FCustomerDTO := ACustomerDTO;
end;

end.
