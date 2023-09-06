table 50107 "Tech Work Teir table"
{
    Caption = 'Tech Teir';
    DataCaptionFields = "Code", Description, "Cost";
    DrillDownPageId = TechWorkTeir;
    LookupPageId = TechWorkTeir;

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
        field(3; "Cost"; Decimal)
        {
            Caption = 'Tech Cost';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; "Code", Description, Cost)
        {

        }
    }

}