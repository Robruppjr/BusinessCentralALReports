table 50105 "Warehouse State Cue"
{
    Caption = 'Warehouse State Cue';

    fields
    {
        field(1; "Primay Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; WFP; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where(State = filter('WFP')));
            Caption = 'Waiting for Parts';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Primay Key")
        {
            Clustered = true;
        }
    }
}