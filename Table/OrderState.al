table 50101 "Order State"
{
    Caption = 'State';
    DataCaptionFields = "Code", Description;
    DrillDownPageId = "Order States";
    LookupPageId = "Order States";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Description"; Text[50])
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