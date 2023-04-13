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
            field(ItemClass; ItemClass)
            {
                Caption = 'Class';
                ApplicationArea = All;
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
            }
        }
        addafter(VariantMandatoryDefaultNo)
        {
            field(Recycle; Rec.Recycle)
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
            field(ItemCategoryCode; Rec."Item Category Code")
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