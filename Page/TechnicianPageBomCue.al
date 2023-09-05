page 50112 "Technician BomSqaud Cue"
{
    Caption = 'Upcoming Picks(In Process)';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Service Manager BOMSquad Cues";
    layout
    {
        area(Content)
        {
            cuegroup("Service Manager BOMSquad Cues")
            {
                field("Not Started"; Rec."Not Started")
                {
                    ApplicationArea = all;
                }
                field(Start; Rec.Start)
                {
                    ApplicationArea = all;

                }
                field(WFP; Rec.WFP)
                {
                    ApplicationArea = all;

                }
                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = all;

                }
            }
        }
    }
}