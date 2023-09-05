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
        field(8; "Priority N.A."; Integer)
        {
            Caption = 'Priority Not Assigned';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter(''),
                                                        "Due Date" = filter('<T')));
            Editable = false;
        }
        field(9; "Priority A."; Integer)
        {
            Caption = 'Priority Assigned';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter('Assigned to Technician'),
                                                        "Due Date" = filter('<T')));
            Editable = false;
        }
        field(10; "Available N.A."; Integer)
        {
            Caption = 'Available Not Assigned';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter(''),
                                                        "Due Date" = filter('T')));
            Editable = false;
        }
        field(11; "Available A."; Integer)
        {
            Caption = 'Available Assigned';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter('Assigned to Technician'),
                                                        "Due Date" = filter('T')));
            Editable = false;
        }
        field(12; "Given to Shipping"; Integer)
        {
            Caption = 'Given to shipping';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter('Given to shipping')));
            Editable = False;

        }
        field(13; "Local Pickup"; Integer)
        {
            Caption = 'Local Pick Up';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter('Local Pikc Up')));
            Editable = false;
        }
        field(14; "Shipped Today"; Integer)
        {
            Caption = 'Shipped Today';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Posted Assembly Header" = R;
            CalcFormula = count("Posted Assembly Header" where("Posting Date" = filter('T')));
            Editable = false;
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