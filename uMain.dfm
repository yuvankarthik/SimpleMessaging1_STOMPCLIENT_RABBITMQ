object fmmain: Tfmmain
  Left = 0
  Top = 0
  Caption = 'StompClient-Simple Messaging'
  ClientHeight = 285
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    790
    285)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 213
    Width = 62
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Queue Name'
    ExplicitTop = 195
  end
  object Label2: TLabel
    Left = 527
    Top = 213
    Width = 62
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Queue Name'
    ExplicitTop = 225
  end
  object QueueEdit: TEdit
    Left = 152
    Top = 232
    Width = 201
    Height = 37
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    Text = '/queue/alarm'
    ExplicitTop = 145
  end
  object SendMessageButton: TButton
    Left = 8
    Top = 213
    Width = 138
    Height = 56
    Anchors = [akLeft, akBottom]
    Caption = 'Send Message'
    TabOrder = 1
    OnClick = SendMessageButtonClick
    ExplicitTop = 195
  end
  object QueueMemo: TMemo
    Left = 8
    Top = 8
    Width = 345
    Height = 97
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object queueeditrecv: TEdit
    Left = 527
    Top = 240
    Width = 129
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 3
    Text = '/queue/alarm'
    ExplicitTop = 252
  end
  object SubscribeButton: TButton
    Left = 368
    Top = 213
    Width = 129
    Height = 56
    Anchors = [akLeft, akBottom]
    Caption = '1 - Subscribe '
    TabOrder = 4
    OnClick = SubscribeButtonClick
    ExplicitTop = 225
  end
  object MessageMemo: TMemo
    Left = 368
    Top = 8
    Width = 422
    Height = 164
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 5
    ExplicitHeight = 97
  end
  object logmemo: TMemo
    Left = 8
    Top = 110
    Width = 345
    Height = 97
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
  end
end
