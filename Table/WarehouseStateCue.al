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
        field(3; Start; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where(State = filter('START')));
            Caption = 'Start Picking Parts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "End"; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where(State = filter('END')));
            Caption = 'Parts have been picked';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "All Picks"; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header");
            Caption = 'All Pick Sheets';
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