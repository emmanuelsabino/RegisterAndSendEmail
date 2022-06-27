object frmRegistration: TfrmRegistration
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Dados do Cadastro'
  ClientHeight = 419
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edtName: TLabeledEdit
    Left = 8
    Top = 32
    Width = 249
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 0
  end
  object edtIDNumber: TLabeledEdit
    Left = 8
    Top = 72
    Width = 145
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Identidade'
    TabOrder = 1
  end
  object edtSocialSecurity: TLabeledEdit
    Left = 8
    Top = 112
    Width = 145
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF'
    MaxLength = 11
    NumbersOnly = True
    TabOrder = 2
  end
  object edtPhoneNumber: TLabeledEdit
    Left = 8
    Top = 152
    Width = 145
    Height = 21
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'Telefone'
    MaxLength = 11
    NumbersOnly = True
    TabOrder = 3
  end
  object edtEmail: TLabeledEdit
    Left = 8
    Top = 192
    Width = 201
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'E-mail'
    TabOrder = 4
  end
  object edtPostalCode: TLabeledEdit
    Left = 272
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'CEP'
    MaxLength = 8
    NumbersOnly = True
    TabOrder = 5
    OnExit = edtPostalCodeExit
  end
  object edtAddress: TLabeledEdit
    Left = 272
    Top = 72
    Width = 338
    Height = 21
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'Logradouro'
    TabOrder = 7
  end
  object edtNumberOfAddress: TLabeledEdit
    Left = 616
    Top = 72
    Width = 70
    Height = 21
    EditLabel.Width = 12
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#176
    TabOrder = 8
  end
  object edtComplement: TLabeledEdit
    Left = 272
    Top = 112
    Width = 121
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Complemento'
    TabOrder = 9
  end
  object edtNeighborhood: TLabeledEdit
    Left = 399
    Top = 112
    Width = 211
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Bairro'
    TabOrder = 10
  end
  object edtCity: TLabeledEdit
    Left = 272
    Top = 152
    Width = 185
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade'
    TabOrder = 11
  end
  object edtState: TLabeledEdit
    Left = 463
    Top = 152
    Width = 50
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Estado'
    MaxLength = 2
    TabOrder = 12
  end
  object edtCountry: TLabeledEdit
    Left = 519
    Top = 152
    Width = 91
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'Pa'#237's'
    TabOrder = 13
  end
  object btnSearchPostalCode: TBitBtn
    Left = 399
    Top = 30
    Width = 26
    Height = 25
    Caption = '&'
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btnSearchPostalCodeClick
  end
  object grbxSendEmail: TGroupBox
    Left = 8
    Top = 231
    Width = 678
    Height = 180
    Caption = 'Enviar e-mail'
    TabOrder = 16
    object edtSMTPProvider: TLabeledEdit
      Left = 16
      Top = 40
      Width = 289
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Provedor'
      TabOrder = 0
    end
    object edtUsername: TLabeledEdit
      Left = 16
      Top = 80
      Width = 170
      Height = 21
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Usu'#225'rio'
      TabOrder = 1
    end
    object edtPassword: TLabeledEdit
      Left = 192
      Top = 80
      Width = 113
      Height = 21
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Senha'
      PasswordChar = '*'
      TabOrder = 2
    end
    object edtFromAddress: TLabeledEdit
      Left = 16
      Top = 120
      Width = 169
      Height = 21
      EditLabel.Width = 58
      EditLabel.Height = 13
      EditLabel.Caption = 'Destinat'#225'rio'
      TabOrder = 3
    end
    object btnSendMail: TBitBtn
      Left = 328
      Top = 69
      Width = 75
      Height = 25
      Caption = '&Enviar'
      Kind = bkYes
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btnSendMailClick
    end
    object btnAttachment: TBitBtn
      Left = 328
      Top = 38
      Width = 75
      Height = 25
      Caption = 'Anexar'
      ModalResult = 4
      NumGlyphs = 2
      TabOrder = 4
      OnClick = btnAttachmentClick
    end
    object memAttachment: TMemo
      Left = 417
      Top = 11
      Width = 258
      Height = 163
      Enabled = False
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 6
    end
    object lbFileName: TLinkLabel
      Left = 16
      Top = 153
      Width = 4
      Height = 4
      TabOrder = 7
    end
  end
  object edtRegister: TBitBtn
    Left = 350
    Top = 190
    Width = 98
    Height = 25
    Caption = 'Cadastrar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 14
    OnClick = edtRegisterClick
  end
  object edtCancel: TBitBtn
    Left = 454
    Top = 190
    Width = 91
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 15
    OnClick = edtCancelClick
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '.xml'
    InitialDir = 'C:\Cadastro'
    Left = 357
    Top = 343
  end
end
