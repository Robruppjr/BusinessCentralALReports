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
        Qty: Integer;
        TotalSalesLine3: Record "Sales Line";

    local procedure CalcProfitLCY(): Decimal
    begin
        AmountLCY := 0;
        CostLCY := 0;
        ProfitLCY := 0;
        Qty := 0;
        TotalSalesLine3.SetRange("Document Type", Rec."Document Type");
        TotalSalesLine3.SetRange("Document No.", Rec."Document No.");

        if TotalSalesLine3.FindSet() then begin
            repeat
                AmountLCY := AmountLCY + TotalSalesLine3.Amount;
                CostLCY := CostLCY + TotalSalesLine3."Unit Cost";
                Qty := Qty + TotalSalesLine3.Quantity;
            until 0 = TotalSalesLine3.Next()
        end;
        ProfitLCY := AmountLCY - (CostLCY * Qty);
        exit(ProfitLCY);
    end;
}

pageextension 50114 SalesHeaderExt extends "Sales Order"
{
    layout
    {
        moveafter("External Document No."; "Location Code")
        moveafter("External Document No."; "Shortcut Dimension 1 Code")
        moveafter("External Document No."; "Salesperson Code")
        modify("Salesperson Code")
        {
            Importance = Promoted;
            ShowMandatory = true;
            Visible = true;
        }
        modify("Shortcut Dimension 1 Code")
        {
            ShowMandatory = true;
        }
    }

}
pageextension 50119 SalesOrdersExt extends "Sales Order List"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Order State"; GetOrderState())
            {
                ApplicationArea = all;
            }
        }

    }

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin

    end;

    local procedure GetOrderState(): Text[200];
    var
        AssemblyHead: Record "Assembly Header";
        SalesHead: Record "Sales Header";
        AssembleToOrder: Record "Assemble-to-Order Link";
        orderState: Text[200];
    begin
        AssembleToOrder.SetCurrentKey("Document Type", "Document No.");
        orderState := '';
        AssembleToOrder.SetRange("Document Type", Rec."Document Type");
        AssembleToOrder.SetRange("Document No.", Rec."No.");
        if AssembleToOrder.FindSet() then begin
            repeat

                if AssemblyHead.Get(AssembleToOrder."Assembly Document Type", AssembleToOrder."Assembly Document No.") then begin
                    if orderState <> '' then
                        orderState += ' | ' + AssemblyHead."State Desc"
                    else
                        orderState := AssemblyHead."State Desc";
                end;

            until AssembleToOrder.Next() = 0;
        end;
        exit(orderState);
    end;
}