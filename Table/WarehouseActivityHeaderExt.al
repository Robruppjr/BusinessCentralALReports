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
            TableRelation = "Warehouse Pick State" where(Code = field(State));
            ObsoleteState = Removed;
        }
        field(50103; "State Desc"; Text[200])
        {
            Caption = 'Warehouse State';
            TableRelation = "Warehouse Pick State".Description;
            ValidateTableRelation = false;

        }
        field(50131; "Technician"; Text[200])
        {
            Caption = 'Technician';
            TableRelation = "Assembly Header"."Tech Name";
        }
        field(50104; "TechWorkTeir"; Text[50])
        {
            Caption = 'Tech Teir';
            TableRelation = "Tech Work Teir table".Description;
        }
        field(50133; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
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

    local procedure SetCurrentFieldValue(NewCurrentFieldValue: Text): Boolean
    begin
        if CurrentFieldValue = '' then begin
            CurrentFieldValue := NewCurrentFieldValue;
            exit(true);
        end;
        exit(false);
    end;

    var
        AssemblyHeader: Record "Assembly Header";
        AssembleOrderLink: Record "Assemble-to-Order Link";
        CurrentFieldNum: Integer;
        CurrentFieldValue: Text;
}

