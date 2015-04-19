object frmMain: TfrmMain
  Left = 336
  Top = 121
  Width = 653
  Height = 496
  Caption = 'Neato Control'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
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
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TTntPageControl
    Left = 0
    Top = 0
    Width = 637
    Height = 458
    ActivePage = TntTabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    object TabSheet3: TTntTabSheet
      Caption = 'Options'
      ImageIndex = 2
      object lblLang: TTntLabel
        Left = 302
        Top = 269
        Width = 51
        Height = 13
        Caption = 'Language:'
      end
      object barFuelPercent: TGauge
        Left = 494
        Top = 3
        Width = 83
        Height = 17
        Color = clBtnFace
        ForeColor = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Progress = 0
      end
      object lbRobotTime2: TTntLabel
        Left = 305
        Top = 3
        Width = 86
        Height = 20
        Align = alCustom
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = 'Robot Time:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object lbRobotTime: TTntLabel
        Left = 395
        Top = 4
        Width = 62
        Height = 20
        Caption = '00:00:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GroupBox2: TTntGroupBox
        Left = 493
        Top = 261
        Width = 82
        Height = 80
        Caption = 'Wall Follower:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        object Button2: TTntButton
          Left = 4
          Top = 19
          Width = 75
          Height = 25
          Caption = 'Enable'
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button3: TTntButton
          Left = 4
          Top = 48
          Width = 75
          Height = 25
          Caption = 'Disable'
          TabOrder = 1
          OnClick = Button3Click
        end
      end
      object GroupBox4: TTntGroupBox
        Left = 296
        Top = 23
        Width = 281
        Height = 232
        Caption = 'Schedule && Time'
        TabOrder = 1
        object lbSchState: TTntLabel
          Left = 176
          Top = 110
          Width = 97
          Height = 21
          Alignment = taCenter
          AutoSize = False
          Caption = '???'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TTntLabel
          Left = 176
          Top = 96
          Width = 48
          Height = 13
          Caption = 'Schedule:'
        end
        object listSchedule: TValueListEditor
          Left = 8
          Top = 24
          Width = 161
          Height = 169
          DefaultRowHeight = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
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
            47)
        end
        object btnSetSchedule: TTntButton
          Left = 176
          Top = 56
          Width = 100
          Height = 25
          Action = actSetSchedule
          TabOrder = 1
        end
        object btnGetSchedule: TTntButton
          Left = 176
          Top = 24
          Width = 100
          Height = 25
          Action = actGetSchedule
          TabOrder = 2
        end
        object btnTimeUpdate: TTntButton
          Left = 8
          Top = 200
          Width = 268
          Height = 25
          Action = actSetCurrentTime
          TabOrder = 3
          WordWrap = True
        end
        object btnSchEn: TTntButton
          Left = 176
          Top = 139
          Width = 100
          Height = 25
          Caption = 'Enable'
          Enabled = False
          TabOrder = 4
          OnClick = btnSchEnClick
        end
        object btnSchDis: TTntButton
          Left = 176
          Top = 168
          Width = 100
          Height = 25
          Caption = 'Disable'
          Enabled = False
          TabOrder = 5
          OnClick = btnSchDisClick
        end
      end
      object GroupBox3: TTntGroupBox
        Left = 8
        Top = 8
        Width = 281
        Height = 137
        Caption = 'Connect'
        TabOrder = 2
        object lbComPortN: TTntLabel
          Left = 16
          Top = 112
          Width = 78
          Height = 13
          Caption = 'COM Port name:'
          Enabled = False
        end
        object textComPortN: TTntComboBox
          Left = 124
          Top = 107
          Width = 127
          Height = 21
          Enabled = False
          ItemHeight = 13
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
          Left = 8
          Top = 16
          Width = 129
          Height = 33
          Action = actConnect
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object Button5: TTntButton
          Left = 144
          Top = 16
          Width = 129
          Height = 33
          Action = actDisconnect
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object chAutoDetectPort: TTntCheckBox
          Left = 8
          Top = 56
          Width = 263
          Height = 17
          Caption = 'Auto detect port number'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = chAutoDetectPortClick
        end
        object chAutoConnect: TTntCheckBox
          Left = 8
          Top = 80
          Width = 263
          Height = 17
          Caption = 'Auto connect on plug'
          Enabled = False
          TabOrder = 4
        end
        object btnConnectOptions: TTntButton
          Left = 251
          Top = 105
          Width = 23
          Height = 23
          Caption = '...'
          Enabled = False
          TabOrder = 5
          OnClick = btnConnectOptionsClick
        end
      end
      object GroupBox5: TTntGroupBox
        Left = 8
        Top = 152
        Width = 281
        Height = 177
        Caption = 'Version:'
        TabOrder = 3
        object textVersion: TTntMemo
          Left = 2
          Top = 15
          Width = 277
          Height = 160
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object cbLanguage: TTntComboBox
        Left = 301
        Top = 286
        Width = 168
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        OnChange = cbLanguageWarn
        OnClick = cbLanguageWarn
      end
      object Button1: TButton
        Left = 302
        Top = 286
        Width = 172
        Height = 21
        Caption = '...'
        TabOrder = 5
        OnClick = cbLanguageWarn
      end
    end
    object TabSheet2: TTntTabSheet
      Caption = 'Sensors'
      ImageIndex = 1
      object Panel2: TTntPanel
        Left = 0
        Top = 0
        Width = 629
        Height = 27
        Align = alTop
        TabOrder = 0
        object chSensorAuto: TTntCheckBox
          Left = 220
          Top = 3
          Width = 145
          Height = 21
          Caption = 'Auto load'
          Checked = True
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 0
          OnClick = chSensorAutoClick
        end
        object chButtonTest: TTntCheckBox
          Left = 7
          Top = 3
          Width = 144
          Height = 21
          Caption = 'Button Test'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = chButtonTestClick
        end
        object Button6: TButton
          Left = 416
          Top = 3
          Width = 67
          Height = 22
          Action = actCopySensorData
          TabOrder = 2
        end
      end
      object listSensors: TValueListEditor
        Left = 0
        Top = 27
        Width = 629
        Height = 403
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
          442)
      end
    end
    object TntTabSheet1: TTntTabSheet
      Caption = 'Equipment'
      object ScrollBox3: TScrollBox
        Left = 0
        Top = 0
        Width = 629
        Height = 430
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object CheckBox1: TCheckBox
          Left = 8
          Top = 8
          Width = 497
          Height = 17
          Caption = 'require rotate the robot to the up'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
    object tabScan: TTntTabSheet
      Caption = 'Scanner'
      object Image1: TImage
        Left = 0
        Top = 49
        Width = 629
        Height = 381
        Align = alClient
      end
      object Panel1: TTntPanel
        Left = 0
        Top = 0
        Width = 629
        Height = 49
        Align = alTop
        TabOrder = 0
        object paintSpectre: TPaintBox
          Left = 1
          Top = 31
          Width = 627
          Height = 17
          Align = alBottom
          OnPaint = paintSpectrePaint
        end
        object chkScanLDS: TTntCheckBox
          Left = 12
          Top = 8
          Width = 173
          Height = 17
          Action = actScanLDS
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object chRemoteControl: TTntCheckBox
          Left = 204
          Top = 8
          Width = 309
          Height = 17
          Action = actRemoteControl
          TabOrder = 1
        end
      end
    end
    object TabSheet4: TTntTabSheet
      Caption = 'Recharge'
      ImageIndex = 3
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 629
        Height = 430
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        DesignSize = (
          629
          430)
        object Label2: TTntLabel
          Left = 1
          Top = 111
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'Step 1:'
        end
        object Label3: TTntLabel
          Left = 1
          Top = 150
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'Step 2:'
        end
        object Label4: TTntLabel
          Left = 1
          Top = 195
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'Step 3:'
        end
        object Label5: TTntLabel
          Left = 1
          Top = 234
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'Step 4:'
        end
        object Label6: TTntLabel
          Left = 1
          Top = 293
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'Step 5:'
        end
        object Memo2: TTntMemo
          Left = 0
          Top = 2
          Width = 559
          Height = 100
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
          Left = 46
          Top = 104
          Width = 513
          Height = 27
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'Turn on the robot for cleaning and wait until discharge.')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object Memo3: TTntMemo
          Left = 189
          Top = 137
          Width = 370
          Height = 33
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
          Left = 46
          Top = 137
          Width = 137
          Height = 33
          Action = actChrSet100PercentBattery
          TabOrder = 3
          WordWrap = True
        end
        object btnEnableBrush: TTntButton
          Left = 46
          Top = 221
          Width = 137
          Height = 40
          Action = actChrEnableBrush
          TabOrder = 4
          WordWrap = True
        end
        object btnEnableVaccum: TTntButton
          Left = 46
          Top = 176
          Width = 137
          Height = 39
          Action = actChrEnableVaccum
          TabOrder = 5
          WordWrap = True
        end
        object Memo5: TTntMemo
          Left = 189
          Top = 221
          Width = 370
          Height = 40
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
          Left = 189
          Top = 176
          Width = 370
          Height = 39
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
          Left = 59
          Top = 150
          Width = 111
          Height = 98
          Caption = 'Batt V < 12 V'
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          Visible = False
          OnMouseUp = lbWarnLowVoltageMouseUp
        end
        object Memo6: TTntMemo
          Left = 46
          Top = 267
          Width = 513
          Height = 78
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
        Width = 629
        Height = 430
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object memoConsole: TTntMemo
          Left = 0
          Top = 199
          Width = 629
          Height = 231
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object Panel3: TTntPanel
          Left = 0
          Top = 0
          Width = 629
          Height = 199
          Align = alTop
          TabOrder = 1
          object LabelR5: TTntLabel
            Tag = 5
            Left = 8
            Top = 51
            Width = 12
            Height = 13
            Caption = 'F5'
          end
          object LabelR6: TTntLabel
            Tag = 6
            Left = 8
            Top = 75
            Width = 12
            Height = 13
            Caption = 'F6'
          end
          object LabelR7: TTntLabel
            Tag = 7
            Left = 8
            Top = 99
            Width = 12
            Height = 13
            Caption = 'F7'
          end
          object LabelR8: TTntLabel
            Tag = 8
            Left = 8
            Top = 123
            Width = 12
            Height = 13
            Caption = 'F8'
          end
          object LabelR4: TTntLabel
            Tag = 4
            Left = 8
            Top = 27
            Width = 12
            Height = 13
            Caption = 'F4'
          end
          object LabelR9: TTntLabel
            Tag = 9
            Left = 8
            Top = 147
            Width = 12
            Height = 13
            Caption = 'F9'
          end
          object Label13: TTntLabel
            Left = 24
            Top = 8
            Width = 70
            Height = 13
            Caption = 'Commands list:'
          end
          object edCmd5: TTntComboBox
            Tag = 5
            Left = 24
            Top = 48
            Width = 361
            Height = 21
            ItemHeight = 13
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
            Left = 385
            Top = 47
            Width = 32
            Height = 20
            Caption = 'Run'
            TabOrder = 7
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object edCmd6: TTntComboBox
            Tag = 6
            Left = 24
            Top = 72
            Width = 361
            Height = 21
            ItemHeight = 13
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
            Left = 385
            Top = 71
            Width = 32
            Height = 20
            Caption = 'Run'
            TabOrder = 8
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object edCmd7: TTntComboBox
            Tag = 7
            Left = 24
            Top = 96
            Width = 361
            Height = 21
            ItemHeight = 13
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
            Left = 385
            Top = 95
            Width = 32
            Height = 20
            Caption = 'Run'
            TabOrder = 9
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object edCmd8: TTntComboBox
            Tag = 8
            Left = 24
            Top = 120
            Width = 361
            Height = 21
            ItemHeight = 13
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
            Left = 385
            Top = 119
            Width = 32
            Height = 20
            Caption = 'Run'
            TabOrder = 10
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object edCmd4: TTntComboBox
            Tag = 4
            Left = 24
            Top = 24
            Width = 361
            Height = 21
            ItemHeight = 13
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
            Left = 385
            Top = 23
            Width = 32
            Height = 20
            Caption = 'Run'
            TabOrder = 6
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object edCmd9: TTntComboBox
            Tag = 9
            Left = 24
            Top = 144
            Width = 361
            Height = 21
            ItemHeight = 13
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
            Left = 385
            Top = 143
            Width = 32
            Height = 20
            Caption = 'Run'
            TabOrder = 11
            TabStop = False
            OnClick = actBtnRunExecute
          end
          object Panel4: TTntPanel
            Left = 2
            Top = 168
            Width = 505
            Height = 28
            TabOrder = 13
            object edLogFileName: TTntComboBox
              Left = 216
              Top = 4
              Width = 265
              Height = 21
              Enabled = False
              ItemHeight = 13
              TabOrder = 0
              Text = 'log.txt'
            end
            object btnSelectLogFileName: TTntButton
              Left = 483
              Top = 4
              Width = 19
              Height = 19
              Caption = '...'
              Enabled = False
              TabOrder = 1
              OnClick = btnSelectLogFileNameClick
            end
            object chSaveLogToFile: TTntCheckBox
              Left = 8
              Top = 6
              Width = 201
              Height = 17
              Caption = 'Save log to file'
              TabOrder = 2
              OnClick = chSaveLogToFileClick
            end
          end
          object GroupBoxTimers: TTntGroupBox
            Left = 425
            Top = 7
            Width = 82
            Height = 161
            Hint = 'in second'
            Caption = 'Timers:'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            object cbRepeatTime4: TTntComboBox
              Tag = 4
              Left = 5
              Top = 16
              Width = 73
              Height = 21
              Hint = 'in second'
              ItemHeight = 13
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
              Left = 5
              Top = 40
              Width = 73
              Height = 21
              Hint = 'in second'
              ItemHeight = 13
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
              Left = 5
              Top = 64
              Width = 73
              Height = 21
              Hint = 'in second'
              ItemHeight = 13
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
              Left = 5
              Top = 88
              Width = 73
              Height = 21
              Hint = 'in second'
              ItemHeight = 13
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
              Left = 5
              Top = 112
              Width = 73
              Height = 21
              Hint = 'in second'
              ItemHeight = 13
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
              Left = 5
              Top = 136
              Width = 73
              Height = 21
              Hint = 'in second'
              ItemHeight = 13
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
        Left = 7
        Top = 10
        Width = 410
        Height = 319
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
