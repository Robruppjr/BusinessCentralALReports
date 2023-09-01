pageextension 50200 "Service Dispatcher Ext" extends "Service Dispatcher Role Center"
{
    layout
    {
        addfirst(rolecenter)
        {

            part("Production Activites 02"; "Production Activities 02")
            {
                ApplicationArea = All;
            }
            part("Technician Cues"; "Technician Cues")
            {
                ApplicationArea = all;
            }

        }
    }
}