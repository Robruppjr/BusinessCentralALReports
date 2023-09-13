pageextension 50110 WarehousePickExt extends "Warehouse Pick"
{
    layout
    {
        addafter("No.")
        {
            field("Customer Name"; GetCustName())
            {
                ApplicationArea = all;
            }
        }
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
    local procedure GetCustName(): Text[100];
    var
        SalesHead: Record "Sales Header";
        AssemblyHead: Record "Assembly Header";
        ActivityLine: Record "Warehouse Activity Line";

    begin
        ActivityLine.SetCurrentKey("Activity Type", "No.", "Line No.");
        ActivityLine.SetRange("Activity Type", Rec.Type);
        ActivityLine.SetRange("No.", Rec."No.");
        ActivityLine.SetRange("Line No.", 10000);
        if ActivityLine.FindFirst() then begin
            if AssemblyHead.Get(1, ActivityLine."Source No.") then begin
                AssemblyHead.CalcFields("Order Count");
                if SalesHead.Get(1, AssemblyHead."Order Count") then begin
                    exit(SalesHead."Bill-to Name");
                end else
                    exit('');
            end else
                exit('');
        end else
            exit('');
    end;
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
            field("Customer Name"; GetCustName())
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
        addbefore("Registered Picks")
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
    local procedure GetCustName(): Text[100];
    var
        SalesHead: Record "Sales Header";
        AssemblyHead: Record "Assembly Header";
        ActivityLine: Record "Warehouse Activity Line";

    begin
        ActivityLine.SetCurrentKey("Activity Type", "No.", "Line No.");
        ActivityLine.SetRange("Activity Type", Rec.Type);
        ActivityLine.SetRange("No.", Rec."No.");
        ActivityLine.SetRange("Line No.", 10000);
        if ActivityLine.FindFirst() then begin
            if AssemblyHead.Get(1, ActivityLine."Source No.") then begin
                AssemblyHead.CalcFields("Order Count");
                if SalesHead.Get(1, AssemblyHead."Order Count") then begin
                    exit(SalesHead."Bill-to Name");
                end else
                    exit('');
            end else
                exit('');
        end else
            exit('');
    end;
}