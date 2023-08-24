pageextension 50201 "Bussiness Manager Role Ext" extends "Business Manager Role Center"
{
    layout
    {
        addbefore(Control16)
        {
            part("Warehouse Pick State"; "Warehouse Picks State")
            {
                ApplicationArea = all;
            }
            part("Production Activities"; "Production Activities")
            {
                ApplicationArea = all;
            }
        }
    }
}