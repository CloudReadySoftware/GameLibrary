tableextension 50100 "GLIB Customer Extension" extends Customer
{
    fields
    {
        field(50100; "GLIB Important"; Boolean)
        {
            DataClassification = SystemMetadata;
            Caption = 'Important';
        }
    }
}