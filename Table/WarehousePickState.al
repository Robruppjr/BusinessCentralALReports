table 50100 "Warehouse Pick State"
{
    Caption = 'State';
    DataCaptionFields = "Code", Description;
    DrillDownPageId = "Warehouse Pick States";
    LookupPageId = "Warehouse Pick States";

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