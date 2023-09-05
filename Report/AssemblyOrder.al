reportextension 50108 "AssemblyOrder2023" extends "Assembly Order"
{
    RDLCLayout = 'AssemblyOrder2023.rdlc';


    dataset
    {
        //SO COunt field
        add("Assembly Header")
        {
            column(Customer_Name; "Customer Name")
            {

            }
            /*column(SOCount; GetSOCount())
            {

            }*/

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
}

