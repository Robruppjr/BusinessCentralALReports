page 50110 "TechWorkTeir"
{
    ApplicationArea = all;
    Caption = 'Tech Work Teir List';
    PageType = List;
    SourceTable = "Tech Work Teir table";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Code; Rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}