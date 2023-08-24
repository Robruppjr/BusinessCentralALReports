page 50106 "Warehouse Picks State"
{
    Caption = 'Activities';
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
                field(WFP; Rec.WFP)
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