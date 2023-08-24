page 50102 Technicians
{
    ApplicationArea = all;
    Caption = 'Technicians List';
    PageType = List;
    SourceTable = Technician;
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