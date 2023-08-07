report 50104 "MPN 4x2 Label"
{
    ApplicationArea = All;
    RDLCLayout = 'MPN4x2Label.rdlc';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Item; Item)
        {
            column(MPN; item.MPN)
            {

            }
            column(Model; item.Model)
            {

            }
            column(Description; item.Description)
            {
                
            }
        }
    }

    var
        barcode: Record "IWX Barcode" temporary;
}