unit ufrmTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.MaskUtils,
  System.JSON, System.UITypes, uServiceSearchPostalCode, uCustomerDTO, uRegisterService,
  uServiceSendEmail, Vcl.ExtDlgs, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;

type
  TfrmRegistration = class(TForm)
    edtName: TLabeledEdit;
    edtIDNumber: TLabeledEdit;
    edtSocialSecurity: TLabeledEdit;
    edtPhoneNumber: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtPostalCode: TLabeledEdit;
    edtAddress: TLabeledEdit;
    edtNumberOfAddress: TLabeledEdit;
    edtComplement: TLabeledEdit;
    edtNeighborhood: TLabeledEdit;
    edtCity: TLabeledEdit;
    edtState: TLabeledEdit;
    edtCountry: TLabeledEdit;
    btnSearchPostalCode: TBitBtn;
    grbxSendEmail: TGroupBox;
    edtSMTPProvider: TLabeledEdit;
    edtUsername: TLabeledEdit;
    edtPassword: TLabeledEdit;
    edtFromAddress: TLabeledEdit;
    btnSendMail: TBitBtn;
    edtRegister: TBitBtn;
    edtCancel: TBitBtn;
    btnAttachment: TBitBtn;
    memAttachment: TMemo;
    OpenDialog: TOpenDialog;
    lbFileName: TLinkLabel;
    procedure btnSearchPostalCodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPostalCodeExit(Sender: TObject);
    procedure btnSendMailClick(Sender: TObject);
    procedure edtCancelClick(Sender: TObject);
    procedure edtRegisterClick(Sender: TObject);
    procedure btnAttachmentClick(Sender: TObject);
  protected
    { Protected declarations }
    FCustomerDTO: TCustomerDTO;
    FFullAddress: TJSONObject;
  public
    { Public declarations }
    procedure ClearRegistration;
    procedure SetRegister(var ACustomerDTO: TCustomerDTO);
    procedure SetFullAddress;
    procedure CleanFullAddress;
    procedure ValidateRequirements;
  end;

const
  FPath = 'C:\Cadastro\';

var
  frmRegistration: TfrmRegistration;

implementation

{$R *.dfm}

procedure TfrmRegistration.btnAttachmentClick(Sender: TObject);
var
  XMLDoc: TXMLDocument;
begin
  if OpenDialog.Execute then
  begin
    lbFileName.Caption       := OpenDialog.FileName;
    XMLDoc                   := TXMLDocument.Create(OpenDialog.FileName);
    memAttachment.Lines.Text := XMLDoc.XML.Text;
  end;
end;

procedure TfrmRegistration.btnSearchPostalCodeClick(Sender: TObject);
var
  ServiceSearchPostalCode: TServiceSearchPostalCode;
begin
  if Length(Trim(edtPostalCode.Text)) = 8 then
  begin
    ServiceSearchPostalCode := TServiceSearchPostalCode.Create;

    try
      try
        FFullAddress := ServiceSearchPostalCode.Search(StrToIntDef(edtPostalCode.Text, 0));

        if Assigned(FFullAddress) then
        begin
          SetFullAddress;
          edtNumberOfAddress.SetFocus;
        end
        else
          MessageDlg('CEP não encontrado.', TMsgDlgType.mtInformation, [mbOk], 0);
      except
        on E: Exception do
          MessageDlg(E.Message, TMsgDlgType.mtError, [mbOk], 0);
      end;
    finally
      ServiceSearchPostalCode.Free;
    end;
  end
  else
    MessageDlg('Informe o CEP por gentileza.', TMsgDlgType.mtInformation, [mbOk], 0);
end;

procedure TfrmRegistration.btnSendMailClick(Sender: TObject);
var
  ServiceSendEmail: TServiceSendEmail;
begin
  ServiceSendEmail := TServiceSendEmail.Create;

  try
    try
      ValidateRequirements;

      ServiceSendEmail.CustomerDTO := FCustomerDTO;
      ServiceSendEmail.SendEmail(Trim(edtSMTPProvider.Text), Trim(edtUsername.Text),
                                 Trim(edtPassword.Text), Trim(edtFromAddress.Text),
                                 Trim(OpenDialog.FileName));
      MessageDlg('E-mail enviado!', TMsgDlgType.mtInformation, [mbOk], 0);
      ClearRegistration;
    except
      on E: Exception do
        MessageDlg(E.Message, TMsgDlgType.mtError, [mbOk], 0);
    end;
  finally
    ServiceSendEmail.Free;
  end;
end;

procedure TfrmRegistration.CleanFullAddress;
begin
  edtAddress.Clear;
  edtNumberOfAddress.Clear;
  edtComplement.Clear;
  edtNeighborhood.Clear;
  edtCity.Clear;
  edtState.Clear;
  edtCountry.Clear;
end;

procedure TfrmRegistration.ClearRegistration;
begin
  edtName.Clear;
  edtIDNumber.Clear;
  edtSocialSecurity.Clear;
  edtPhoneNumber.Clear;
  edtEmail.Clear;
  edtPostalCode.Clear;

  CleanFullAddress;
  edtName.SetFocus;
end;

procedure TfrmRegistration.edtCancelClick(Sender: TObject);
begin
  ClearRegistration;
end;

procedure TfrmRegistration.edtPostalCodeExit(Sender: TObject);
begin
  if (Trim(edtPostalCode.Text) <> EmptyStr) and (Length(edtPostalCode.Text) = 8) then
    btnSearchPostalCode.Click;
end;

procedure TfrmRegistration.edtRegisterClick(Sender: TObject);
begin
  try
    if (Length(Trim(edtSocialSecurity.Text)) = 11) then
    begin
      SetRegister(FCustomerDTO);

      if TRegisterService.DoRegister(FCustomerDTO, FPath) then
      begin
        MessageDlg('Cadastro realizado com sucesso!', TMsgDlgType.mtConfirmation, [mbOk], 0);
        OpenDialog.FileName := FPath + Trim(edtSocialSecurity.Text) + '.xml';
      end;
    end
    else
      MessageDlg('Informe o CPF por gentileza.', TMsgDlgType.mtWarning, [mbOk], 0);
  except
    on E: Exception do
      MessageDlg(E.Message, TMsgDlgType.mtError, [mbOk], 0);
  end;
end;

procedure TfrmRegistration.FormCreate(Sender: TObject);
begin
  FCustomerDTO := TCustomerDTO.Create;
  FFullAddress := TJSONObject.Create;

  if not DirectoryExists(FPath) then
    CreateDir(FPath);
end;

procedure TfrmRegistration.SetRegister(var ACustomerDTO: TCustomerDTO);
begin
  ACustomerDTO.Clear;

  ACustomerDTO.Name                     := Trim(edtName.Text);
  ACustomerDTO.IDNumber                 := StrToIntDef(edtIDNumber.Text, 0);
  ACustomerDTO.SocialSecurity           := Trim(edtSocialSecurity.Text);
  ACustomerDTO.PhoneNumber              := StrToIntDef(edtPhoneNumber.Text, 0);
  ACustomerDTO.Email                    := Trim(edtEmail.Text);
  ACustomerDTO.Location.PostalCode      := StrToIntDef(edtPostalCode.Text, 0);
  ACustomerDTO.Location.Address         := Trim(edtAddress.Text);
  ACustomerDTO.Location.NumberOfAddress := Trim(edtNumberOfAddress.Text);
  ACustomerDTO.Location.Complement      := Trim(edtComplement.Text);
  ACustomerDTO.Location.Neighborhood    := Trim(edtNeighborhood.Text);
  ACustomerDTO.Location.City            := Trim(edtCity.Text);
  ACustomerDTO.Location.State           := Trim(edtState.Text);
  ACustomerDTO.Location.Country         := Trim(edtCountry.Text);
end;

procedure TfrmRegistration.SetFullAddress;
begin
  CleanFullAddress;

  edtAddress.Text      := FFullAddress.Get('logradouro').JsonValue.Value;
  edtComplement.Text   := FFullAddress.Get('complemento').JsonValue.Value;
  edtNeighborhood.Text := FFullAddress.Get('bairro').JsonValue.Value;
  edtCity.Text         := FFullAddress.Get('localidade').JsonValue.Value;
  edtState.Text        := FFullAddress.Get('uf').JsonValue.Value;
  edtCountry.Text      := 'Brasil';
end;

procedure TfrmRegistration.ValidateRequirements;
begin
  if Trim(edtSMTPProvider.Text) = EmptyStr then
    raise Exception.Create('Informe o provedor por gentileza.');

  if Trim(edtUsername.Text) = EmptyStr then
    raise Exception.Create('Informe o usuário por gentileza.');

  if Trim(edtPassword.Text) = EmptyStr then
    raise Exception.Create('Informe a senha por gentileza.');

  if Trim(edtFromAddress.Text) = EmptyStr then
    raise Exception.Create('Informe o destinatário por gentileza.');
end;

end.
