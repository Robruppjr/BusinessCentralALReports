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
            Caption = 'Sellbrite Sku';
            DataClassification = ToBeClassified;
        }
        field(50108; Recycle; Boolean)
        {
            DataClassification = ToBeClassified;
            ObsoleteState = Pending;
        }
        field(50111; Sellbrite; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50109; ParentCode; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category"."Parent Category";
            ObsoleteState = Pending;
        }
        field(50110; "Parent Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category"."Parent Category";
        }
        field(50112; ItemClass; Enum ItemClass)
        {
            DataClassification = ToBeClassified;
            Caption = 'Item Class';
            NotBlank = true;
        }
        field(50113; CostUpdated; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cost Updated';
        }
        field(50114; BinLocation; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Remove From View';
            TableRelation = "Bin Content"."Bin Code";
            ObsoleteState = Removed;
            //CalcFormula = lookup ("Bin Content"."Item No." where ("Item No." = field ("No.")));
        }
        field(50115; BinLocation01; Code[20])
        {
            Caption = 'Bin Location';
            TableRelation = "Bin Content"."Bin Code";
            FieldClass = FlowField;
            CalcFormula = lookup("Bin Content"."Bin Code" where("Item No." = field("No.")));
        }
        field(50116; "Tech Tier"; Text[50])
        {
            Caption = 'Tech Tier';
            TableRelation = "Tech Work Teir table".Description;
            ValidateTableRelation = false;
        }
        field(50117; "Standard Shipping Cost"; Decimal)
        {
            Caption = 'Standrad Shipping Cost';
            TableRelation = "Standard Shipping Table"."Standard Shipping Cost";
            ValidateTableRelation = false;
        }
    }
    var
        myInt: Integer;

}

tableextension 50104 CustomerExtension extends Customer
{
    fields
    {
        field(50114; CompanyName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Company Name';
        }
    }
}
