unit uAnalisadorLexico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Buttons, CommCtrl, Vcl.Grids;

type
  TfAnalisadorLexico = class(TForm)
    SplitView: TSplitView;
    lv_Tokens: TListView;
    btn_Limpar: TButton;
    lbl_AddTokens: TLabel;
    edt_AddTokens: TEdit;
    btn_AddToken: TBitBtn;
    strg_Analisador: TStringGrid;
    lbl_QtdLetras: TLabel;
    edt_Validador: TEdit;
    lbl_VldTokens: TLabel;
    lbl_Obs: TLabel;
    pnl_Status: TPanel;
    btn_Remover: TButton;
    procedure lv_TokensAdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure edt_AddTokensChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_AddTokensKeyPress(Sender: TObject; var Key: Char);
    procedure edt_AddTokensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_AddTokenClick(Sender: TObject);
    procedure btn_LimparClick(Sender: TObject);
    procedure edt_ValidadorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ValidadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btn_RemoverClick(Sender: TObject);
    procedure lv_TokensKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strg_AnalisadorDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strg_AnalisadorSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    slTokens: TStringList;
    sTemp: string;
    ContinuarValidando: boolean;
    procedure AdicionarTokens(Token: string);
  public
    { Public declarations }
  end;

var
  fAnalisadorLexico: TfAnalisadorLexico;

implementation

{$R *.dfm}

procedure TfAnalisadorLexico.AdicionarTokens(Token: string);
var
  Linha, Coluna, Tamanho: integer;
  sTemp: string;
begin
  Tamanho := Length(Token); 

  for Linha := 1 to Tamanho do
  begin
    for Coluna := 1 to strg_Analisador.ColCount do
    begin
      // Encontra Coluna do caractere
      if (strg_Analisador.Cells[Coluna, 0] = Token[Linha]) then
      begin
        strg_Analisador.Cells[Coluna, Linha] := IntToStr(Linha);

        if (Linha = Tamanho) then
        begin
//          sTemp := copy(strg_Analisador.Cells[0, Linha],
//                        Length(strg_Analisador.Cells[0, Linha]), 1);
//
//          if stemp <> '*' then
//            strg_Analisador.Cells[0, Linha] := strg_Analisador.Cells[0, Linha] + '*';
        end;
      end;
    end;
  end;
end;

procedure TfAnalisadorLexico.btn_AddTokenClick(Sender: TObject);
var
  Item: TListItem;
begin
  try
    if edt_AddTokens.Text <> '' then
    begin
      if slTokens.IndexOf(edt_AddTokens.Text) >= 0 then
      begin
        ShowMessage('Token: "' + edt_AddTokens.Text + '" já adicionada na lista!');
        Exit;
      end;
      slTokens.Add(edt_AddTokens.Text);

      Item         := lv_Tokens.Items.Add;
      Item.Caption := edt_AddTokens.Text;
      AdicionarTokens(edt_AddTokens.Text);

      btn_Limpar.Enabled    := lv_Tokens.GetCount > 0;
      btn_Remover.Enabled   := lv_Tokens.GetCount > 0;
      edt_Validador.Enabled := lv_Tokens.GetCount > 0;
    end
    else
      MessageDlg('Insira um valor no campo!', mtWarning, mbOKCancel, 0);
  finally
    edt_AddTokens.Text := '';
    edt_AddTokens.SetFocus;
  end;
end;

procedure TfAnalisadorLexico.btn_LimparClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir todos os Tokens?', mtInformation, mbYesNo, 0) = mrYes then
  begin
    slTokens.Clear;
    lv_Tokens.Clear;
    edt_AddTokens.Clear;
    edt_Validador.Clear;
    btn_Limpar.Enabled    := False;
    btn_Remover.Enabled   := False;
    edt_Validador.Enabled := False;
    FAnalisadorLexico.FormActivate(Sender);
    edt_AddTokens.SetFocus;
  end;
end;

procedure TfAnalisadorLexico.btn_RemoverClick(Sender: TObject);
var
  i: Integer;
begin
  if lv_Tokens.ItemIndex >= 0 then
  begin
    if MessageDlg('Deseja excluir a palavra "' + lv_Tokens.Selected.Caption + 
                  '" da lista de Tokens?', mtInformation, mbYesNo, 0) = mrYes then
    begin
      slTokens.Delete(slTokens.IndexOf(lv_Tokens.Selected.Caption));
      lv_Tokens.DeleteSelected;

      FAnalisadorLexico.FormActivate(Sender);

      if slTokens.Count > 0 then
      begin
        for i := 0 to slTokens.Count - 1 do
          AdicionarTokens(slTokens[i]);

        lv_Tokens.ItemIndex := 0;
      end
      else
      begin
        btn_Limpar.Enabled    := False;
        btn_Remover.Enabled   := False;
        edt_Validador.Enabled := False;
        edt_AddTokens.SetFocus;
      end;
    end;
  end
  else
    ShowMessage('Selecione um registro para remover');
end;

procedure TfAnalisadorLexico.edt_AddTokensChange(Sender: TObject);
var
  iTam : Integer;
begin
  iTam := 50;
  iTam := iTam - Length(edt_AddTokens.Text);
  lbl_QtdLetras.Caption := iTam.ToString + '/50';
end;

procedure TfAnalisadorLexico.edt_AddTokensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    btn_AddTokenClick(Sender);
end;

procedure TfAnalisadorLexico.edt_AddTokensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in['a'..'z','A'..'Z',#8]) then
    Key := #0;
end;

procedure TfAnalisadorLexico.edt_ValidadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Ord(Key) = 32 { Espaço } Then
  begin
    if trim(edt_Validador.Text) <> EmptyStr then
    begin
      if ({(sTemp = '*') and} (ContinuarValidando)) and
         (slTokens.IndexOf(edt_Validador.Text) >= 0) then
      begin
        MessageDlg('"' + Trim(edt_Validador.Text) + '"  ' + 'é válida!',
                   mtInformation, mbOKCancel, 0);
        edt_Validador.Clear;

        strg_analisador.Row := 1;
        strg_Analisador.Col := 1;
      end
      else
      begin
        MessageDlg('"' + Trim(edt_Validador.Text) + '"  ' + 'é inválida!',
                   mtError, mbOKCancel, 0);
        edt_Validador.Clear;

        strg_analisador.Row := 1;
        strg_Analisador.Col := 1;
      end;
    end
    else
    begin
      MessageDlg('Informe um valor no campo!', mtWarning, mbOKCancel, 0);
      edt_Validador.Clear;
    end;
  end;
end;

procedure TfAnalisadorLexico.edt_ValidadorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Token, Posicao, i, j: integer;
begin
  Posicao  := 1;
  ContinuarValidando := True;
  Token := Length(edt_Validador.Text);

  if Trim(edt_Validador.Text) = '' then
  begin
    pnl_Status.Color   := clWhite;
    pnl_Status.Caption := 'Aguardando...';
  end;

  for i := 1 to Token do
  begin
    for j := 1 to 27 do
    begin
      if (strg_analisador.Cells[j, 0] = edt_Validador.Text[i]) and (ContinuarValidando) then
      begin

        if (strg_analisador.Cells[j, Posicao] <> '') and
           (Pos(edt_Validador.Text, slTokens.Text) > 0) then
        begin
          pnl_Status.Color   := clGreen;
          pnl_Status.Caption := 'Válida';
//          sTemp := copy(strg_analisador.Cells[0, Posicao],
//                        Length(strg_analisador.Cells[0, Posicao]), 1);

          Posicao := StrToInt(strg_analisador.Cells[j, Posicao]) + 1;
        end
        else
        begin
          pnl_Status.Color   := clRed;
          pnl_Status.Caption := 'Inválida';
          ContinuarValidando := False;
        end;

        if Posicao <> 1 then
        begin
          strg_analisador.Row := Posicao - 1;
          strg_Analisador.Col := j;
        end;
      end;
    end;
  end;
end;

procedure TfAnalisadorLexico.FormActivate(Sender: TObject);
var
  i, j, NumLinhas, NumColunas: integer;
begin
  pnl_Status.Color   := clWhite;
  pnl_Status.Caption := 'Aguardando...';
  NumLinhas  := 51;
  NumColunas := 26;
  strg_Analisador.RowCount := NumLinhas;
  strg_Analisador.ColCount := NumColunas + 1;

  // insere o cabeçalho nas colunas {a,b,c,...,z}
  strg_Analisador.Cells[0, 0] := '   ' + Chr(948);
  for i := 1 to (NumColunas) do
  begin
    for j := 0 to NumLinhas + 1 do
      strg_Analisador.Cells[i, j] := '';

    strg_Analisador.Cells[i, 0] := Chr(Ord('a') - 1 + I);
  end;

  // insere o numero das linhas
  for i := 1 to NumLinhas do
    strg_Analisador.Cells[0, i] := 'q' + IntToStr(i);
end;

procedure TfAnalisadorLexico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  slTokens.Free;
  Action := caFree;
end;

procedure TfAnalisadorLexico.FormShow(Sender: TObject);
begin
  slTokens := TStringList.Create;
  edt_AddTokens.SetFocus;
end;

procedure TfAnalisadorLexico.lv_TokensAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if Odd(Item.Index) then
    lv_Tokens.Canvas.Brush.Color := clWindow
  else
    lv_Tokens.Canvas.Brush.Color := clBtnFace;
end;

procedure TfAnalisadorLexico.lv_TokensKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [82, 114]) and (Shift = [ssCtrl]) then
    btn_RemoverClick(Sender);
end;

procedure TfAnalisadorLexico.strg_AnalisadorDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  // Pinta a célula normalmente
  strg_Analisador.Canvas.Brush.Color := strg_Analisador.Color;
  strg_Analisador.Canvas.FillRect(Rect);
  strg_Analisador.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, strg_Analisador.Cells[ACol, ARow]);

  // Verifica se a célula está selecionada
  if (ACol > 0) and (ARow > 0) and
     ((ACol = strg_Analisador.Col) or (ARow = strg_Analisador.Row)) then
  begin
    // Pinta todas as linhas da célula selecionada
    if (ACol = strg_Analisador.Col) and (ARow = strg_Analisador.Row) then
      strg_Analisador.Canvas.Brush.Color := RGB(104, 118, 222)
    else
      strg_Analisador.Canvas.Brush.Color := RGB(171, 176, 219);
    
    Rect.Left := Rect.Left - 4;
    strg_Analisador.Canvas.FillRect(Rect);
    strg_Analisador.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, strg_Analisador.Cells[ACol, ARow]);
  end;
end;

procedure TfAnalisadorLexico.strg_AnalisadorSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  // Redesenha a célula anterior para desfazer a pintura
  strg_Analisador.Invalidate;
end;

end.
