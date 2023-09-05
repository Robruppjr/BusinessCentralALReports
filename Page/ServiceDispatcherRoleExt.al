pageextension 50200 "Service Dispatcher Ext" extends "Service Dispatcher Role Center"
{
    layout
    {
        addfirst(rolecenter)
        {
            part("Technician Cues"; "Technician Cues")
            {
                ApplicationArea = all;
            }

        }
    }
}