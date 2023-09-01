reportextension 50108 "AssemblyOrder2023" extends "Assembly Order"
{
    RDLCLayout = 'AssemblyOrder2023.rdlc';


    dataset
    {
        //SO COunt field
        add("Assembly Header")
        {
            column(Customer_Name; "Assembly Header"."Customer Name")
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
    begin
        if AssemblyOrder.Get("Assembly Header"."Customer Name") then begin
            Customer_Name := "Assembly Header"."Customer Name";
        end;
    end;*/
}

