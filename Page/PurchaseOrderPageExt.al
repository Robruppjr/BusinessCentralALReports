pageextension 50115 PurchaseOrderPageExt extends "Purchase Order"
{
    layout
    {
        addafter(Status)
        {
            field(TrackingNo; Rec.TrackingNo)
            {
                ApplicationArea = all;
            }
        }
    }
}

pageextension 50116 PurchaseOrderListPageExt extends "Purchase Order List"
{
    layout
    {
        addafter("No.")
        {
            field(TrackingNo; Rec.TrackingNo)
            {
                ApplicationArea = all;
            }
        }
    }
}