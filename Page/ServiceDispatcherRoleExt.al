pageextension 50200 "Service Dispatcher Ext" extends "Service Dispatcher Role Center"
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