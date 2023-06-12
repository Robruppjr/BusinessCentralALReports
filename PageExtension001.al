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

        }
        addafter(GTIN)
        {
            field(ParentCode; ParentCode)
            {
                Caption = 'Parent Category';
                ToolTip = 'Parent Category';
                ApplicationArea = All;
                Editable = false;
                TableRelation = "Item Category"."Parent Category";
                ObsoleteState = Pending;
            }
        }
        addafter(VariantMandatoryDefaultNo)
        {
            field(Recycle; Rec.Recycle)
            {
                ApplicationArea = All;
                ObsoleteState = Pending;
            }
            field(Sellbrite; Rec.Sellbrite)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
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
            field(MPN; Rec.MPN)
            {
                ApplicationArea = All;
            }
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
            }
            field("Item Category";Rec."Parent Category")
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
            field("Item Category";Rec."Item Category")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Category';
                TableRelation = "Item Category"."Parent Category";
            }
        }
    }
}

pageextension 50106 AssemblyHeaderExtension extends "Assembly Order"
{

    layout
    {
        addafter("Description")
        {
            field("Amount"; Rec.Amount)
            {
                ApplicationArea = All;
                TableRelation = "Sales Header".Amount;
            }
            field("Customer Name"; Rec."Customer Name")
            {
                ApplicationArea = All;
                TableRelation = "Sales Header"."Bill-to Name";
            }
        }
    }
    actions
    {

    }
}

pageextension 50107 ExtendingPurchaseInvoice extends "Purchase Quotes"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Shipment No.";Rec."Vendor Shipment No.")
            {
                ApplicationArea = all;
            }
            field("Vendor Order No.";Rec."Vendor Order No.")
            {
                ApplicationArea = all;
            }
        }
    }
}