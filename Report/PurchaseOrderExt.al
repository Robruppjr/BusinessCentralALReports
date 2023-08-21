reportextension 50110 "PurchaseOrder2023" extends "Standard Purchase - Order"
{
    WordLayout = 'PurchaseOrder2023.docx';

    dataset
    {
        add("Purchase Header")
        {
            column(TrackingNo; TrackingNo)
            { }
        }
    }
}