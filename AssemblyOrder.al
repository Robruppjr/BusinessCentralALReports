reportextension 50108 "AssemblyOrder2023" extends "Assembly Order"
{
    RDLCLayout = 'AssemblyOrder2023.rdlc';

    dataset
    {
        add("Assembly Line")
        {
            column(Item_Category;"Item Category")
            {}
            column(Unit_Cost;"Unit Cost")
            {}
        }
        add("Assembly Header")
        {
            column(Amount; Amount)
            {}
            column(Customer_Name; "Customer Name")
            {}
        }
    }
    var
    Item: Record "Item";
    AssemblyOrder: record "Assembly Header";
    SalesHeader: record "Sales Header";
    Customer : record Customer;
}