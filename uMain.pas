unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls,StompClient,ThreadReceiver;

type
  Tfmmain = class(TForm)
    Label1: TLabel;
    QueueEdit: TEdit;
    SendMessageButton: TButton;
    QueueMemo: TMemo;
    Label2: TLabel;
    queueeditrecv: TEdit;
    SubscribeButton: TButton;
    MessageMemo: TMemo;
    logmemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure SendMessageButtonClick(Sender: TObject);
    procedure SubscribeButtonClick(Sender: TObject);
  private
    StompClient_Pub: IStompClient;
    StompClient_Sub: IStompClient;

    ThReceiver: TThreadReceiver;

    procedure Send;
    procedure Receive;
    procedure BeforeSendFrame(AFrame: IStompFrame);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmmain: Tfmmain;

implementation

{$R *.dfm}


Procedure Tfmmain.Send;
begin
  StompClient_Pub.connect;
  try
    try
    StompClient_Pub.Send(QueueEdit.Text,QueueMemo.Text);
    Except on E:Exception do
    begin
      raise Exception.Create('Error in send '+E.Message);
    end;
    end;
  finally
    StompClient_Pub.Disconnect;
  end;
end;



procedure Tfmmain.SendMessageButtonClick(Sender: TObject);
begin
  send;
end;

procedure Tfmmain.SubscribeButtonClick(Sender: TObject);
begin
  Receive;
end;

Procedure Tfmmain.Receive;
begin
  if not StompClient_Sub.Connected then
    raise Exception.Create('StompClient not connected');

  if queueeditrecv.Text = '' then
    raise Exception.Create('Specify queue name');

  StompClient_Sub.Subscribe(queueeditrecv.Text,amAuto);
  if not ThReceiver.Started then
    ThReceiver.Start;
end;


procedure Tfmmain.BeforeSendFrame(AFrame: IStompFrame);
begin
  LogMemo.Lines.Add(StringReplace(AFrame.Output, #10, sLineBreak, [rfReplaceAll]));
end;


procedure Tfmmain.FormCreate(Sender: TObject);
begin
  StompClient_Pub := StompUtils.StompClient;
  StompClient_Sub := StompUtils.StompClient;

  StompClient_Pub.SetOnBeforeSendFrame(BeforeSendFrame);
  StompClient_Sub.SetOnBeforeSendFrame(BeforeSendFrame);

  StompClient_Sub.Connect;
  ThReceiver := TThreadReceiver.Create(True);
  ThReceiver.StompClient := StompClient_Sub;
end;

end.
