page 50107 "Technician Cues"
{
    Caption = 'Technicians';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Technician Cues";

    layout
    {
        area(Content)
        {
            cuegroup("Technician Cues")
            {
                Caption = 'Assigned Orders';

                field(Tech01; Rec.Tech01)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field(Tech02; Rec.Tech02)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field(Tech03; Rec.Tech03)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field(Tech04; Rec.Tech04)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field(Tech99; Rec.Tech99)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field("Given to Shipping"; Rec."Given to Shipping")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field("Local Pickup"; Rec."Local Pickup")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field("Shipped Today"; Rec."Shipped Today")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Posted Assembly Orders";

                }
                field("Partial Shipment"; Rec."Partial Shipment")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                field(WFS; Rec.WFS)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
                cuegroup("Order Status")
                {
                    Caption = 'Order Status (Today)';

                    field("Priority A."; Rec."Priority A.")
                    {
                        ApplicationArea = all;
                        DrillDown = true;
                        DrillDownPageId = "Assembly Orders";
                    }
                    field("Available A."; Rec."Available A.")
                    {
                        ApplicationArea = all;
                        DrillDown = true;
                        DrillDownPageId = "Assembly Orders";
                    }
                    field("All Asigned"; Rec."All Asigned")
                    {
                        ApplicationArea = all;
                        DrillDown = true;
                        DrillDownPageId = "Assembly Orders";
                    }
                    field("No Assigned Tech"; Rec."No Assigned Tech")
                    {
                        Caption = 'Pending';
                        ApplicationArea = all;
                        DrillDown = true;
                        DrillDownPageId = "Assembly Orders";
                    }
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