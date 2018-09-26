codeunit 50100 "GLIB Fill Demo Game Data Meth"
{
    procedure FillDemoGameData(var Game: Record "GLIB Game");
    var
        Handled: Boolean;
    begin
        OnBeforeFillDemoGameData(Handled);

        DoFillDemoGameData(Game, Handled);

        OnAfterFillDemoGameData();
    end;

    local procedure DoFillDemoGameData(var Game: Record "GLIB Game"; var Handled: Boolean);
    var
        Genre: Option Sandbox,RPG,Sports;
    begin
        if Handled then
            exit;

        CreateEntry(Game, 'The Elder Scrolls V: Skyrim', 2011, 'Bethesda Softworks', Genre::RPG);
        CreateEntry(Game, 'Minecraft', 2011, 'Mojang', Genre::Sandbox);
        CreateEntry(Game, 'The Witcher 3 – Wild Hunt', 2015, 'CD Project', Genre::RPG);
        CreateEntry(Game, 'FIFA 18', 2017, 'EA Games', Genre::Sports);
        CreateEntry(Game, 'Fallout 4', 2015, 'Bethesda Softworks', Genre::RPG);
        CreateEntry(Game, 'PES 18', 2017, 'Konami', Genre::Sports);
    end;

    local procedure CreateEntry(var Game: Record "GLIB Game"; pName: Text[250]; pYear: Integer; pPublisher: Text[250]; pGenre: Option Sandbox,RPG,Sports)
    begin
        with Game do begin
            Init();
            Id := 0;
            Name := pName;
            Year := pYear;
            Publisher := pPublisher;
            Genre := pGenre;
            Insert();
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeFillDemoGameData(var Handled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFillDemoGameData();
    begin
    end;
}