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
            part("Service Manager BomSqaud Cue"; "Service Manager BomSqaud Cue")
            {
                ApplicationArea = all;
            }

        }
    }
}