table 50104 "Production Cue"
{
    Caption = 'Production Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "On Deck - Today"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter('TECHONDECK'),
                                                        "Creation Date" = filter('T')));
            Caption = 'On Deck for Today';
            Editable = false;
            FieldClass = FlowField;

        }
        field(3; "On Deck - Priority"; Integer)
        {

        }
        field(4; "New Order - Today"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter('New Order' | ''),
                                                        "Creation Date" = filter('T')));
            Caption = 'New Order for Today';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Priority"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header" where("State Desc" = filter('TECHONDECK' | '' | 'New Order'),
                                                        "Creation Date" = filter('<T')));

            Caption = 'On Deck - Priority';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "All Orders"; Integer)
        {
            AccessByPermission = tabledata "Assembly Header" = R;
            CalcFormula = count("Assembly Header");

            Caption = 'Orders Ready To Ship';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; WFP; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where("State Desc" = filter('Waiting for Parts')));
            Caption = 'WAITING FOR PARTS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; Start; Integer)
        {
            AccessByPermission = tabledata "Warehouse Activity Header" = R;
            CalcFormula = count("Warehouse Activity Header" where("State Desc" = filter('STARTED - BOMSQUAD Picked')));
            Caption = 'Pick Started';
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
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}