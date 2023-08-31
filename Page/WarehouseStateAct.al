page 50106 "Warehouse Picks State"
{
    Caption = 'Pick Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Warehouse State Cue";

    layout
    {
        area(Content)
        {
            cuegroup("Pick States")
            {
                Caption = 'Pick States';
                field("New Order"; Rec."New Order")
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
                field("All Picks"; Rec."All Picks")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Warehouse Picks";
                }
                field("End"; Rec."End")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Registered Whse. Picks";
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

        Rec.SetRange("Date Filter", 0D, WorkDate());
    end;
}