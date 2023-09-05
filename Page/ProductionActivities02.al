page 50108 "Production Activities 02"
{
    Caption = 'Production Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Production Cue";

    layout
    {
        area(Content)
        {
            cuegroup("Order States")
            {
                Caption = 'Order States';
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
                field("New Order - Today"; Rec."New Order - Today")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field("On Deck - Today"; Rec."On Deck - Today")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field("All Orders"; Rec."All Orders")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
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