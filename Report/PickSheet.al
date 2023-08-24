reportextension 50111 "Pick Sheet" extends "Picking List"
{
    RDLCLayout = 'PickList2023.rdlc';
    dataset
    {
        add("Warehouse Activity Header")
        {
            column(Assembly_Order_No_; "Assembly Order No.")
            {
            }
            column(Sales_Order_No_; "Sales Order No.")
            {
            }
        }
    }

}