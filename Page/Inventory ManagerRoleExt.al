pageextension 50202 "Inventory Manager Role Ext" extends "Whse. Basic Role Center"
{
    layout
    {
        addfirst(rolecenter)
        {

            part("Warehouse Picks State"; "Warehouse Picks State")
            {
                ApplicationArea = all;
            }
            part("Production Activites"; "Production Activities")
            {
                ApplicationArea = All;
            }
        }
    }
}