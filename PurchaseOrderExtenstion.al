tableextension 50107 EditingLineTableOfPO extends "Purchase Line"
{
    fields
    {
        field(50108; "Standard Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."Standard Cost";
            ObsoleteState = Pending;
        }
        field(50109; BuyPrice; Decimal)
        {
            Caption = 'Buy Price';
            ObsoleteState = Pending;
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

tableextension 50108 AssemblyExtension extends "Assembly Line"
{
    fields
    {
        field(50120;"Item Category"; Code[20])
        {

            TableRelation = "Item Category";
            ValidateTableRelation = false;
            trigger OnValidate();
                var
                Item: Record Item; 
                ItemCatgoryTable: Record "Item Category";  
                ItemCategory: Code[20];
            begin
                if Item.Get("No.") then
                    ItemCategory := Item."Item Category Code";
                    if ItemCatgoryTable.Get(ItemCatgoryTable.Code) then
                    "Item Category" := ItemCatgoryTable."Parent Category";
            end;
        }   
    }
}

tableextension 50109 AssenblyHeaderExtension extends "Assembly Header"
{
    fields
    {
        field(50121; "Amount"; Decimal)
        {
            TableRelation = "Sales Header".Amount;
            ValidateTableRelation = false;
            trigger OnValidate();
                var
                SalesOrder: Record "Sales Header";
                begin
                    if SalesOrder.Get(SalesOrder."Document Type",SalesOrder."No.") then
                    "Amount" := SalesOrder.Amount;
                end;
        }
        field(50122; "Customer Name"; Text[100])
        {
            TableRelation = "Sales Header"."Bill-to Name";
            ValidateTableRelation = false;
            trigger OnValidate();
            var
                SalesHeader: Record "Sales Header";
            begin
                if SalesHeader.Get(SalesHeader."Document Type",SalesHeader."No.") then
                "Customer Name" := SalesHeader."Bill-to Name";
            end;
        }
        field(50123; "Item Category"; Code[20])
        {
            ObsoleteState = Pending;
        }
         field(50124; "Unit Price"; Decimal)
         {
            ObsoleteState = Pending;
         }
    }
}