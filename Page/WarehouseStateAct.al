page 50106 "Warehouse Picks State"
{
    Caption = 'Inventory Pick Activities';
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
                field("End"; Rec."End")
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
    end;
}