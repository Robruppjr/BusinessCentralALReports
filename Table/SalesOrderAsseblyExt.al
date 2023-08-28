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
        field(50120; "Item Category"; Code[20])
        {

            TableRelation = "Item Category" where(Code = field("Item Category"));
            ValidateTableRelation = false;
            trigger OnValidate();
            var
                Item: Record Item;
                ItemCatgoryTable: Record "Item Category";
                ItemCategory: Code[20];
            begin
                if Item.Get("No.") then
                    "Item Category" := Item."Item Category Code";
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
            TableRelation = "Sales Header".Amount where("Amount" = field(Amount));
            trigger OnValidate()
            begin
                SetCurrentFieldNum(FieldNo(Amount));
                if Amount <> 0 then begin
                    Amount := SalesHeader.Amount;
                end;
            end;
        }
        field(50122; "Customer Name"; Text[100])
        {
            TableRelation = "Sales Header" where("Sell-to Customer Name" = field("Customer Name"));
            trigger OnValidate()
            begin
                SetCurrentFieldValue(FieldName("Customer Name"));
                if "Customer Name" <> '' then begin
                    "Customer Name" := SalesHeader."Sell-to Customer Name";
                end;
            end;
        }
        field(50125; "External Document No."; Code[35])
        {

        }
        field(50123; "Item Category"; Code[20])
        {
            ObsoleteState = Pending;
        }
        field(50124; "Unit Price"; Decimal)
        {
            ObsoleteState = Pending;
        }
        field(50126; "State"; Code[20])
        {
            Caption = 'Order State';
            TableRelation = "Order State";
            ValidateTableRelation = false;
            ObsoleteState = Pending;
        }
        field(50130; "State Desc"; Text[200])
        {
            Caption = 'Order State';
            TableRelation = "Order State".Description;
            ValidateTableRelation = false;
        }
        field(50127; Technician; Code[20])
        {
            Caption = 'Technician';
            TableRelation = Technician;
            ValidateTableRelation = false;
            ObsoleteState = Removed;
        }
        field(50129; "Tech Name"; Text[100])
        {
            Caption = 'Tech Name';
            TableRelation = Technician.Description;
            ValidateTableRelation = false;
        }
        field(50128; "Order Count"; code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Assemble-to-Order Link"."Document No." where("Assembly Document Type" = field("Document Type"),
                                                                                "Assembly Document No." = field("No.")));
        }
    }

    local procedure SetCurrentFieldNum(NewCurrentFieldNum: Integer): Boolean
    begin
        if CurrentFieldNum = 0 then begin
            CurrentFieldNum := NewCurrentFieldNum;
            exit(true);
        end;
        exit(false);
    end;

    local procedure SetCurrentFieldValue(NewCurrentFieldValue: Text): Boolean
    begin
        if CurrentFieldValue = '' then begin
            CurrentFieldValue := NewCurrentFieldValue;
            exit(true);
        end;
        exit(false);
    end;

    var
        AssemblyHeader: Record "Assembly Header";
        SalesHeader: Record "Sales Header";
        CurrentFieldNum: Integer;
        CurrentFieldValue: Text;
}