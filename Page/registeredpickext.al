pageextension 50112 "Regesitered Pick Ext" extends "Registered Pick"
{
    layout
    {

    }
    actions
    {

        addfirst(navigation)
        {
            action("Print Pick Sheet")
            {
                Caption = 'Print Pick Sheet';
                ApplicationArea = all;
                Image = Print;

                trigger OnAction()
                var
                    AssemblyOrder: Record "Assembly Header";
                    RegisteredPick: Record "Registered Whse. Activity Line";
                    AssemblyNo: Code[20];
                begin
                    if RegisteredPick.Get(Rec.Type, Rec."No.", 10000) then begin
                        AssemblyNo := RegisteredPick."Source No.";
                    end;
                    AssemblyOrder.SetCurrentKey("Document Type", "No.");
                    AssemblyOrder.SetRange("Document Type", AssemblyOrder."Document Type"::Order);
                    AssemblyOrder.SetFilter("No.", AssemblyNo);
                    if AssemblyOrder.Find('-') then begin
                        AssemblyOrder.SetRecFilter();
                        Report.Run(902, true, true, AssemblyOrder);
                    end;
                end;
            }
        }
    }
}