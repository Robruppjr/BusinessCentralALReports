pageextension 50204 "Technician Dispactecher View" extends "Service Technician Role Center"
{
    layout
    {
        addfirst(rolecenter)
        {
            part("Technician Cues"; "Technician Cues")
            {
                ApplicationArea = all;
            }
            part("Technician BomSqaud Cue"; "Technician BomSqaud Cue")
            {
                ApplicationArea = all;
            }

        }
    }
}