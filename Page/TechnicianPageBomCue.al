page 50112 "Technician BomSqaud Cue"
{
    Caption = 'Upcoming Picks(In Process)';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Warehouse State Cue";
    layout
    {
        area(Content)
        {
            cuegroup("Upcoming Picks (IN PROCESS)")
            {
                field("New Order"; Rec."New Order")
                {
                    Caption = 'Not Started';
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
