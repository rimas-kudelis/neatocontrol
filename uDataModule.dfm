object ModuleMain: TModuleMain
  OldCreateOrder = False
  Left = 295
  Top = 408
  Height = 223
  Width = 248
  object XPManifest1: TXPManifest
    Left = 12
    Top = 8
  end
  object SaveDialogLogFile: TSaveDialog
    Filter = 'TXT|*.txt|ALL|*.*'
    InitialDir = '.'
    Left = 88
    Top = 8
  end
  object TimerRunCmd: TTimer
    OnTimer = TimerRunCmdTimer
    Left = 16
    Top = 64
  end
end
