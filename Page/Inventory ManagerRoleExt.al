pageextension 50202 "Inventory Manager Role Ext" extends "Whse. Basic Role Center"
{
    layout
    {
        addbefore("WMS Ship and Receive Activities")
        {
            part("Production Activites"; "Production Activities")
            {
                ApplicationArea = All;
            }
            part("Warehouse Picks State"; "Warehouse Picks State")
            {
                ApplicationArea = all;
            }
        }
    }
}