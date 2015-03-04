object frmMain: TfrmMain
  Left = 353
  Top = 171
  Width = 931
  Height = 646
  Caption = 'Neato Control'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  PixelsPerInch = 144
  TextHeight = 20
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 909
    Height = 591
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    object TabSheet3: TTabSheet
      Caption = 'Options'
      ImageIndex = 2
      object lblLang: TLabel
        Left = 465
        Top = 414
        Width = 76
        Height = 20
        Caption = 'Language:'
      end
      object barFuelPercent: TGauge
        Left = 760
        Top = 5
        Width = 128
        Height = 26
        Color = clBtnFace
        ForeColor = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Progress = 0
      end
      object lbRobotTime2: TLabel
        Left = 469
        Top = 5
        Width = 133
        Height = 29
        Align = alCustom
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = 'Robot Time:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object lbRobotTime: TLabel
        Left = 608
        Top = 6
        Width = 90
        Height = 29
        Caption = '00:00:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GroupBox2: TGroupBox
        Left = 758
        Top = 402
        Width = 127
        Height = 123
        Caption = 'Wall Follower:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        object Button2: TButton
          Left = 6
          Top = 29
          Width = 116
          Height = 39
          Caption = 'Enable'
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 6
          Top = 74
          Width = 116
          Height = 38
          Caption = 'Disable'
          TabOrder = 1
          OnClick = Button3Click
        end
      end
      object GroupBox4: TGroupBox
        Left = 455
        Top = 35
        Width = 433
        Height = 357
        Caption = 'Schedule && Time'
        TabOrder = 1
        object lbSchState: TLabel
          Left = 271
          Top = 169
          Width = 149
          Height = 33
          Alignment = taCenter
          AutoSize = False
          Caption = '???'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 271
          Top = 148
          Width = 71
          Height = 20
          Caption = 'Schedule:'
        end
        object listSchedule: TValueListEditor
          Left = 12
          Top = 37
          Width = 248
          Height = 260
          DefaultRowHeight = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Strings.Strings = (
            'Sun='
            'Mon='
            'Tue='
            'Wed='
            'Thu='
            'Fri='
            'Sat=')
          TabOrder = 0
          TitleCaptions.Strings = (
            'Day'
            'Time')
          ColWidths = (
            91
            151)
        end
        object btnSetSchedule: TButton
          Left = 271
          Top = 86
          Width = 154
          Height = 39
          Action = actSetSchedule
          TabOrder = 1
        end
        object btnGetSchedule: TButton
          Left = 271
          Top = 37
          Width = 154
          Height = 38
          Action = actGetSchedule
          TabOrder = 2
        end
        object btnTimeUpdate: TButton
          Left = 12
          Top = 308
          Width = 413
          Height = 38
          Action = actSetCurrentTime
          TabOrder = 3
          WordWrap = True
        end
        object btnSchEn: TButton
          Left = 271
          Top = 214
          Width = 154
          Height = 38
          Caption = 'Enable'
          Enabled = False
          TabOrder = 4
          OnClick = btnSchEnClick
        end
        object btnSchDis: TButton
          Left = 271
          Top = 258
          Width = 154
          Height = 39
          Caption = 'Disable'
          Enabled = False
          TabOrder = 5
          OnClick = btnSchDisClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 12
        Top = 12
        Width = 433
        Height = 211
        Caption = 'Connect'
        TabOrder = 2
        object lbComPortN: TLabel
          Left = 25
          Top = 172
          Width = 117
          Height = 20
          Caption = 'COM Port name:'
          Enabled = False
        end
        object textComPortN: TComboBox
          Left = 215
          Top = 165
          Width = 196
          Height = 28
          Enabled = False
          ItemHeight = 20
          TabOrder = 0
          Text = 'COM1'
          Items.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4')
        end
        object Button4: TButton
          Left = 12
          Top = 25
          Width = 199
          Height = 50
          Action = actConnect
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object Button5: TButton
          Left = 222
          Top = 25
          Width = 198
          Height = 50
          Action = actDisconnect
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object chAutoDetectPort: TCheckBox
          Left = 12
          Top = 86
          Width = 405
          Height = 26
          Caption = 'Auto detect port number'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = chAutoDetectPortClick
        end
        object chAutoConnect: TCheckBox
          Left = 12
          Top = 123
          Width = 405
          Height = 26
          Caption = 'Auto connect on plug'
          Enabled = False
          TabOrder = 4
        end
      end
      object GroupBox5: TGroupBox
        Left = 12
        Top = 234
        Width = 433
        Height = 272
        Caption = 'Version:'
        TabOrder = 3
        object textVersion: TMemo
          Left = 2
          Top = 22
          Width = 429
          Height = 248
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object cbLanguage: TComboBox
        Left = 463
        Top = 440
        Width = 259
        Height = 28
        ItemHeight = 20
        TabOrder = 4
        OnChange = cbLanguageChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Sensors'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1086
        Height = 63
        Align = alTop
        TabOrder = 0
        Visible = False
        object chSensorAuto: TCheckBox
          Left = 26
          Top = 20
          Width = 111
          Height = 26
          Caption = 'Auto load'
          Checked = True
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 0
          OnClick = chSensorAutoClick
        end
      end
      object listSensors: TValueListEditor
        Left = 0
        Top = 63
        Width = 1086
        Height = 559
        Align = alClient
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect, goThumbTracking]
        PopupMenu = PopupMenu1
        Strings.Strings = (
          '')
        TabOrder = 1
        TitleCaptions.Strings = (
          'Sensor'
          'Value')
        OnDrawCell = listSensorsDrawCell
        ColWidths = (
          181
          519)
      end
    end
    object tabScan: TTabSheet
      Caption = 'Scanner'
      object Image1: TImage
        Left = 0
        Top = 75
        Width = 901
        Height = 481
        Align = alClient
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 901
        Height = 75
        Align = alTop
        TabOrder = 0
        object paintSpectre: TPaintBox
          Left = 1
          Top = 48
          Width = 899
          Height = 26
          Align = alBottom
          OnPaint = paintSpectrePaint
        end
        object chkScanLDS: TCheckBox
          Left = 18
          Top = 12
          Width = 267
          Height = 26
          Action = actScanLDS
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object chRemoteControl: TCheckBox
          Left = 314
          Top = 12
          Width = 475
          Height = 26
          Action = actRemoteControl
          TabOrder = 1
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Recharge'
      ImageIndex = 3
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 901
        Height = 556
        Align = alClient
        TabOrder = 0
        DesignSize = (
          897
          552)
        object Label2: TLabel
          Left = 2
          Top = 171
          Width = 67
          Height = 20
          AutoSize = False
          Caption = 'Step 1:'
        end
        object Label3: TLabel
          Left = 2
          Top = 231
          Width = 67
          Height = 20
          AutoSize = False
          Caption = 'Step 2:'
        end
        object Label4: TLabel
          Left = 2
          Top = 300
          Width = 67
          Height = 20
          AutoSize = False
          Caption = 'Step 3:'
        end
        object Label5: TLabel
          Left = 2
          Top = 360
          Width = 67
          Height = 20
          AutoSize = False
          Caption = 'Step 4:'
        end
        object Label6: TLabel
          Left = 2
          Top = 451
          Width = 67
          Height = 20
          AutoSize = False
          Caption = 'Step 5:'
        end
        object Memo2: TMemo
          Left = 0
          Top = 3
          Width = 1282
          Height = 154
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'CAUTION:'
            
              'All actions are performed by you at your own risk, at your peril' +
              '.'
            
              'If you do not want to risk DO NOT use this mode - just buy new b' +
              'atteries.'
            
              'Author of this program does not guarantee anything. This method ' +
              'does not '
            'guarantee a successful outcome.'
            
              'The buildup of the batteries. Need if your robot is removed 10-2' +
              '0 minutes and '
            'discharged.'
            
              'To restore akkumy consistently follow the steps instructions if ' +
              'there is a button in '
            'step click it.'
            'You can try to repeat twice to strengthen the effect.'
            
              'If, after connecting in the window appeared red rectangle labele' +
              'd "Batt V <12 V" '
            'stop "swinging" and immediately '
            'put the robot on charging.')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Memo1: TMemo
          Left = 71
          Top = 160
          Width = 1211
          Height = 42
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'Turn on the robot for cleaning and wait until discharge.')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object Memo3: TMemo
          Left = 291
          Top = 211
          Width = 991
          Height = 51
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'Click this button, then turn on the '
            'cleaning robot, wait until discharge. (~ '
            '10.5 minutes)')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object btnSet100PercentBattery: TButton
          Left = 71
          Top = 211
          Width = 211
          Height = 51
          Action = actChrSet100PercentBattery
          TabOrder = 3
          WordWrap = True
        end
        object btnEnableBrush: TButton
          Left = 71
          Top = 340
          Width = 211
          Height = 62
          Action = actChrEnableBrush
          TabOrder = 4
          WordWrap = True
        end
        object btnEnableVaccum: TButton
          Left = 71
          Top = 271
          Width = 211
          Height = 60
          Action = actChrEnableVaccum
          TabOrder = 5
          WordWrap = True
        end
        object Memo5: TMemo
          Left = 291
          Top = 340
          Width = 991
          Height = 62
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'Turn on the robot, and as quickly as '
            'possible, click "Connect."'
            'Press - turns on the motor brushes. Wait '
            'until the robot switches itself off. '
            '(~ 30 minutes)')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 6
        end
        object Memo4: TMemo
          Left = 291
          Top = 271
          Width = 991
          Height = 60
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'Turn on the robot, and as quickly as '
            'possible, click "Connect."'
            'Then press the button - turns the vacuum '
            'cleaner motor. Wait until the '
            'robot switches itself off. (~ 30 minutes)')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 7
        end
        object lbWarnLowVoltage: TPanel
          Left = 91
          Top = 231
          Width = 171
          Height = 151
          Caption = 'Batt V < 12 V'
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          Visible = False
          OnMouseUp = lbWarnLowVoltageMouseUp
        end
        object Memo6: TMemo
          Left = 71
          Top = 411
          Width = 1211
          Height = 120
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'Connect the robot to the charge.'
            
              'Be sure to make "Service" -> "New Battery". Wait for a full char' +
              'ge.'
            'Make cleaning a few times before you judge the result.')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 9
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Commands'
      ImageIndex = 4
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 901
        Height = 556
        Align = alClient
        TabOrder = 0
        object memoConsole: TMemo
          Left = 0
          Top = 306
          Width = 897
          Height = 246
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 897
          Height = 306
          Align = alTop
          TabOrder = 1
          object LabelR5: TLabel
            Tag = 5
            Left = 12
            Top = 78
            Width = 19
            Height = 20
            Caption = 'F5'
          end
          object LabelR6: TLabel
            Tag = 6
            Left = 12
            Top = 115
            Width = 19
            Height = 20
            Caption = 'F6'
          end
          object LabelR7: TLabel
            Tag = 7
            Left = 12
            Top = 152
            Width = 19
            Height = 20
            Caption = 'F7'
          end
          object LabelR8: TLabel
            Tag = 8
            Left = 12
            Top = 189
            Width = 19
            Height = 20
            Caption = 'F8'
          end
          object LabelR4: TLabel
            Tag = 4
            Left = 12
            Top = 42
            Width = 19
            Height = 20
            Caption = 'F4'
          end
          object LabelR9: TLabel
            Tag = 9
            Left = 12
            Top = 226
            Width = 19
            Height = 20
            Caption = 'F9'
          end
          object Label13: TLabel
            Left = 37
            Top = 12
            Width = 108
            Height = 20
            Caption = 'Commands list:'
          end
          object edCmd5: TComboBox
            Tag = 5
            Left = 37
            Top = 74
            Width = 555
            Height = 28
            ItemHeight = 20
            TabOrder = 1
            OnKeyUp = edCmd_KeyUp
            Items.Strings = (
              ''
              'GetCharger'
              'GetMotors Laser'
              'TestMode On'
              'TestMode Off')
          end
          object btnCmd5: TButton
            Tag = 5
            Left = 592
            Top = 72
            Width = 50
            Height = 31
            Caption = 'Run'
            TabOrder = 7
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object edCmd6: TComboBox
            Tag = 6
            Left = 37
            Top = 111
            Width = 555
            Height = 28
            ItemHeight = 20
            TabOrder = 2
            OnKeyUp = edCmd_KeyUp
            Items.Strings = (
              ''
              'GetCharger'
              'GetMotors Laser'
              'TestMode On'
              'TestMode Off')
          end
          object btnCmd6: TButton
            Tag = 6
            Left = 592
            Top = 109
            Width = 50
            Height = 31
            Caption = 'Run'
            TabOrder = 8
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object edCmd7: TComboBox
            Tag = 7
            Left = 37
            Top = 148
            Width = 555
            Height = 28
            ItemHeight = 20
            TabOrder = 3
            OnKeyUp = edCmd_KeyUp
            Items.Strings = (
              ''
              'GetCharger'
              'GetMotors Laser'
              'TestMode On'
              'TestMode Off')
          end
          object btnCmd7: TButton
            Tag = 7
            Left = 592
            Top = 146
            Width = 50
            Height = 31
            Caption = 'Run'
            TabOrder = 9
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object edCmd8: TComboBox
            Tag = 8
            Left = 37
            Top = 185
            Width = 555
            Height = 28
            ItemHeight = 20
            TabOrder = 4
            OnKeyUp = edCmd_KeyUp
            Items.Strings = (
              ''
              'GetCharger'
              'GetMotors Laser'
              'TestMode On'
              'TestMode Off')
          end
          object btnCmd8: TButton
            Tag = 8
            Left = 592
            Top = 183
            Width = 50
            Height = 31
            Caption = 'Run'
            TabOrder = 10
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object edCmd4: TComboBox
            Tag = 4
            Left = 37
            Top = 37
            Width = 555
            Height = 28
            ItemHeight = 20
            TabOrder = 0
            OnKeyUp = edCmd_KeyUp
            Items.Strings = (
              ''
              'GetCharger'
              'GetMotors Laser'
              'TestMode On'
              'TestMode Off')
          end
          object btnCmd4: TButton
            Tag = 4
            Left = 592
            Top = 35
            Width = 50
            Height = 31
            Caption = 'Run'
            TabOrder = 6
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object edCmd9: TComboBox
            Tag = 9
            Left = 37
            Top = 222
            Width = 555
            Height = 28
            ItemHeight = 20
            TabOrder = 5
            OnKeyUp = edCmd_KeyUp
            Items.Strings = (
              ''
              'GetCharger'
              'GetMotors Laser'
              'TestMode On'
              'TestMode Off')
          end
          object btnCmd9: TButton
            Tag = 9
            Left = 592
            Top = 220
            Width = 50
            Height = 31
            Caption = 'Run'
            TabOrder = 11
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object Panel4: TPanel
            Left = 3
            Top = 258
            Width = 777
            Height = 44
            TabOrder = 13
            object edLogFileName: TComboBox
              Left = 332
              Top = 6
              Width = 408
              Height = 28
              Enabled = False
              ItemHeight = 20
              TabOrder = 0
              Text = 'log.txt'
            end
            object btnSelectLogFileName: TButton
              Left = 743
              Top = 6
              Width = 29
              Height = 29
              Caption = '...'
              Enabled = False
              TabOrder = 1
              OnClick = btnSelectLogFileNameClick
            end
            object chSaveLogToFile: TCheckBox
              Left = 12
              Top = 9
              Width = 310
              Height = 26
              Caption = 'Save log to file'
              TabOrder = 2
              OnClick = chSaveLogToFileClick
            end
          end
          object GroupBoxTimers: TGroupBox
            Left = 654
            Top = 11
            Width = 126
            Height = 247
            Hint = 'in second'
            Caption = 'Timers:'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            object cbRepeatTime4: TComboBox
              Tag = 4
              Left = 8
              Top = 25
              Width = 112
              Height = 28
              Hint = 'in second'
              ItemHeight = 20
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'OFF'
              OnChange = cbRepeatTimeChange
              Items.Strings = (
                'OFF'
                '1'
                '2'
                '3'
                '5'
                '60'
                '120')
            end
            object cbRepeatTime5: TComboBox
              Tag = 5
              Left = 8
              Top = 62
              Width = 112
              Height = 28
              Hint = 'in second'
              ItemHeight = 20
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              Text = 'OFF'
              OnChange = cbRepeatTimeChange
              Items.Strings = (
                'OFF'
                '1'
                '2'
                '3'
                '5'
                '60'
                '120')
            end
            object cbRepeatTime6: TComboBox
              Tag = 6
              Left = 8
              Top = 98
              Width = 112
              Height = 28
              Hint = 'in second'
              ItemHeight = 20
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Text = 'OFF'
              OnChange = cbRepeatTimeChange
              Items.Strings = (
                'OFF'
                '1'
                '2'
                '3'
                '5'
                '60'
                '120')
            end
            object cbRepeatTime7: TComboBox
              Tag = 7
              Left = 8
              Top = 135
              Width = 112
              Height = 28
              Hint = 'in second'
              ItemHeight = 20
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              Text = 'OFF'
              OnChange = cbRepeatTimeChange
              Items.Strings = (
                'OFF'
                '1'
                '2'
                '3'
                '5'
                '60'
                '120')
            end
            object cbRepeatTime8: TComboBox
              Tag = 8
              Left = 8
              Top = 172
              Width = 112
              Height = 28
              Hint = 'in second'
              ItemHeight = 20
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              Text = 'OFF'
              OnChange = cbRepeatTimeChange
              Items.Strings = (
                'OFF'
                '1'
                '2'
                '3'
                '5'
                '60'
                '120')
            end
            object cbRepeatTime9: TComboBox
              Tag = 9
              Left = 8
              Top = 209
              Width = 112
              Height = 28
              Hint = 'in second'
              ItemHeight = 20
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              Text = 'OFF'
              OnChange = cbRepeatTimeChange
              Items.Strings = (
                'OFF'
                '1'
                '2'
                '3'
                '5'
                '60'
                '120')
            end
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'About'
      ImageIndex = 4
      object MemoAbout: TMemo
        Left = 11
        Top = 52
        Width = 631
        Height = 491
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          '---------------------------'
          '   Neato Control'
          '---------------------------'
          'Constructor  [ heX ]'
          ''
          'Site: http://heX.name/programs/neatocontrol'
          'Git: https://bitbucket.org/heXor/neatocontrol'
          'Mail: heX1625616@gmail.com'
          ''
          #1050#1072#1082' '#1086#1090#1073#1083#1072#1075#1086#1076#1072#1088#1080#1090#1100':'
          #1052#1086#1078#1077#1090#1077' '#1087#1077#1088#1077#1095#1080#1089#1083#1080#1090#1100' 50 '#1088#1091#1073#1083#1077#1081' '#1084#1085#1077' '#1085#1072' '#1087#1080#1074#1086':'
          #1071#1085#1076#1077#1082#1089'.'#1044#1077#1085#1100#1075#1080': 41001734858021'
          'BitCoin: 16Hgt4WuS1DgQoPqps2xpa9quax3T3k6qm'
          ''
          '2015 '#1075#1086#1076'.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 488
    object actScan: TAction
      Category = 'robot'
      OnExecute = actScanExecute
    end
    object actSensors: TAction
      Category = 'robot'
      OnExecute = actSensorsExecute
    end
    object actConnect: TAction
      Caption = 'Connect'
      OnExecute = actConnectExecute
      OnUpdate = actConnectUpdate
    end
    object actDisconnect: TAction
      Category = 'robot'
      Caption = 'Disconnect'
      OnExecute = actDisconnectExecute
    end
    object actSetSchedule: TAction
      Category = 'robot'
      Caption = 'Save Schedule'
      OnExecute = actSetScheduleExecute
    end
    object actGetSchedule: TAction
      Category = 'robot'
      Caption = 'Load Schedule'
      OnExecute = actGetScheduleExecute
    end
    object actSetCurrentTime: TAction
      Category = 'robot'
      Caption = 'Set time to Neato from computer'
      OnExecute = actSetCurrentTimeExecute
    end
    object actScanLDS: TAction
      Category = 'robot'
      Caption = 'Scan LDS'
      OnExecute = actScanLDSExecute
    end
    object actRemoteControl: TAction
      Category = 'robot'
      Caption = 'Remote Control (push arrows)'
      OnExecute = actRemoteControlExecute
    end
    object actChrSet100PercentBattery: TAction
      Category = 'robor_chr'
      Caption = 'Set 100% Battery'
      OnExecute = actChrSet100PercentBatteryExecute
      OnUpdate = actChrCheck
    end
    object actChrEnableVaccum: TAction
      Category = 'robor_chr'
      Caption = 'Enable Vaccum Motor and Disconnect'
      OnExecute = actChrEnableVaccumExecute
      OnUpdate = actChrCheck
    end
    object actChrEnableBrush: TAction
      Category = 'robor_chr'
      Caption = 'Enable Brush Motor and Disconnect'
      OnExecute = actChrEnableBrushExecute
      OnUpdate = actChrCheck
    end
    object actResizeScanZone: TAction
      OnExecute = actResizeScanZoneExecute
    end
  end
  object TimerScan: TTimer
    Enabled = False
    Interval = 500
    OnTimer = actScanExecute
    Left = 524
  end
  object TimerSensors: TTimer
    Interval = 500
    OnTimer = actSensorsExecute
    Left = 558
    Top = 65535
  end
  object Lng: TDKLanguageController
    IgnoreList.Strings = (
      '*.Category'
      '*.Font.Name'
      'btnCmd5.Caption'
      'btnCmd6.Caption'
      'btnCmd7.Caption'
      'btnCmd8.Caption'
      'btnCmd9.Caption'
      'btnSelectLogFileName.Caption'
      'cbRepeatTime*.*'
      'edCmd5.Items'
      'edCmd6.Items'
      'edCmd7.Items'
      'edCmd8.Items'
      'edCmd9.Items'
      'listSchedule.Strings'
      'listSensors.Strings'
      'MemoAbout.*')
    StoreList.Strings = (
      'CantOpenPortCOM = Can'#39't open port COM'
      'ComPortNotDetect = COM port not detect'
      'ErrorClearPort = Error clearing port. (ClearCommError)'
      'ErrorEvent = WaitCommEvent IOResult = EV_ERR'
      'ErrorInvalidComPort = invalid COM port'
      'ErrorSetPortState = Error setting port state (SetCommState)'
      'Friday = Friday'
      'Monday = Monday'
      'Saturday = Saturday'
      'Sunday = Sunday'
      'textDisabled = Off'
      'textEnabled = On'
      'Thursda = Thursday'
      'Tuesday = Tuesday'
      'Wednesday = Wednesday')
    OnLanguageChanged = LngLanguageChanged
    Left = 452
    LangData = {
      070066726D4D61696E010100000001000000070043617074696F6E016F000000
      0C0050616765436F6E74726F6C31000009005461625368656574330101000000
      03000000070043617074696F6E00090047726F7570426F783201010000000400
      0000070043617074696F6E000700427574746F6E320101000000060000000700
      43617074696F6E000700427574746F6E33010100000007000000070043617074
      696F6E00090047726F7570426F7834010100000008000000070043617074696F
      6E000A006C625363685374617465010100000009000000070043617074696F6E
      0006004C6162656C3101010000000B000000070043617074696F6E000C006C69
      73745363686564756C6501010000000E0000000D005469746C6543617074696F
      6E73000E0062746E5365745363686564756C6500000E0062746E476574536368
      6564756C6500000D0062746E54696D655570646174650000080062746E536368
      456E010100000012000000070043617074696F6E00090062746E536368446973
      010100000013000000070043617074696F6E00090047726F7570426F78330101
      00000014000000070043617074696F6E000A006C62436F6D506F72744E010100
      000015000000070043617074696F6E000C0074657874436F6D506F72744E0102
      0000006300000005004974656D7316000000040054657874000700427574746F
      6E3400000700427574746F6E350000100063684175746F446574656374506F72
      74010100000019000000070043617074696F6E000D0063684175746F436F6E6E
      65637401010000001A000000070043617074696F6E00090047726F7570426F78
      3501010000001C000000070043617074696F6E000B007465787456657273696F
      6E0000090054616253686565743201010000001F000000070043617074696F6E
      00060050616E656C3200000C00636853656E736F724175746F01010000002100
      0000070043617074696F6E000B006C69737453656E736F727301010000002300
      00000D005469746C6543617074696F6E73000600496D61676531000006005061
      6E656C3100000A0063686B5363616E4C445300000B00416374696F6E4C697374
      31000007006163745363616E00000A0061637453656E736F727300000A006163
      74436F6E6E65637401010000002A000000070043617074696F6E000D00616374
      446973636F6E6E65637401010000002B000000070043617074696F6E00090054
      696D65725363616E00000C0054696D657253656E736F727300000A0063624C61
      6E6775616765000007006C626C4C616E6701010000002C000000070043617074
      696F6E000E006163745365745363686564756C6501010000002E000000070043
      617074696F6E000E006163744765745363686564756C6501010000002F000000
      070043617074696F6E00110061637453657443757272656E7454696D65010100
      000030000000070043617074696F6E000A006163745363616E4C445301010000
      0039000000070043617074696F6E000F00636852656D6F7465436F6E74726F6C
      0000100061637452656D6F7465436F6E74726F6C01010000003C000000070043
      617074696F6E00090054616253686565743401010000003D0000000700436170
      74696F6E00090054616253686565743501010000003E00000007004361707469
      6F6E000E006261724675656C50657263656E74000009004D656D6F41626F7574
      00000C0054696D657247657454696D6500000C006C62526F626F7454696D6532
      010100000043000000070043617074696F6E000B006C62526F626F7454696D65
      010100000044000000070043617074696F6E001A006163744368725365743130
      3050657263656E7442617474657279010100000050000000070043617074696F
      6E001200616374436872456E61626C6556616363756D01010000005100000007
      0043617074696F6E001100616374436872456E61626C65427275736801010000
      0052000000070043617074696F6E000A00506F7075704D656E7531000006006D
      6E436F7079010100000053000000070043617074696F6E000A005363726F6C6C
      426F7831000005004D656D6F3201010000005400000005004C696E6573000500
      4D656D6F3101010000005500000005004C696E65730005004D656D6F33010100
      00005600000005004C696E657300170062746E53657431303050657263656E74
      42617474657279000006004C6162656C32010100000057000000070043617074
      696F6E0006004C6162656C33010100000058000000070043617074696F6E0006
      004C6162656C34010100000059000000070043617074696F6E0006004C616265
      6C3501010000005A000000070043617074696F6E000E0062746E456E61626C65
      427275736800000F0062746E456E61626C6556616363756D000006004C616265
      6C3601010000005B000000070043617074696F6E0005004D656D6F3501010000
      005C00000005004C696E65730005004D656D6F3401010000005D00000005004C
      696E65730010006C625761726E4C6F77566F6C7461676501010000005E000000
      070043617074696F6E0005004D656D6F3601010000005F00000005004C696E65
      73000900546162536865657436010100000060000000070043617074696F6E00
      0A005363726F6C6C426F783200000C007061696E745370656374726500000B00
      6D656D6F436F6E736F6C650000060050616E656C3300000E00496D6167654C69
      73744E6561746F000007007461625363616E0101000000640000000700436170
      74696F6E0007004C6162656C5235010100000065000000070043617074696F6E
      0007004C6162656C5236010100000066000000070043617074696F6E0007004C
      6162656C5237010100000067000000070043617074696F6E0007004C6162656C
      5238010100000068000000070043617074696F6E0007004C6162656C52340101
      00000069000000070043617074696F6E0007004C6162656C523901010000006A
      000000070043617074696F6E0007004C6162656C313301010000006B00000007
      0043617074696F6E0006006564436D64350000070062746E436D643500000600
      6564436D64360000070062746E436D6436000006006564436D64370000070062
      746E436D6437000006006564436D64380000070062746E436D64380000060065
      64436D643401010000006C00000005004974656D7300070062746E436D643401
      010000006D000000070043617074696F6E0006006564436D6439000007006274
      6E436D64390000060050616E656C3400000D0065644C6F6746696C654E616D65
      01010000006E00000004005465787400140062746E53656C6563744C6F674669
      6C654E616D6500000F006368536176654C6F67546F46696C6501010000006F00
      0000070043617074696F6E000E0047726F7570426F7854696D65727301020000
      0071000000070043617074696F6E70000000040048696E74000D006362526570
      65617454696D653400000D00636252657065617454696D653500000D00636252
      657065617454696D653600000D00636252657065617454696D653700000D0063
      6252657065617454696D653800000D00636252657065617454696D6539000011
      00616374526573697A655363616E5A6F6E650000}
  end
  object TimerGetTime: TTimer
    OnTimer = TimerGetTimeTimer
    Left = 598
    Top = 65535
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    object mnCopy: TMenuItem
      Caption = 'Copy'
      OnClick = mnCopyClick
    end
  end
  object ImageListNeato: TImageList
    BkColor = clWhite
    Height = 32
    Width = 32
    Left = 384
    Top = 1
    Bitmap = {
      494C010101000400040020002000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0
      E0FFCBC9C9FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFC5C3
      C3FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FFE1E0DFFFE2E1
      E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFCFCECDFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B8B8FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFDEDCDCFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDEDEFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFD7D5D5FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFD2CFCFFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC9C8C8FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFD8D5D5FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE7E7E6FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE0DFDFFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFC8C3C4FFA58889FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF854445FF854445FF854445FF854445FFDEDCDBFFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFF6F6
      F6FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFCBBBBCFF854445FF854445FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF854445FF854445FF854445FF854445FF8F5758FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFB4B2
      B2FFE2E1E0FFE2E1E0FFE2E1E0FF894F50FF854445FF854445FF854445FF8546
      47FF854445FF854445FF854445FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF854445FF251D20FF251D20FF854445FF8F5758FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFE2E1
      E0FFE2E1E0FFE2E1E0FF854445FF854445FF854445FF854445FF854445FF8544
      45FF8B5657FF854445FF854445FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF3259E6FF251D20FF251D20FF854445FF8F5758FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFE2E1
      E0FFE2E1E0FF864748FF854445FF854445FF854445FF7D3F40FF793C3DFF8544
      45FF854445FF854445FF854445FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF3259E6FF251D20FF251D20FF854445FF8F5758FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFE2E1
      E0FFE2E1E0FF854445FF854445FF854445FF854445FF804142FF804142FF8041
      42FF854445FF854445FF854445FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF3259E6FF251D20FF251D20FF854445FF8F5758FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFE2E1
      E0FFE2E1E0FF854445FF854445FF854445FF854445FF783C3DFF793C3DFF7E40
      40FF854445FF854445FF854445FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF3259E6FF251D20FF251D20FF854445FF8F5758FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFE2E1
      E0FFE2E1E0FF854445FF854445FF854445FF854445FF854445FF7A3D3EFF8443
      44FF854445FF854445FF854445FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF3259E6FF251D20FF251D20FF854445FF8D5556FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFD9D7
      D7FFE2E1E0FFE2E1E0FF854445FF854445FF854445FF854445FF854445FF8544
      45FF8F5959FF854445FF854445FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF3259E6FF251D20FF251D20FF854445FF8D5556FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFC4C1
      C1FFE2E1E0FFE2E1E0FFDDDCDBFF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF854445FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF854445FF251D20FF251D20FF854445FF8D5556FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE2E1E0FFE2E1E0FFE2E1E0FF2A2125FF251D20FF251D20FF251D20FF453A
      3FFFA99F9FFF854445FF854445FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF854445FF854445FF854445FF854445FF8D5556FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD5D3D3FFE2E1E0FFC7C6C6FF251D20FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FF251D20FFC7C5C5FF8C6465FF854445FF854445FF854445FF854445FF8544
      45FF854445FF854445FF854445FF854445FF854445FF854445FFE1E0DFFFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFAFCFBFFE2E1E0FF251D20FF251D20FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FFA4A2A3FF251D20FF251D20FF5E5C5DFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFBFBEBEFF251D20FF251D20FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FF9D999AFF251D20FF251D20FF322C2FFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFDDDCDBFFDCDBDAFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD2D1D0FF251D20FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FF251D20FF251D20FF251D20FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFE2E1E0FFD2D0D0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C3C3FF251D20FF2A2125FF878585FFA5A5
      A5FF251D20FF3AA681FFC2BDBDFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFC6C1C2FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D0CFFF251D20FF251D20FF251D
      20FF36887BFF3259E6FF6F88C2FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFE2E1E0FFDFDDDCFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C2C2FF7B7576FF251D
      20FF293537FF4A6BCEFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFD6D3D2FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDD
      DDFFD1D0CFFFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFC9C8
      C8FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1E0FFE2E1
      E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFE0000F000000000000000000000000FF80000F000000000000000000000000
      FF00000F000000000000000000000000FE00000F000000000000000000000000
      FC00000F000000000000000000000000F800000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      E000000F000000000000000000000000E000000F000000000000000000000000
      E000000F000000000000000000000000E000000F000000000000000000000000
      E000000F000000000000000000000000E000000F000000000000000000000000
      E000000F000000000000000000000000E000000F000000000000000000000000
      E000000F000000000000000000000000F000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F800000F000000000000000000000000FC00000F000000000000000000000000
      FE00000F000000000000000000000000FF00000F000000000000000000000000
      FF80000F000000000000000000000000FFE0000F000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF00000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
