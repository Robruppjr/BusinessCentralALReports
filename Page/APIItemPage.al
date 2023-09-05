page 50111 "API Item Page"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'bctech';
    APIGroup = 'demo';

    EntityCaption = 'Item';
    EntitySetCaption = 'Items';
    EntityName = 'item';
    EntitySetName = 'items';

    ODataKeyFields = SystemId;
    SourceTable = "Item";

    Extensible = false;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(name; Rec."No.")
                {
                    Caption = 'number';
                }
                field(LegacyId; Rec.LegacyId)
                {
                    Caption = 'Sellbrite Sku';
                }

            }
        }
    }
}