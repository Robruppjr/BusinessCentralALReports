pageextension 50106 EditingPurchaseOrder extends "Purchase Order"
{
    layout
    {

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
        buyPrice: Decimal;

    trigger OnAfterInsert()
    begin
        buyPrice: Item."Standard Cost"
    end;
}