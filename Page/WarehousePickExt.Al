pageextension 50110 WarehousePickExt extends "Warehouse Pick"
{
    layout
    {
        addafter("Sorting Method")
        {
            field(State; Rec.State)
            {
                ApplicationArea = All;
                Importance = Standard;
                Visible = true;
            }
        }
    }
    actions
    {
        addafter("&Print")
        {
            action("Pick Sheet Print")
            {
                Caption = 'Print Pick Sheet';
                ApplicationArea = All;
                Image = Print;
                RunObject = report "Assembly Order";
                trigger OnAction()
                var
                    AssemblyOrder: Record "Assembly Header";
                    WarehouseOrder: Record "Warehouse Activity Header";
                    AssembNo: Code[20];
                begin
                    AssembNo := Rec."Source No.";
                    AssemblyOrder.SetFilter("No.", AssembNo);
                end;
            }
        }
    }
}

pageextension 50111 "Wh Pick List Ext" extends "Warehouse Picks"
{
    layout
    {
        addafter("No.")
        {
            field(State; Rec.State)
            {
                ApplicationArea = all;
            }
        }
    }
}