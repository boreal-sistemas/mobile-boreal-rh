unit uframeDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Ani, FMX.Controls.Presentation, FMX.Layouts, FMX.Edit;

type
  Tmsg = class(TFrame)
    ltMensagem: TLayout;
    rcFundo: TRectangle;
    rcMenssagem: TRectangle;
    msgTexto: TLabel;
    msgTitulo: TLabel;
    Line11: TLine;
    ltBotoes: TLayout;
    Rectangle6: TRectangle;
    rcSim: TRectangle;
    labSim: TLabel;
    rcNao: TRectangle;
    labNao: TLabel;
    rcOk: TRectangle;
    Label22: TLabel;
    img: TImage;
    rcIndicadorMensagem: TRectangle;
    imgAlerta: TImage;
    imgErro: TImage;
    imgExcluir: TImage;
    imgInformacao: TImage;
    imgPergunta: TImage;
    imgSucesso: TImage;
    edtImput: TEdit;
    recSeguranca: TRectangle;
    labSeguranca: TLabel;
    ScrollBox: TScrollBox;
    procedure ApertaBotaoSim(Sender: TObject);
    procedure ApertaBotaoNao(Sender: TObject);
    procedure ApertaBotaoOK(Sender: TObject);
    procedure rcSimMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure rcSimMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure rcSimMouseLeave(Sender: TObject);
    procedure rcOkMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure rcOkMouseLeave(Sender: TObject);
    procedure rcOkMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure rcNaoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure rcNaoMouseLeave(Sender: TObject);
    procedure rcNaoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure recSegurancaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure recSegurancaMouseLeave(Sender: TObject);
    procedure recSegurancaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    ProcYes, ProcNo: TProc;
  public
    { Public declarations }
    procedure Pergunta(titulo,texto:String; aProcYes: TProc) Overload;
    procedure Pergunta(titulo,texto:String; aProcYes, aProcNO: TProc) Overload;
    procedure PerguntaComImput(titulo,texto:String; aProcYes: TProc);
    procedure AdvertenciaOpcao(titulo,texto:String; aProcYes: TProc);
    procedure AdvertenciaOpcaoComImput(titulo,texto:String; aProcYes: TProc);
    procedure AdvertenciaOpcaoTPComImput(titulo,texto:String; aProcYes: TProc);
    procedure AdvertenciaCiente(titulo,texto:String; aProcYes: TProc);
    procedure Aviso(titulo,texto:String);
    procedure Sucesso(titulo,texto:String);
    procedure fecharMensagem;
  end;

implementation

Uses uFmrDM;

{$R *.fmx}

{ TfrmMensagem }

procedure Tmsg.AdvertenciaCiente(titulo, texto: String; aProcYes: TProc);
begin
  Self.Visible := False;
  Self.Visible:= true;
  ProcYes:= aProcYes;
  rcSim.OnClick:= ApertaBotaoSim;
  rcNao.OnClick:= ApertaBotaoOk;
  ltMensagem.Visible        := True;
  ltMensagem.BringToFront;
  msgTitulo.Text            := titulo;
  msgTexto.Text             := texto;
  rcSim.Visible             := False;
  rcNao.Visible             := false;
  rcOk.Visible              := False;
  img.Bitmap            := imgAlerta.Bitmap;
  rcSim.Visible         := True;
  rcSim.Stroke.Color    := $ff352566;
  rcNao.Stroke.Color    := $ff352566;
  rcNao.Visible         := False;
  edtImput.Visible          := False;
  rcIndicadorMensagem.Fill.Color := $FF940707;
  recSeguranca.Visible:= False;
  labSim.Text:= 'Ciente';
  rcSim.Margins.Left:= 0;
  rcSim.Margins.Right:= 0;
  rcSim.Margins.Top:= 0;
  rcSim.Margins.Bottom:= 0;
  rcSim.Align:= TAlignLayout(11); //Center;
  msgTexto.RecalcSize;
end;

procedure Tmsg.AdvertenciaOpcao(titulo, texto: String; aProcYes: TProc);
begin
  Self.Visible := False;
  Self.Visible:= true;
  ProcYes:= aProcYes;
  rcSim.OnClick:= ApertaBotaoSim;
  rcNao.OnClick:= ApertaBotaoOk;
  ltMensagem.Visible        := True;
  ltMensagem.BringToFront;
  msgTitulo.Text            := titulo;
  msgTexto.Text             := texto;
  rcSim.Visible             := False;
  rcNao.Visible             := false;
  rcOk.Visible              := False;
  img.Bitmap            := imgAlerta.Bitmap;
  rcSim.Visible         := True;
  rcSim.Stroke.Color    := $ff352566;
  rcNao.Stroke.Color    := $ff352566;
  rcNao.Visible         := True;
  rcIndicadorMensagem.Fill.Color := $FF940707;
  recSeguranca.Visible:= False;
  edtImput.Visible          := False;
  labSim.Text:= 'Ciente';
  labNao.Text:= 'Aguardar';
  msgTexto.RecalcSize;
end;

procedure Tmsg.AdvertenciaOpcaoComImput(titulo, texto: String; aProcYes: TProc);
begin
  Self.Visible := False;
  Self.Visible:= true;
  ProcYes:= aProcYes;
  rcSim.OnClick:= ApertaBotaoSim;
  rcNao.OnClick:= ApertaBotaoOk;
  ltMensagem.Visible        := True;
  ltMensagem.BringToFront;
  msgTitulo.Text            := titulo;
  msgTexto.Text             := texto;
  rcSim.Visible             := False;
  rcNao.Visible             := false;
  rcOk.Visible              := False;
  img.Bitmap            := imgAlerta.Bitmap;
  rcSim.Visible         := True;
  rcSim.Stroke.Color    := $ff352566;
  rcNao.Stroke.Color    := $ff352566;
  rcNao.Visible         := True;
  rcIndicadorMensagem.Fill.Color := $FF940707;
  recSeguranca.OnClick:= ApertaBotaoSim;
  edtImput.Visible      := True;
  recSeguranca.Visible:= (dmoAPP.usuBancoDeDados = 'grupog10') or (dmoAPP.usuBancoDeDados = 'WebDesenvolvimento');
  edtImput.Text:= '';
  labSim.Text:= 'Ciente';
  labNao.Text:= 'Voltar';
  msgTexto.RecalcSize;
end;

procedure Tmsg.AdvertenciaOpcaoTPComImput(titulo, texto: String;
  aProcYes: TProc);
begin
  Self.Visible := False;
  Self.Visible:= true;
  ProcYes:= aProcYes;
  rcSim.OnClick:= ApertaBotaoSim;
  rcNao.OnClick:= ApertaBotaoOk;
  ltMensagem.Visible        := True;
  ltMensagem.BringToFront;
  msgTitulo.Text            := titulo;
  msgTexto.Text             := texto;
  rcSim.Visible             := False;
  rcNao.Visible             := false;
  rcOk.Visible              := False;
  img.Bitmap            := imgAlerta.Bitmap;
  rcSim.Visible         := True;
  rcSim.Stroke.Color    := $ff352566;
  rcNao.Stroke.Color    := $ff352566;
  rcNao.Visible         := False;
  rcIndicadorMensagem.Fill.Color := $FF940707;
  recSeguranca.OnClick:= ApertaBotaoSim;
  edtImput.Visible      := True;
  recSeguranca.Visible:= (dmoAPP.usuBancoDeDados = 'grupog10') or (dmoAPP.usuBancoDeDados = 'WebDesenvolvimento');
  edtImput.Text:= '';
  labSim.Text:= 'Ciente';
  labNao.Text:= 'Voltar';
  msgTexto.RecalcSize;
end;
procedure Tmsg.ApertaBotaoNao(Sender: TObject);
begin
  ProcNo;
  fecharMensagem;
end;

procedure Tmsg.ApertaBotaoOK(Sender: TObject);
begin
  fecharMensagem;
end;

procedure Tmsg.ApertaBotaoSim(Sender: TObject);
begin
  fecharMensagem;
  ProcYes;
end;

procedure Tmsg.Aviso(titulo, texto: String);
begin
  Self.Visible := False;
  rcOK.OnClick:= ApertaBotaoOk;
  Self.Visible := true;
  ltMensagem.Visible        := True;
  ltMensagem.BringToFront;
  msgTitulo.Text            := titulo;
  msgTexto.Text             := texto;
  rcSim.Visible             := False;
  rcNao.Visible             := false;
  rcOk.Visible              := False;
  img.Bitmap          := imgInformacao.Bitmap;
  rcOk.Visible        := True;
  rcOk.Stroke.Color   := $ff352566;
  rcIndicadorMensagem.Fill.Color := $ff352566;
  edtImput.Visible          := False;
  recSeguranca.Visible:= False;
  msgTexto.RecalcSize;
end;

procedure Tmsg.fecharMensagem;
begin
  Self.Visible:= False;
end;

procedure Tmsg.Pergunta(titulo, texto: String; aProcYes, aProcNO: TProc);
begin
  Self.Visible := False;
  Self.Visible:= true;
  ProcYes:= aProcYes;
  ProcNo:= aProcNo;
  rcSim.OnClick:= ApertaBotaoSim;
  rcNao.OnClick:= ApertaBotaoNao;
  ltMensagem.Visible        := True;
  ltMensagem.BringToFront;
  msgTitulo.Text            := titulo;
  msgTexto.Text             := texto;
  rcSim.Visible             := False;
  rcNao.Visible             := false;
  rcOk.Visible              := False;
  edtImput.Visible          := False;
  img.Bitmap            := imgPergunta.Bitmap;
  rcSim.Visible         := True;
  rcSim.Stroke.Color    := $ff352566;
  rcNao.Stroke.Color    := $ff352566;
  rcNao.Visible         := True;
  rcIndicadorMensagem.Fill.Color := $ff352566;
  recSeguranca.Visible:= False;
  labSim.Text:= 'Sim';
  labNao.Text:= 'Não';
  msgTexto.RecalcSize;
end;

procedure Tmsg.PerguntaComImput(titulo, texto: String; aProcYes: TProc);
begin
  Self.Visible := False;
  Self.Visible:= true;
  ProcYes:= aProcYes;
  rcSim.OnClick:= ApertaBotaoSim;
  rcNao.OnClick:= ApertaBotaoOk;
  ltMensagem.Visible        := True;
  ltMensagem.BringToFront;
  msgTitulo.Text            := titulo;
  msgTexto.Text             := texto;
  rcSim.Visible             := False;
  rcNao.Visible             := false;
  rcOk.Visible              := False;
  img.Bitmap            := imgPergunta.Bitmap;
  rcSim.Visible         := True;
  rcSim.Stroke.Color    := $ff352566;
  rcNao.Stroke.Color    := $ff352566;
  rcNao.Visible         := True;
  edtImput.Visible      := True;
  edtImput.Text:= '';
  rcIndicadorMensagem.Fill.Color := $ff352566;
  recSeguranca.Visible:= False;
  labSim.Text:= 'Sim';
  labNao.Text:= 'Não';
  msgTexto.RecalcSize;
end;

procedure Tmsg.Pergunta(titulo,texto:String; aProcYes: TProc);
begin
  Self.Visible := False;
  Self.Visible:= true;
  ProcYes:= aProcYes;
  rcSim.OnClick:= ApertaBotaoSim;
  rcNao.OnClick:= ApertaBotaoOk;
  ltMensagem.Visible        := True;
  ltMensagem.BringToFront;
  msgTitulo.Text            := titulo;
  msgTexto.Text             := texto;
  rcSim.Visible             := False;
  rcNao.Visible             := false;
  rcOk.Visible              := False;
  img.Bitmap            := imgPergunta.Bitmap;
  rcSim.Visible         := True;
  rcSim.Stroke.Color    := $ff352566;
  rcNao.Stroke.Color    := $ff352566;
  rcNao.Visible         := True;
  edtImput.Visible      := False;
  rcIndicadorMensagem.Fill.Color := $ff352566;
  recSeguranca.Visible:= False;
  labSim.Text:= 'Sim';
  labNao.Text:= 'Não';
  msgTexto.RecalcSize;
end;

procedure Tmsg.rcNaoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TButton(Sender).Opacity:= 0.5;
end;

procedure Tmsg.rcNaoMouseLeave(Sender: TObject);
begin
  TButton(Sender).Opacity:= 1;
end;

procedure Tmsg.rcNaoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TButton(Sender).Opacity:= 1;
end;

procedure Tmsg.rcOkMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TButton(Sender).Opacity:= 0.5;
end;

procedure Tmsg.rcOkMouseLeave(Sender: TObject);
begin
  TButton(Sender).Opacity:= 1;
end;

procedure Tmsg.rcOkMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TButton(Sender).Opacity:= 1;
end;

procedure Tmsg.rcSimMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TButton(Sender).Opacity:= 0.5;
end;

procedure Tmsg.rcSimMouseLeave(Sender: TObject);
begin
  TButton(Sender).Opacity:= 1;
end;

procedure Tmsg.rcSimMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TButton(Sender).Opacity:= 1;
end;

procedure Tmsg.recSegurancaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TButton(Sender).Opacity:= 0.5;
end;

procedure Tmsg.recSegurancaMouseLeave(Sender: TObject);
begin
  TButton(Sender).Opacity:= 1;
end;

procedure Tmsg.recSegurancaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TButton(Sender).Opacity:= 1;
end;

procedure Tmsg.Sucesso(titulo, texto: String);
begin
  Self.Visible := False;
  rcOK.OnClick:= ApertaBotaoOk;
  Self.Visible := true;
  ltMensagem.Visible        := True;
  ltMensagem.BringToFront;
  msgTitulo.Text            := titulo;
  msgTexto.Text             := texto;
  rcSim.Visible             := False;
  rcNao.Visible             := false;
  rcOk.Visible              := False;
  img.Bitmap          := imgSucesso.Bitmap;
  rcOk.Visible        := True;
  rcOk.Stroke.Color   := $ff352566;
  rcIndicadorMensagem.Fill.Color := $ff352566;
  recSeguranca.Visible:= False;
  edtImput.Visible          := False;
  msgTexto.RecalcSize;
end;

end.

