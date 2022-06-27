program prTest;

uses
  Vcl.Forms,
  ufrmTest in 'ufrmTest.pas' {frmRegistration},
  uServiceSearchPostalCode in 'uServiceSearchPostalCode.pas',
  uServiceSendEmail in 'uServiceSendEmail.pas',
  uCustomerDTO in 'uCustomerDTO.pas',
  uLocationDTO in 'uLocationDTO.pas',
  uRegisterService in 'uRegisterService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRegistration, frmRegistration);
  Application.Run;
end.
