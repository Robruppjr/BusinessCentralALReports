table 50119 "Standard Shipping"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
}

table 50120 "Standard Shipping Table"
{
    Caption = 'Standard Shipping';
    DataCaptionFields = "Code", Description, "Standard Shipping Cost";
    DrillDownPageId = "Standard Shipping List";
    LookupPageId = "Standard Shipping List";

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
        field(3; "Standard Shipping Cost"; Decimal)
        {
            Caption = 'Shipping Cost';
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
        fieldgroup(DropDown; Code, "Standard Shipping Cost", Description)
        {
        }
    }
    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}