pageextension 50117 PostedAssemblyPage extends "Posted Assembly Order"
{
    layout
    {
        addafter(Reversed)
        {
            field(Technician; Rec.Technician)
            {
                ApplicationArea = all;
            }
            field("Tech Teir"; Rec."Tech Teir")
            {
                ApplicationArea = all;
            }
        }
    }
}

pageextension 50118 PostedAssemblyList extends "Posted Assembly Orders"
{
    layout
    {
        addafter("No.")
        {
            field(Technician; Rec.Technician)
            {
                ApplicationArea = all;
            }
            field("Tech Teir"; Rec."Tech Teir")
            {
                ApplicationArea = all;
            }
        }
    }
}