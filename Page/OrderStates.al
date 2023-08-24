page 50101 "Order States"
{
    AdditionalSearchTerms = 'states';
    ApplicationArea = all;
    Caption = 'Order States';
    PageType = List;
    SourceTable = "Order State";
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