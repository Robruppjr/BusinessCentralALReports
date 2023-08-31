pageextension 50110 WarehousePickExt extends "Warehouse Pick"
{
    layout
    {
        addafter("Sorting Method")
        {
            field(Technician; Rec.Technician)
            {
                ApplicationArea = all;
            }
            field(TechWorkTeir; Rec.TechWorkTeir)
            {
                ApplicationArea = all;
            }
            field("State Desc"; Rec."State Desc")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addfirst(Reporting)
        {
            action("Pick Sheet Print")
            {
                Caption = 'Print Pick Sheet';
                ApplicationArea = All;
                Image = Print;
                PromotedCategory = Process;
                Promoted = true;
                //RunObject = report "Assembly Order";

                trigger OnAction()
                var
                    AssemblyOrder: Record "Assembly Header";
                    WarehouseOrder: Record "Warehouse Activity Line";
                    AssembNo: Code[20];
                begin
                    /*WarehouseOrder.SetCurrentKey("Whse. Document No.", "Whse. Document Type");
                    WarehouseOrder.SetRange("Whse. Document Type", Rec.Type);
                    WarehouseOrder.SetRange("Whse. Document No.", Rec."No.");*/
                    if WarehouseOrder.Get(Rec.Type, Rec."No.", 10000) then begin
                        AssembNo := WarehouseOrder."Source No.";
                    end;
                    //AssembNo := Rec."Source No.";
                    AssemblyOrder.SetCurrentKey("Document Type", "No.");
                    AssemblyOrder.SetRange("Document Type", AssemblyOrder."Document Type"::Order);
                    AssemblyOrder.SetFilter("No.", AssembNo);
                    if AssemblyOrder.Find('-') then begin
                        AssemblyOrder.SetRecFilter();
                        Report.Run(902, true, true, AssemblyOrder);
                    end;
                end;
            }
        }
    }
}

pagecustomization WarehousePickExtModfiry customizes "Warehouse Pick"
{
    actions
    {
        moveafter("Registered Picks"; "Pick Sheet Print")
    }
}

pageextension 50111 "Wh Pick List Ext" extends "Warehouse Picks"
{
    layout
    {
        addafter("No.")
        {
            field("State Desc"; Rec."State Desc")
            {
                ApplicationArea = all;
            }
        }
    }
}