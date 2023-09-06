table 50108 "Service Manager BOMSquad Cues"
{
    Caption = 'BOMSquad Pending Orders';

    fields
    {
        field(1; "Primay Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Not Started"; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where("State Desc" = filter('')));
            Caption = 'Not Started';
            FieldClass = FlowField;
            Editable = false;
        }
        field(3; Start; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where("State Desc" = filter('STARTED - BOMSQUAD Picked')));
            Caption = 'Pick Started';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; WFP; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where("State Desc" = filter('Waiting for Parts'),
                                                                    Type = filter('Pick'),
                                                                    "Location Code" = filter('""|BOMSQD|BUNKER|LOCKBOX|NORTH|PRODUCTION|TVS|TVS2905|VAULT|WAREHOUSE')));
            Caption = 'WAITING FOR PARTS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "On Hold"; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where("State Desc" = filter('On Hold')));
            Caption = 'On Hold';
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