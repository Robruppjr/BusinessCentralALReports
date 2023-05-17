reportextension 50107 "InvnetoryReport001" extends "Inventory Valuation"
{
    RDLCLayout = 'ExtendedInventoryValuation.rdl';

    dataset
    {
        add(Item)
        {
            column(Item_Category_Code; "Item Category Code")
            {
            }
            column(Sellbrite; Sellbrite)
            {
            }
            column(ItemClass; ItemClass)
            {
            }
            column(Standard_Cost; "Standard Cost")
            {
            }

        }
    }
}
