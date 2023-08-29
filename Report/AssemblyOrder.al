reportextension 50108 "AssemblyOrder2023" extends "Assembly Order"
{
    RDLCLayout = 'AssemblyOrder2023.rdlc';

    dataset
    {

    }
    var
        Item: Record "Item";
        AssemblyOrder: record "Assembly Header";
        SalesHeader: record "Sales Header";
        Customer: record Customer;
}