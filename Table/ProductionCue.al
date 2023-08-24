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
            CalcFormula = count("Assembly Header" where(State = filter('TECHONDECK'),
                                                        "Creation Date" = field("Date Filter")));
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
            CalcFormula = count("Assembly Header" where(State = filter('New Order'),
                                                        "Creation Date" = field("Date Filter")));
            Caption = 'New Order for Today';
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