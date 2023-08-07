/*report 50110 "Report of Items in Assembly"
{
        UsageCategory = Administration;
        ApplicationArea = All;
        DefaultLayout = RDLC;
        RDLCLayout = 'AssemblySalesReport2023.rdlc';
        dataset
        {
            dataitem(SalesHeader; "Sales Header")
            {
                DataItemTableView = sorting("Document Type", "No.");
                RequestFilterFields = "No.";
                column(No_Order;SalesHeader."No.")
                {}
                column(Salesperson_Code;SalesHeader."Salesperson Code")
                {}

            }
            dataitem(PostedAssemblyHeader;"Posted Assembly Header")
            {
                DataItemTableView = sorting("Order No.");
                DataItemLink = "Order No." = field("No.");
            }
            dataitem(PostedAssemblyLine;"Posted Assembly Line")
            {
                column(Item_No;"No.")
                {}
                column(Description;Description)
                {}
                column(Unit_Cost;"Unit Cost")
                {}
            }
            dataitem(Item;Item)
            {
                column(Unit_Price;"Unit Price")
                {}
            }
        }
}*/