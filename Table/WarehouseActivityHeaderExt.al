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
            ObsoleteState = Removed;
        }
        field(50103; "State Desc"; Text[200])
        {
            Caption = 'Warehouse State';
            TableRelation = "Warehouse Pick State".Description;

        }
        field(50131; "Technician"; Text[200])
        {
            Caption = 'Technician';
            TableRelation = "Assembly Header" where("Tech Name" = field(Technician));
            AccessByPermission = tabledata Technician = R;
            trigger OnValidate()
            begin
                SetCurrentFieldValue(FieldCaption(Technician));
                if Technician <> '' then begin
                    Technician := AssemblyHeader."Tech Name";
                end;
            end;
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

