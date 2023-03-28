report 50102 "Item Label Barcode 3x1"
{
    ApplicationArea = All;
    RDLCLayout = 'IWItemLabelBarcode.rdlc';
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

            column(itemBarcode; barcode.Image)
            {

            }

            trigger OnAfterGetRecord()
            var
                barcodeGenerator: Codeunit "IWX Library - Barcode Gen";
                barcodeHeight: Integer;
                barcodeWidth: Integer;
            begin
                barcodeHeight := 125;
                barcodeWidth := 500;
                barcodeGenerator.Generate128Barcode(barcode, item."No.", barcodeWidth, barcodeHeight);
            end;
        }
    }

    var

        barcode: Record "IWX Barcode" temporary;
}