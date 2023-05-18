reportextension 50108 "AssemblyOrder2023" extends "Assembly Order"
{
    RDLCLayout = 'AssemblyOrder2023.rdlc';
    
    dataset
    {
        add("Assembly Line")
        {
            column(fromBaseTable; Item."Item Category Code")
            {}
        }
    }
    var
    Item: Record "Item";
}