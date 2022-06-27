unit uRegisterService;

interface

uses System.SysUtils, System.Classes, uCustomerDTO, XML.XMLDoc, XML.XMLIntf;

type
  TRegisterService = class
  public
    class function DoRegister(ACustomerDTO: TCustomerDTO; APath: string): Boolean;
  end;

implementation


{ TRegisterService }

class function TRegisterService.DoRegister(ACustomerDTO: TCustomerDTO;
  APath: string): Boolean;
var
  DocXML: TXMLDocument;
  NodeXML: IXMLNode;

  procedure SetDataToXML;
  begin
    DocXML.Active := True;
    NodeXML       := DocXML.AddChild('cadastro');

    NodeXML.ChildValues['nome']        := ACustomerDTO.Name;
    NodeXML.ChildValues['identidade']  := ACustomerDTO.IDNumber;
    NodeXML.ChildValues['cpf']         := ACustomerDTO.SocialSecurity;
    NodeXML.ChildValues['telefone']    := ACustomerDTO.PhoneNumber;
    NodeXML.ChildValues['email']       := ACustomerDTO.Email;
    NodeXML.ChildValues['cep']         := ACustomerDTO.Location.PostalCode;
    NodeXML.ChildValues['logradouro']  := ACustomerDTO.Location.Address;
    NodeXML.ChildValues['numero']      := ACustomerDTO.Location.NumberOfAddress;
    NodeXML.ChildValues['complemento'] := ACustomerDTO.Location.Complement;
    NodeXML.ChildValues['bairro']      := ACustomerDTO.Location.Neighborhood;
    NodeXML.ChildValues['cidade']      := ACustomerDTO.Location.City;
    NodeXML.ChildValues['estado']      := ACustomerDTO.Location.State;
    NodeXML.ChildValues['pais']        := ACustomerDTO.Location.Country;
  end;
begin
  DocXML := TXMLDocument.Create(nil);

  try
    try
      SetDataToXML;
      DocXML.SaveToFile(APath + ACustomerDTO.SocialSecurity + '.xml');
      Result := True;
    except
      on E: Exception do
      begin
        E.Message := 'Erro ao cadastrar: ' + E.Message;
        raise;
      end;
    end;
  finally
    DocXML.Free;
  end;
end;

end.
