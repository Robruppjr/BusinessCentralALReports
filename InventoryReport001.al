reportextension 50107 "InvnetoryReport001" extends "Inventory Valuation"
{
    dataset
    {
        add(Item)
        {
            column(Item_Category_Code; "Item Category Code") { }
        }
    }
}