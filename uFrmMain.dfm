object frmMain: TfrmMain
  Left = 336
  Top = 121
  Width = 939
  Height = 718
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
  object PageControl1: TTntPageControl
    Left = 0
    Top = 0
    Width = 917
    Height = 663
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    object TabSheet3: TTntTabSheet
      Caption = 'Options'
      ImageIndex = 2
      object lblLang: TTntLabel
        Left = 465
        Top = 406
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
      object lbRobotTime2: TTntLabel
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
      object lbRobotTime: TTntLabel
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
      object GroupBox4: TTntGroupBox
        Left = 455
        Top = 35
        Width = 433
        Height = 357
        Caption = 'Schedule && Time'
        TabOrder = 0
        object lbSchState: TTntLabel
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
        object Label1: TTntLabel
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
        object btnSetSchedule: TTntButton
          Left = 271
          Top = 86
          Width = 154
          Height = 39
          Action = actSetSchedule
          TabOrder = 1
        end
        object btnGetSchedule: TTntButton
          Left = 271
          Top = 37
          Width = 154
          Height = 38
          Action = actGetSchedule
          TabOrder = 2
        end
        object btnTimeUpdate: TTntButton
          Left = 12
          Top = 308
          Width = 413
          Height = 38
          Action = actSetCurrentTime
          TabOrder = 3
          WordWrap = True
        end
        object btnSchEn: TTntButton
          Left = 271
          Top = 214
          Width = 154
          Height = 38
          Caption = 'Enable'
          Enabled = False
          TabOrder = 4
          OnClick = btnSchEnClick
        end
        object btnSchDis: TTntButton
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
      object GroupBox3: TTntGroupBox
        Left = 12
        Top = 12
        Width = 433
        Height = 211
        Caption = 'Connect'
        TabOrder = 1
        object lbComPortN: TTntLabel
          Left = 25
          Top = 172
          Width = 117
          Height = 20
          Caption = 'COM Port name:'
          Enabled = False
        end
        object textComPortN: TTntComboBox
          Left = 191
          Top = 165
          Width = 195
          Height = 28
          Enabled = False
          ItemHeight = 20
          TabOrder = 0
          Text = 'COM1'
          Items.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'TCP:192.168.1.21:2167'
            'TCP:127.0.0.1:21')
        end
        object Button4: TTntButton
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
        object Button5: TTntButton
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
        object chAutoDetectPort: TTntCheckBox
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
        object chAutoConnect: TTntCheckBox
          Left = 12
          Top = 123
          Width = 405
          Height = 26
          Caption = 'Auto connect on plug'
          Enabled = False
          TabOrder = 4
        end
        object btnConnectOptions: TTntButton
          Left = 386
          Top = 162
          Width = 36
          Height = 35
          Caption = '...'
          Enabled = False
          TabOrder = 5
          OnClick = btnConnectOptionsClick
        end
      end
      object GroupBox5: TTntGroupBox
        Left = 12
        Top = 234
        Width = 433
        Height = 272
        Caption = 'Version:'
        TabOrder = 2
        object textVersion: TTntMemo
          Left = 2
          Top = 22
          Width = 429
          Height = 248
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object cbLanguage: TTntComboBox
        Left = 551
        Top = 400
        Width = 259
        Height = 28
        ItemHeight = 20
        TabOrder = 3
        OnChange = cbLanguageWarn
        OnClick = cbLanguageWarn
      end
      object Button1: TButton
        Left = 548
        Top = 399
        Width = 264
        Height = 32
        Caption = '...'
        TabOrder = 4
        OnClick = cbLanguageWarn
      end
      object Panel5: TPanel
        Left = 14
        Top = 512
        Width = 867
        Height = 49
        TabOrder = 5
        object Label7: TLabel
          Left = 8
          Top = 11
          Width = 161
          Height = 27
          Alignment = taRightJustify
          Caption = 'Test mode:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btnTestModeOff: TRadioButton
          Left = 183
          Top = 4
          Width = 174
          Height = 41
          Action = actTestModeOff
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object btnTestModeOn: TRadioButton
          Left = 560
          Top = 2
          Width = 297
          Height = 41
          Action = actTestModeOnConst
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object RadioButton1: TRadioButton
          Left = 368
          Top = 3
          Width = 179
          Height = 41
          Action = actTestModeOn
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object TabSheet2: TTntTabSheet
      Caption = 'Sensors'
      ImageIndex = 1
      object Panel2: TTntPanel
        Left = 0
        Top = 0
        Width = 930
        Height = 42
        Align = alTop
        TabOrder = 0
        object chSensorAuto: TTntCheckBox
          Left = 338
          Top = 5
          Width = 224
          Height = 32
          Caption = 'Auto update'
          Checked = True
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 0
          OnClick = chSensorAutoClick
        end
        object chButtonTest: TTntCheckBox
          Left = 11
          Top = 5
          Width = 311
          Height = 32
          Caption = 'Scan buttons on robot too'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = chButtonTestClick
        end
        object Button6: TButton
          Left = 640
          Top = 5
          Width = 103
          Height = 33
          Action = actCopySensorData
          TabOrder = 2
        end
      end
      object listSensors: TValueListEditor
        Left = 0
        Top = 42
        Width = 930
        Height = 541
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
          743)
      end
    end
    object tabScan: TTntTabSheet
      Caption = 'Scanner'
      object Image1: TImage
        Left = 0
        Top = 75
        Width = 909
        Height = 553
        Align = alClient
      end
      object Panel1: TTntPanel
        Left = 0
        Top = 0
        Width = 909
        Height = 75
        Align = alTop
        TabOrder = 0
        object paintSpectre: TPaintBox
          Left = 1
          Top = 48
          Width = 907
          Height = 26
          Align = alBottom
          OnPaint = paintSpectrePaint
        end
        object chkScanLDS: TTntCheckBox
          Left = 18
          Top = 12
          Width = 267
          Height = 26
          Action = actScanLDS
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object chRemoteControl: TTntCheckBox
          Left = 314
          Top = 12
          Width = 475
          Height = 26
          Action = actRemoteControl
          TabOrder = 1
        end
      end
    end
    object TntTabSheet1: TTntTabSheet
      Caption = 'Equipment'
      object ScrollBox3: TScrollBox
        Left = 0
        Top = 0
        Width = 930
        Height = 583
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object CheckBox1: TCheckBox
          Left = 12
          Top = 12
          Width = 765
          Height = 26
          Caption = 'require rotate the robot to the up'
          Checked = True
          State = cbChecked
          TabOrder = 0
          Visible = False
        end
        object ScrollBar1: TScrollBar
          Left = 40
          Top = 112
          Width = 26
          Height = 273
          Kind = sbVertical
          PageSize = 0
          TabOrder = 1
        end
        object ScrollBar2: TScrollBar
          Left = 152
          Top = 112
          Width = 26
          Height = 273
          Kind = sbVertical
          PageSize = 0
          TabOrder = 2
        end
      end
    end
    object TabSheet4: TTntTabSheet
      Caption = 'Recharge'
      ImageIndex = 3
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 909
        Height = 628
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        DesignSize = (
          909
          628)
        object Label2: TTntLabel
          Left = 2
          Top = 171
          Width = 67
          Height = 20
          AutoSize = False
          Caption = 'Step 1:'
        end
        object Label3: TTntLabel
          Left = 2
          Top = 231
          Width = 67
          Height = 20
          AutoSize = False
          Caption = 'Step 2:'
        end
        object Label4: TTntLabel
          Left = 2
          Top = 300
          Width = 67
          Height = 20
          AutoSize = False
          Caption = 'Step 3:'
        end
        object Label5: TTntLabel
          Left = 2
          Top = 360
          Width = 67
          Height = 20
          AutoSize = False
          Caption = 'Step 4:'
        end
        object Label6: TTntLabel
          Left = 2
          Top = 451
          Width = 67
          Height = 20
          AutoSize = False
          Caption = 'Step 5:'
        end
        object Memo2: TTntMemo
          Left = 0
          Top = 3
          Width = 1171
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
        object Memo1: TTntMemo
          Left = 71
          Top = 160
          Width = 1100
          Height = 42
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'Turn on the robot for cleaning and wait until discharge.')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object Memo3: TTntMemo
          Left = 291
          Top = 211
          Width = 880
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
        object btnSet100PercentBattery: TTntButton
          Left = 71
          Top = 211
          Width = 211
          Height = 51
          Action = actChrSet100PercentBattery
          TabOrder = 3
          WordWrap = True
        end
        object btnEnableBrush: TTntButton
          Left = 71
          Top = 340
          Width = 211
          Height = 62
          Action = actChrEnableBrush
          TabOrder = 4
          WordWrap = True
        end
        object btnEnableVaccum: TTntButton
          Left = 71
          Top = 271
          Width = 211
          Height = 60
          Action = actChrEnableVaccum
          TabOrder = 5
          WordWrap = True
        end
        object Memo5: TTntMemo
          Left = 291
          Top = 340
          Width = 880
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
        object Memo4: TTntMemo
          Left = 291
          Top = 271
          Width = 880
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
        object lbWarnLowVoltage: TTntPanel
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
        object Memo6: TTntMemo
          Left = 71
          Top = 411
          Width = 1100
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
    object TabSheet6: TTntTabSheet
      Caption = 'Commands'
      ImageIndex = 4
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 909
        Height = 628
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object memoConsole: TTntMemo
          Left = 0
          Top = 337
          Width = 909
          Height = 291
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object Panel3: TTntPanel
          Left = 0
          Top = 0
          Width = 909
          Height = 337
          Align = alTop
          TabOrder = 1
          object LabelR5: TTntLabel
            Tag = 5
            Left = 12
            Top = 78
            Width = 19
            Height = 20
            Caption = 'F5'
          end
          object LabelR6: TTntLabel
            Tag = 6
            Left = 12
            Top = 115
            Width = 19
            Height = 20
            Caption = 'F6'
          end
          object LabelR7: TTntLabel
            Tag = 7
            Left = 12
            Top = 152
            Width = 19
            Height = 20
            Caption = 'F7'
          end
          object LabelR8: TTntLabel
            Tag = 8
            Left = 12
            Top = 189
            Width = 19
            Height = 20
            Caption = 'F8'
          end
          object LabelR4: TTntLabel
            Tag = 4
            Left = 12
            Top = 42
            Width = 19
            Height = 20
            Caption = 'F4'
          end
          object LabelR9: TTntLabel
            Tag = 9
            Left = 12
            Top = 226
            Width = 19
            Height = 20
            Caption = 'F9'
          end
          object Label13: TTntLabel
            Left = 37
            Top = 12
            Width = 108
            Height = 20
            Caption = 'Commands list:'
          end
          object edCmd5: TTntComboBox
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
          object btnCmd5: TTntButton
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
          object edCmd6: TTntComboBox
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
          object btnCmd6: TTntButton
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
          object edCmd7: TTntComboBox
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
          object btnCmd7: TTntButton
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
          object edCmd8: TTntComboBox
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
          object btnCmd8: TTntButton
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
          object edCmd4: TTntComboBox
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
          object btnCmd4: TTntButton
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
          object edCmd9: TTntComboBox
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
          object btnCmd9: TTntButton
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
          object Panel4: TTntPanel
            Left = 3
            Top = 258
            Width = 777
            Height = 71
            TabOrder = 13
            object edLogFileName: TTntComboBox
              Left = 332
              Top = 6
              Width = 408
              Height = 28
              Enabled = False
              ItemHeight = 20
              TabOrder = 0
              Text = 'log.txt'
            end
            object btnSelectLogFileName: TTntButton
              Left = 743
              Top = 6
              Width = 29
              Height = 29
              Caption = '...'
              Enabled = False
              TabOrder = 1
              OnClick = btnSelectLogFileNameClick
            end
            object chSaveLogToFile: TTntCheckBox
              Left = 12
              Top = 9
              Width = 310
              Height = 26
              Caption = 'Save log to file'
              TabOrder = 2
              OnClick = chSaveLogToFileClick
            end
            object chSeparateCmd: TCheckBox
              Left = 12
              Top = 37
              Width = 260
              Height = 28
              Caption = 'Separate all cmd "==="'
              Checked = True
              State = cbChecked
              TabOrder = 3
            end
          end
          object GroupBoxTimers: TTntGroupBox
            Left = 654
            Top = 11
            Width = 126
            Height = 247
            Hint = 'in second'
            Caption = 'Timers:'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            object cbRepeatTime4: TTntComboBox
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
            object cbRepeatTime5: TTntComboBox
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
            object cbRepeatTime6: TTntComboBox
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
            object cbRepeatTime7: TTntComboBox
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
            object cbRepeatTime8: TTntComboBox
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
            object cbRepeatTime9: TTntComboBox
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
    object TabSheet5: TTntTabSheet
      Caption = 'About'
      ImageIndex = 4
      object MemoAbout: TTntMemo
        Left = 11
        Top = 15
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
          'Site english: http://heX.name/en/programs/neatocontrol'
          'Git: https://bitbucket.org/heXor/neatocontrol'
          'Mail: heX1625616@gmail.com'
          'Tox: hexor@toxme.se'
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
  object ActionList1: TTntActionList
    OnUpdate = ActionList1Update
    Left = 424
    object actScan: TTntAction
      Category = 'robot'
      OnExecute = actScanExecute
    end
    object actSensors: TTntAction
      Category = 'robot'
      OnExecute = actSensorsExecute
    end
    object actConnect: TTntAction
      Caption = 'Connect'
      OnExecute = actConnectExecute
      OnUpdate = actConnectUpdate
    end
    object actDisconnect: TTntAction
      Category = 'robot'
      Caption = 'Disconnect'
      OnExecute = actDisconnectExecute
    end
    object actSetSchedule: TTntAction
      Category = 'robot'
      Caption = 'Save Schedule'
      OnExecute = actSetScheduleExecute
    end
    object actGetSchedule: TTntAction
      Category = 'robot'
      Caption = 'Load Schedule'
      OnExecute = actGetScheduleExecute
    end
    object actSetCurrentTime: TTntAction
      Category = 'robot'
      Caption = 'Set time to Neato from computer'
      OnExecute = actSetCurrentTimeExecute
    end
    object actScanLDS: TTntAction
      Category = 'robot'
      Caption = 'Scan LDS'
      OnExecute = actScanLDSExecute
    end
    object actRemoteControl: TTntAction
      Category = 'robot'
      Caption = 'Remote Control (push arrows)'
      OnExecute = actRemoteControlExecute
    end
    object actChrSet100PercentBattery: TTntAction
      Category = 'robor_chr'
      Caption = 'Set 100% Battery'
      OnExecute = actChrSet100PercentBatteryExecute
      OnUpdate = actChrCheck
    end
    object actChrEnableVaccum: TTntAction
      Category = 'robor_chr'
      Caption = 'Enable Vaccum Motor and Disconnect'
      OnExecute = actChrEnableVaccumExecute
      OnUpdate = actChrCheck
    end
    object actChrEnableBrush: TTntAction
      Category = 'robor_chr'
      Caption = 'Enable Brush Motor and Disconnect'
      OnExecute = actChrEnableBrushExecute
      OnUpdate = actChrCheck
    end
    object actResizeScanZone: TTntAction
      OnExecute = actResizeScanZoneExecute
    end
    object actCopySensorData: TTntAction
      Category = 'gui'
      Caption = 'copy all'
      OnExecute = actCopySensorDataExecute
    end
    object actTestModeOn: TTntAction
      Category = 'robot'
      Caption = 'Enable'
    end
    object actTestModeOnConst: TTntAction
      Category = 'robot'
      Caption = 'Enable constantly'
    end
    object actTestModeOff: TTntAction
      Category = 'robot'
      Caption = 'Disable'
    end
  end
  object TimerScan: TTimer
    Enabled = False
    Interval = 500
    OnTimer = actScanExecute
    Left = 460
  end
  object TimerSensors: TTimer
    Interval = 500
    OnTimer = actSensorsExecute
    Left = 494
    Top = 65535
  end
  object TimerGetTime: TTimer
    OnTimer = TimerGetTimeTimer
    Left = 526
    Top = 65535
  end
  object PopupMenu1: TTntPopupMenu
    Left = 392
    object mnCopy: TTntMenuItem
      Caption = 'Copy'
      OnClick = mnCopyClick
    end
  end
end
