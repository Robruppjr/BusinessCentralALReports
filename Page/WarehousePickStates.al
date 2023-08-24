page 50100 "Warehouse Pick States"
{
    AdditionalSearchTerms = 'states';
    ApplicationArea = all;
    Caption = 'Warehouse Pick States';
    PageType = List;
    SourceTable = "Warehouse Pick State";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}