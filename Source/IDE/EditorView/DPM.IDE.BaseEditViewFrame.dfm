object DPMBaseEditViewFrame: TDPMBaseEditViewFrame
  Left = 0
  Top = 0
  Width = 1010
  Height = 581
  TabOrder = 0
  object ContentPanel: TPanel
    Left = 0
    Top = 0
    Width = 1010
    Height = 581
    Align = alClient
    BevelEdges = [beTop]
    BevelOuter = bvNone
    Caption = 'ContentPanel'
    Constraints.MinWidth = 320
    ParentColor = True
    ShowCaption = False
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 592
      Top = 0
      Width = 8
      Height = 581
      Align = alRight
      MinSize = 300
      ResizeStyle = rsUpdate
      ExplicitLeft = 294
      ExplicitHeight = 240
    end
    object PackageListPanel: TPanel
      Left = 0
      Top = 0
      Width = 592
      Height = 581
      Align = alClient
      BevelEdges = [beRight]
      BevelOuter = bvNone
      Caption = 'PackageListPanel'
      ParentBackground = False
      ParentColor = True
      ShowCaption = False
      TabOrder = 0
    end
    object DetailPanel: TPanel
      Left = 600
      Top = 0
      Width = 410
      Height = 581
      Align = alRight
      BevelEdges = [beRight]
      BevelOuter = bvNone
      Caption = 'DetailPanel'
      Constraints.MinWidth = 400
      ParentBackground = False
      ParentColor = True
      ShowCaption = False
      TabOrder = 1
    end
  end
  object platformChangeDetectTimer: TTimer
    Enabled = False
    Interval = 500
    Left = 318
    Top = 408
  end
end
