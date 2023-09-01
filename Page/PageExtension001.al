pageextension 50103 MyExtension extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field(LegacyId; Rec.LegacyId)
            {
                ApplicationArea = All;
            }
            field(MPN; Rec.MPN)
            {
                ApplicationArea = All;
            }
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
            }
            field(ItemClass; Rec.ItemClass)
            {
                Caption = 'Class';
                ApplicationArea = All;
                NotBlank = true;
            }
            field("Tech Tier"; Rec."Tech Tier")
            {
                ApplicationArea = all;
            }

        }
        addafter(VariantMandatoryDefaultNo)
        {

            field(Sellbrite; Rec.Sellbrite)
            {
                ApplicationArea = All;
            }
        }
        addafter("Standard Cost")
        {
            field(CostUpdated; Rec.CostUpdated)
            {
                ApplicationArea = all;
            }
        }
        addafter("Shelf No.")
        {
            field(BinLocation01; Rec.BinLocation01)
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("Item/Vendor Catalog")
        {
            action("Inventory Evaluation")
            {
                Caption = 'Inventory Evaluation';
                ApplicationArea = All;
                Image = ExecuteBatch;
                RunObject = report "Inventory Valuation";
            }
            action("Print Label")
            {
                ApplicationArea = All;
                Image = Print;
                RunObject = report "MPN 4x2 Label";

            }
        }

    }
    /* trigger OnAfterGetRecord()
     var
         ItemCategory: Record "Item Category";
     begin
         ItemCategory.SetFilter(Code, Rec."Parent Category");
         if (ItemCategory.Find('-')) then begin
             ParentCode := ItemCategory."Parent Category";
             Rec.Modify();
         end;

     end;*/
    var
        myInt: Integer;
        ItemClass: Enum ItemClass;
        ParentCode: Code[20];
}

pageextension 50104 MyExtension01 extends "Item List"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field(LegacyId; Rec.LegacyId)
            {
                ApplicationArea = All;
            }
            field(BinLocation01; Rec.BinLocation01)
            {
                ApplicationArea = all;
                Editable = false;
            }
            field(MPN; Rec.MPN)
            {
                ApplicationArea = All;
            }
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
            }
            field("Item Category"; Rec."Parent Category")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Parent Category';
                TableRelation = "Item Category"."Parent Category";
            }
            field(ItemClass; Rec.ItemClass)
            {
                ApplicationArea = All;
                NotBlank = true;
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

pageextension 50105 AssemblyExtension extends "Assembly Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Item Category Code"; Rec."Item Category Code")
            {
                ApplicationArea = All;
                Caption = 'Item Category';
            }
        }
    }
}

pageextension 50106 AssemblyHeaderExtension extends "Assembly Order"
{

    layout
    {
        addafter(Description)
        {
            field("Customer Name"; GetCustName())
            {
                ApplicationArea = all;

            }
            field(Amount; GetAmount())
            {
                ApplicationArea = all;
            }
            field("External Document No."; GetExternalDocumentNo())
            {
                ApplicationArea = all;
            }
        }
        addafter(Status)
        {
            field("State Desc"; Rec."State Desc")
            {
                ApplicationArea = All;
            }
            field("Tech Name"; Rec."Tech Name")
            {
                ApplicationArea = all;
            }
            field(TechWorkTeir; Rec.TechWorkTeir)
            {
                ApplicationArea = all;
            }
            field("Order Count"; Rec."Order Count")
            {
                Caption = 'Sales Order Number';
                ApplicationArea = all;
            }
            field(GetSOCount; GetSOCount)
            {
                Caption = 'SO Count';
                ApplicationArea = all;

            }
            field("Service Tag"; Rec."Service Tag")
            {
                Caption = 'Service Tag';
                ApplicationArea = all;
            }
            field(CalcLaborCost; CalcLaborCost)
            {
                Caption = 'Labor Cost';
                ApplicationArea = all;
            }
            field("TechTeir Cost"; Rec."TechTeir Cost")
            {
                //Before Publish to production clean up 'Tech Tier Cost'
                ApplicationArea = all;
            }
        }

    }
    actions
    {

    }
    trigger OnAfterGetRecord()
    begin
        GetCustName();
        GetSOCount();
    end;

    local procedure CalcLaborCost(): Decimal;
    var
        laborTotalCost: Decimal;
        qty: Decimal;
        techCost: Decimal;
    begin
        Rec.CalcFields("TechTeir Cost");
        qty := Rec.Quantity;
        techCost := Rec."TechTeir Cost";
        //techCost := Tech Work Teir.Cost the value should be gotten from the selected Tech Teir
        laborTotalCost := qty * techCost;
        exit(laborTotalCost);
    end;


    local procedure GetSOCount(): Integer;
    var
        orderLink: Record "Assemble-to-Order Link";
        counter: Integer;
    begin
        Rec.CalcFields("Order Count");
        counter := 0;
        orderLink.SetCurrentKey("Document Type", "Document No.");
        orderLink.SetRange("Document Type", orderLink."Document Type"::Order);
        orderLink.SetRange("Document No.", Rec."Order Count");
        if orderLink.FindSet() then begin
            repeat
                counter := counter + 1;
            until 0 = orderLink.Next();
        end;
        exit(counter);
    end;

    local procedure GetCustName(): Text[100];
    var
        SalesHead: Record "Sales Header";
    begin
        Rec.CalcFields("Order Count");
        if SalesHead.Get(1, Rec."Order Count") then begin
            exit(SalesHead."Bill-to Name");
        end else
            exit('');
    end;

    local procedure GetAmount(): Decimal;
    var
        SalesHead: Record "Sales Header";
    begin
        Rec.CalcFields("Order Count");
        if SalesHead.Get(1, Rec."Order Count") then begin
            exit(SalesHead.Amount);
        end else
            exit(0);
    end;

    local procedure GetExternalDocumentNo(): Code[35];
    var
        SalesHead: Record "Sales Header";
    begin
        Rec.CalcFields("Order Count");
        if SalesHead.Get(1, Rec."Order Count") then begin
            exit(SalesHead."External Document No.");
        end else
            exit('');
    end;
}

pageextension 50107 ExtendingPurchaseInvoice extends "Purchase Quotes"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Shipment No."; Rec."Vendor Shipment No.")
            {
                ApplicationArea = all;
            }
            field("Vendor Order No."; Rec."Vendor Order No.")
            {
                ApplicationArea = all;
            }
        }
    }
}
pageextension 50108 ExtendingAssemblyOrders extends "Assembly Orders"
{
    layout
    {
        addafter("No.")
        {
            field("Customer Name"; GetCustName())
            {
                ApplicationArea = all;

            }
            field("Tech Name"; Rec."Tech Name")
            {
                ApplicationArea = all;
            }
            field(TechWorkTeir; Rec.TechWorkTeir)
            {
                ApplicationArea = all;
            }
        }

    }
    local procedure GetCustName(): Text[100];
    var
        SalesHead: Record "Sales Header";
    begin
        Rec.CalcFields("Order Count");
        if SalesHead.Get(1, Rec."Order Count") then begin
            exit(SalesHead."Bill-to Name");
        end else
            exit('');
    end;
}

pageextension 50109 ExtendCustomerHeader extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field(CompanyName; Rec.CompanyName)
            {
                ApplicationArea = all;
            }
        }
    }
}
