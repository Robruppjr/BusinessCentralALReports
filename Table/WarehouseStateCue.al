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
            CalcFormula = count("Warehouse Activity Header" where("State Desc" = filter('Waiting for Parts')));
            Caption = 'WAITING FOR PARTS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; Start; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where("State Desc" = filter('STARTED - BOMSQUAD Picked')));
            Caption = 'Pick Started';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "End"; Integer)
        {
            AccessByPermission = tabledata "Registered Whse. Activity Hdr." = R;
            CalcFormula = count("Registered Whse. Activity Hdr." where("Registering Date" = filter('>1M')));
            Caption = 'Completed Picks';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "All Picks"; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where("State Desc" = filter('STARTED - BOMSQUAD Picked' | 'Waiting for Parts' | '')));
            Caption = 'All Active Picks';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "New Order"; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where("State Desc" = filter(''),
                                                                    Type = filter('Pick')));
            Caption = 'NEW ORDER';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
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