tableextension 50110 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(50100; TrackingNo; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Tracking No.';
        }
    }
}