page 50109 "Service Manager BomSqaud Cue"
{
    Caption = 'BOMSquad Pending Orders';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Service Manager BOMSquad Cues";
    layout
    {
        area(Content)
        {
            cuegroup("Upcoming Picks (IN PROCESS)")
            {
                field("Not Started"; Rec."Not Started")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Warehouse Picks";
                }
                field(Start; Rec.Start)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Warehouse Picks";
                }
                field(WFP; Rec.WFP)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Warehouse Picks";
                }
                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Warehouse Picks";
                }
            }
        }
    }
}