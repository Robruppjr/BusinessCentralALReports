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
        field(50109; ParentCode; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category"."Parent Category";
        }
        field(50110; "Parent Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category"."Parent Category";
        }
    }
    var
        myInt: Integer;

}