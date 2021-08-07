DefinitionBlock("", "SSDT", 2, "OCLT", "GPI0", 0)
{
    External(GPEN, FieldUnitObj)
    External(SBRG, FieldUnitObj)
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            GPEN = One
            SBRG = One
        }
        Else
        {
            
        }
    }
}