report 50103 "Item Label Barcode 4x2"
{
    ApplicationArea = All;
    RDLCLayout = 'IWItemLabelBarcode4x2.rdlc';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Item; "Item")
        {
            column(itemsNo; item."No.")
            {

            }
            column(itemName; item.Description)
            {

            }
            column(itemMPN; item."MPN")
            {

            }
            column(itemModel; item."Model")
            {

            }
            column(Shelf_No_; "Shelf No.")
            {

            }

            column(itemBarcode; barcode.Image)
            {

            }
            column(LegacyId; item."LegacyId")
            {

            }
            column(itemCardBarcode; barcode.Image)
            {

            }

            trigger OnAfterGetRecord()
            var
                barcodeGenerator: Codeunit "IWX Library - Barcode Gen";
                cardBarcode: Integer;
            begin
                cardBarcode := 2;
                barcodeGenerator.GenerateQRBarcode(barcode, GetUrl(ClientType::Phone, 'TVS Sandbox', ObjectType::Page, 30), cardBarcode);
            end;
        }
    }

    var
        barcode: Record "IWX Barcode" temporary;
}