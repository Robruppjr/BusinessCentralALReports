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
                Caption = 'Assinged Orders';
                field("No Assigned Tech"; Rec."No Assigned Tech")
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    DrillDownPageId = "Assembly Orders";
                }
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