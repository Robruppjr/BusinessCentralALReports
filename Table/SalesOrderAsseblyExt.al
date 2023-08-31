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

        }
        field(50122; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';

            //FieldClass = FlowField;
            //CalcFormula = lookup("Sales Header"."Bill-to Name" where())
            //trigger OnValidate()
            /*begin
                SetCurrentFieldNum(FieldNo("Order Count"));
                if "Order Count" <> '' then begin
                    GetSalesOrder();
                    "Customer Name" := SalesHeader."Bill-to Name";
                end;
                AssemblyHeaderReserve.VerifyChange(Rec, xRec);
                ClearCurrentFieldNum(FieldNo("Order Count"));
            end;*/
        }
        field(50125; "External Document No."; Code[35])
        {

        }
        field(50123; "Item Category"; Code[20])
        {
            ObsoleteState = Removed;
        }
        field(50124; "Unit Price"; Decimal)
        {
            ObsoleteState = Removed;
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
        field(50128; "Order Count"; code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Assemble-to-Order Link"."Document No." where("Assembly Document Type" = field("Document Type"),
                                                                                "Assembly Document No." = field("No.")));
        }
        field(50129; "Tech Name"; Text[100])
        {
            Caption = 'Tech Name';
            TableRelation = Technician.Description;
            ValidateTableRelation = false;
        }
        field(50131; "Tech Work Code"; Code[20])
        {
            //not used
            //FieldClass = FlowField;
            //CalcFormula = lookup("Tech Work Teir table".Code where(Description = field(TechWorkTeir)));
        }
        field(50104; "TechWorkTeir"; Text[50])
        {
            Caption = 'Tech Tier';
            TableRelation = "Tech Work Teir table".Description;
            ValidateTableRelation = false;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Rec.CalcFields("TechTeir Cost");
            end;
        }
        field(50106; "Tech Teir Cost"; Decimal)
        {
            Caption = 'Tech Tier Cost';
            trigger OnLookup()
            begin
                SetCurrentFieldValue(FieldCaption("Tech Work Code"));
                if "TechWorkTeir" <> '' then begin
                    "Tech Teir Cost" := "Tech Teir Cost";
                end;
            end;

        }
        field(50107; "TechTeir Cost"; Decimal)
        {
            Caption = 'Tech Tier Cost';
            FieldClass = FlowField;
            CalcFormula = lookup("Tech Work Teir table".Cost where(Description = field(TechWorkTeir)));
        }
        field(50105; "Service Tag"; Text[100])
        {
            Caption = 'Service Tag';
        }
    }

    local procedure GetSalesOrder()
    begin
        TestField("Order Count");
        if SalesHeader."No." <> "Order Count" then
            SalesHeader.Get("Order Count");
    end;

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

    local procedure ClearCurrentFieldNum(NewCurrentFieldNum: Integer)
    begin
        if CurrentFieldNum = NewCurrentFieldNum then
            CurrentFieldNum := 0;
    end;

    var
        AssemblyHeader: Record "Assembly Header";
        SalesHeader: Record "Sales Header";
        CurrentFieldNum: Integer;
        CurrentFieldValue: Text;
        AssemblyHeaderReserve: Codeunit "Assembly Header-Reserve";
}