object DPMEditViewFrame: TDPMEditViewFrame
  Left = 0
  Top = 0
  Width = 978
  Height = 661
  Margins.Top = 0
  Constraints.MinWidth = 500
  DoubleBuffered = True
  ParentDoubleBuffered = False
  TabOrder = 0
  object ContentPanel: TPanel
    Left = 0
    Top = 0
    Width = 978
    Height = 661
    Align = alClient
    BevelEdges = [beTop]
    BevelOuter = bvNone
    Caption = 'ContentPanel'
    Constraints.MinWidth = 400
    ParentColor = True
    ShowCaption = False
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 534
      Top = 0
      Width = 8
      Height = 661
      Align = alRight
      MinSize = 300
      ResizeStyle = rsUpdate
      ExplicitLeft = 532
      ExplicitHeight = 556
    end
    object PackageListPanel: TPanel
      Left = 0
      Top = 0
      Width = 534
      Height = 661
      Align = alClient
      BevelEdges = [beRight]
      BevelOuter = bvNone
      Caption = 'PackageListPanel'
      ParentBackground = False
      ParentColor = True
      ShowCaption = False
      TabOrder = 0
    end
    inline PackageDetailsFrame: TPackageDetailsFrame
      Left = 542
      Top = 0
      Width = 436
      Height = 661
      Align = alRight
      Constraints.MinWidth = 300
      DoubleBuffered = True
      Color = clWindow
      ParentBackground = False
      ParentColor = False
      ParentDoubleBuffered = False
      TabOrder = 1
      ExplicitLeft = 542
      ExplicitHeight = 661
      inherited sbPackageDetails: TScrollBox
        Height = 661
        ExplicitHeight = 661
      end
    end
  end
  object platformChangeDetectTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = platformChangeDetectTimerTimer
    Left = 318
    Top = 408
  end
end