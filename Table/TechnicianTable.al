table 50103 Technician
{
    Caption = 'Technician';
    DataCaptionFields = "Code", Description;
    DrillDownPageId = Technicians;
    LookupPageId = Technicians;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Description)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; "Code", Description)
        {
        }
    }
}