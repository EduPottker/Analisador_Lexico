program AnalisadorLexico;

uses
  Vcl.Forms,
  uAnalisadorLexico in 'uAnalisadorLexico.pas' {fAnalisadorLexico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfAnalisadorLexico, fAnalisadorLexico);
  Application.Run;
end.
