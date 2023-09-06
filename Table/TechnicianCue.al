table 50106 "Technician Cues"
{
    Caption = 'Technicians Asigned';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';

        }
        field(2; "No Assigned Tech"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter(''),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Caption = 'NO ASIGNED TECH';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Tech01"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('Peter'),
                                                        "State Desc" = filter('<> Given to shipping'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Caption = 'Peter';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Tech02"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('Willie'),
                                                        "State Desc" = filter('<> Given to shipping'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Caption = 'Willie';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Tech03"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('Saul'),
                                                        "State Desc" = filter('<> Given to shipping'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Caption = 'Saul';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Tech04"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('Jonah'),
                                                        "State Desc" = filter('<> Given to shipping'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Caption = 'Jonah';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Tech99"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('Other Tech'),
                                                        "State Desc" = filter('<> Given to shipping'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Caption = 'Other Tech';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Priority N.A."; Integer)
        {
            //Removed
            Caption = 'Priority Not Asigned';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter(''),
                                                        "Due Date" = filter('<T'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Editable = false;
        }
        field(9; "Priority A."; Integer)
        {
            Caption = 'Priority Asigned';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('<> '''' '),
                                                        "Due Date" = filter('<T'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Editable = false;
        }
        field(10; "Available N.A."; Integer)
        {
            //Removed
            Caption = 'Available Not Asigned';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter(''),
                                                        "Due Date" = filter('T'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Editable = false;
        }
        field(11; "Available A."; Integer)
        {
            Caption = 'Regular Asigned';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("Tech Name" = filter('<> '''' '),
                                                        "Due Date" = filter('T'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Editable = false;
        }
        field(12; "Given to Shipping"; Integer)
        {
            Caption = 'Given to shipping';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter('Given to shipping'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
            Editable = False;

        }
        field(13; "Local Pickup"; Integer)
        {
            Caption = 'Local Pick Up';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter('Local Pikc Up'),
                                                        "Document Type" = filter('Order'),
                                                        "Status" = filter('Released')));
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
        field(15; "All Asigned"; Integer)
        {
            Caption = 'All Asigned';
            FieldClass = FlowField;
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where(
                                                        Status = filter('Released'),
                                                        "Document Type" = filter('Order')));
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