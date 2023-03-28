tableextension 50103 MyExtension extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50104; MPN; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; Model; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; LegacyId; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50108; Recycle; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}