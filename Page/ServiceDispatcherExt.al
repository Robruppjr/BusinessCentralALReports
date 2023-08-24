pageextension 50200 "Service Dispatcher Ext" extends "Service Dispatcher Role Center"
{
    layout
    {
        addbefore("User Tasks Activities")
        {
            part("Production Activites"; "Production Activities")
            {
                ApplicationArea = All;
            }
        }
    }
}