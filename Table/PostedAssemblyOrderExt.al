tableextension 50150 "Posted Assembly Ext" extends "Posted Assembly Header"
{
    fields
    {
        field(50100; "Technician"; Text[200])
        {
            Caption = 'Technician';
            TableRelation = Technician.Description;
        }
        field(50101; "Tech Teir"; Text[50])
        {
            Caption = 'Tech Teir';
            TableRelation = "Tech Work Teir table".Description;
        }
    }
}