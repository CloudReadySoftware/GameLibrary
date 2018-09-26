tableextension 50100 "Customer Extension" extends Customer
{
    fields
    {
        field(50101; Important; Boolean)
        {
            DataClassification = SystemMetadata;
            Caption = 'Important';
        }
    }
}