table 50100 "GLIB Game"
{
    DataClassification = SystemMetadata;
    LookupPageId = "GLIB Game List";

    fields
    {
        field(1; "Id"; Integer)
        {
            DataClassification = SystemMetadata;
            AutoIncrement = true;
        }
        field(2; "Name"; Text[250])
        {
            DataClassification = SystemMetadata;
            Caption = 'Name';
        }
        field(3; "Year"; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Release Year';
        }
        field(4; "Publisher"; Text[250])
        {
            DataClassification = SystemMetadata;
            Caption = 'Publisher';
        }
        field(5; "Genre"; Option)
        {
            DataClassification = SystemMetadata;
            Caption = 'Genre';
            OptionMembers = Sandbox,RPG,Sports;
        }
    }

    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }

    procedure FillDemoGameData()
    var
        FillDemoGameDataMeth: Codeunit "GLIB Fill Demo Game Data Meth";
    begin
        FillDemoGameDataMeth.FillDemoGameData(Rec);
    end;

    procedure ShowNotification()
    var
        ShowNotificationMeth: Codeunit "GLIB Show Notification Meth";
    begin
        ShowNotificationMeth.ShowNotification(Rec);
    end;
}