pageextension 50203 "Purchasing Agent Role Ext" extends "Purchasing Agent Role Center"
{
    layout
    {
        addbefore(Control1907662708)
        {
            part("Warehouse Pick State"; "Warehouse Picks State")
            {
                ApplicationArea = all;
            }
        }
    }
}