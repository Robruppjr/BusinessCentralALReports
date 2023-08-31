table 50106 "Technician Cues"
{
    Caption = 'Technicians Assigned';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';

        }
        field(2; "No Assigned Tech"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('')));
            Caption = 'NO ASSIGNED TECH';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Tech01"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('Peter'),
                                                        "State Desc" = filter('<> Given to shipping')));
            Caption = 'Peter';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Tech02"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('Willie'),
                                                        "State Desc" = filter('<> Given to shipping')));
            Caption = 'Willie';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Tech03"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('Saul'),
                                                        "State Desc" = filter('<> Given to shipping')));
            Caption = 'Saul';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Tech04"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('Jonah'),
                                                        "State Desc" = filter('<> Given to shipping')));
            Caption = 'Jonah';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Tech99"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('Other Tech'),
                                                        "State Desc" = filter('<> Given to shipping')));
            Caption = 'Other Tech';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}