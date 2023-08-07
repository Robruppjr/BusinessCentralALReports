pageextension 50113 SalesPageExt extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Amount Including VAT")
        {
            field("ProfitLCY"; CalcProfitLCY())
            {
                ApplicationArea = Basic, Suite;
                AutoFormatType = 1;
                Caption = 'Profit ($)';
                Editable = false;
                Importance = Additional;
                ToolTip = 'Specifies the profit expressed as an amount.  ';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        ProfitLCY: Decimal;
        AmountLCY: Decimal;
        CostLCY: Decimal;
        TotalSalesLine3: Record "Sales Line";

    local procedure CalcProfitLCY(): Decimal
    begin
        AmountLCY := 0;
        CostLCY := 0;
        ProfitLCY := 0;
        TotalSalesLine3.SetRange("Document Type", Rec."Document Type");
        TotalSalesLine3.SetRange("Document No.", Rec."Document No.");

        if TotalSalesLine3.FindSet() then begin
            repeat
                AmountLCY := AmountLCY + TotalSalesLine3.Amount;
                CostLCY := CostLCY + TotalSalesLine3."Unit Cost";
            until 0 = TotalSalesLine3.Next()
        end;
        ProfitLCY := AmountLCY - CostLCY;
        exit(ProfitLCY);
    end;
}