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
            ObsoleteState = Pending;
        }
        field(50121; "Item Tech Tier"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Tech Tier" where("No." = field("No.")));
        }
        field(50122; "Item Category Code"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Item Category Code" where("No." = field("No.")));
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
            //REMOVED
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

    trigger OnAfterModify()
    var
        myInt: Integer;
    begin
        GetTechTier();
    end;

    local procedure GetTechTier()
    var
        AssemblyLine: Record "Assembly Line";
    begin
        AssemblyLine.CalcFields("Item Tech Tier");
        AssemblyLine.SetCurrentKey("Document Type", "Document No.", "Item Tech Tier");
        AssemblyLine.SetRange("Document Type", Rec."Document Type");
        AssemblyLine.SetRange("Document No.", Rec."No.");
        AssemblyLine.SetFilter("Item Tech Tier", '<> %1', '');
        if AssemblyLine.FindFirst() then begin
            Rec.Validate(TechWorkTeir, AssemblyLine."Item Tech Tier");
        end;
    end;

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