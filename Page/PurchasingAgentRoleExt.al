pageextension 50203 "Purchasing Agent Role Ext" extends "Purchasing Agent Role Center"
{
    layout
    {
        addfirst(rolecenter)
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