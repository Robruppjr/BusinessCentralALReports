pageextension 50106 EditingPurchaseOrder extends "Line"
{
    layout
    {
        addafter()
        {
            field("Standard Cost"; Rec."Standard Cost")
            {
                ApplicationArea = All;
            }
            field(BuyPrice; Rec.BuyPrice)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}

tableextension 50107 EditingLineTableOfPO extends "Purchase Line"
{
    fields
    {
        field(50108; "Standard Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."Standard Cost";
        }
        field(50109; BuyPrice; Decimal)
        {
            Caption = 'Buy Price';
        }
    }

    var
        myInt: Integer;
        BuyPrice: Decimal;


    trigger OnAfterInsert()
    var
        Item: Record Item;
    begin
        BuyPrice := Item."Standard Cost" * 0.75;
        Rec.Modify();
    end;
}