reportextension 50108 "AssemblyOrder2023" extends "Assembly Order"
{
    RDLCLayout = 'AssemblyOrder2023.rdlc';


    dataset
    {
        //SO COunt field
        add("Assembly Header")
        {
            column(Customer_Name; GetCustName())
            {

            }
            column(SOCount; GetSOCount())
            {

            }

        }
        add("Assembly Line")
        {
            column(Item_Category_Code; "Item Category Code")
            {

            }
        }

    }
    /*trigger OnPostReport()
    var
        AssemblyOrder: Record "Assembly Header";
        SalesHeader: Record "Sales Header";
        Customer_Name: Text[100];
        AssembNo: Code[20];
    begin
        if AssemblyOrder.Get(CurrReport."Assembly Header"."No.") then begin
            Customer_Name := AssemblyOrder."Customer Name";
        end;
    end;*/
    local procedure GetSOCount(): Integer;
    var
        orderLink: Record "Assemble-to-Order Link";
        counter: Integer;
    begin
        "Assembly Header".CalcFields("Order Count");
        counter := 0;
        orderLink.SetCurrentKey("Document Type", "Document No.");
        orderLink.SetRange("Document Type", orderLink."Document Type"::Order);
        orderLink.SetRange("Document No.", "Assembly Header"."Order Count");
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
        "Assembly Header".CalcFields("Order Count");
        if SalesHead.Get(1, "Assembly Header"."Order Count") then begin
            exit(SalesHead."Bill-to Name");
        end else
            exit('');
    end;
}

