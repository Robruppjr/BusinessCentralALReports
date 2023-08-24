tableextension 50105 WarehousePickExt extends "Warehouse Activity Header"
{
    fields
    {
        field(50100; "Assembly Order No."; Code[20])
        {
            Caption = 'Assembly Order No.';
            TableRelation = "Assembly Header" where("No." = field("Source No."));
            trigger OnValidate()
            begin
                SetCurrentFieldNum(FieldNo("Assembly Order No."));
                if "Assembly Order No." <> '' then begin
                    "Assembly Order No." := "Source No.";
                end;
            end;
        }
        field(50101; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            TableRelation = "Assemble-to-Order Link"."Document No." where("Assembly Document No." = field("Assembly Order No."));
        }
        field(50102; "State"; Code[20])
        {
            Caption = 'Warehouse Pick State';
            TableRelation = "Warehouse Pick State";
            ValidateTableRelation = false;
        }
    }
    local procedure SetCurrentFieldNum(NewCurrentFieldNum: Integer): Boolean
    begin
        if CurrentFieldNum = 0 then begin
            CurrentFieldNum := NewCurrentFieldNum;
            exit(true);
        end;
        exit(false);
    end;

    var
        AssemblyHeader: Record "Assembly Header";
        AssembleOrderLink: Record "Assemble-to-Order Link";
        CurrentFieldNum: Integer;
}

