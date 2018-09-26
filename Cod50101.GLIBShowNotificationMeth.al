codeunit 50101 "GLIB Show Notification Meth"
{
    procedure ShowNotification(var Game: Record "GLIB Game");
    var
        Handled: Boolean;
    begin
        OnBeforeShowNotification(Handled);

        DoShowNotification(Game, Handled);

        OnAfterShowNotification();
    end;

    local procedure DoShowNotification(var Game: Record "GLIB Game"; var Handled: Boolean);
    var
        NoOfGamesPerYearDictionary: Dictionary of [Integer, Integer];
    begin
        if Handled then
            exit;

        FillDictionary(Game, NoOfGamesPerYearDictionary);
        SendNotification(NoOfGamesPerYearDictionary);
    end;

    local procedure FillDictionary(var Game: Record "GLIB Game"; var NoOfGamesPerYearDictionary: Dictionary of [Integer, Integer])
    var
        GameCounter: Integer;
    begin
        Game.FindSet();

        repeat
            if NoOfGamesPerYearDictionary.Get(Game.Year, GameCounter) then
                NoOfGamesPerYearDictionary.Set(Game.Year, GameCounter + 1)
            else
                NoOfGamesPerYearDictionary.Add(Game.Year, 1);
        until Game.Next() = 0;
    end;

    local procedure SendNotification(var NoOfGamesPerYearDictionary: Dictionary of [Integer, Integer])
    var
        MyNotification: Notification;
        GamesPerYearTxt: Label 'You have %1 games which are released in %2.';
        NoOfGames: Integer;
        Year: Integer;
    begin
        NoOfGamesPerYearDictionary.Keys().Get(Random(NoOfGamesPerYearDictionary.Count()), Year);
        NoOfGamesPerYearDictionary.Get(Year, NoOfGames);

        MyNotification.Id('04f6dc52-c342-4e2a-9939-b1dcd3c15f26');
        MyNotification.Message(StrSubstNo(GamesPerYearTxt, NoOfGames, Year));
        MyNotification.SetData('Year', Format(Year));
        MyNotification.AddAction('Show Games', Codeunit::"GLIB Show Notification Meth", 'ShowFilteredGameData');
        MyNotification.Send();
    end;

    procedure ShowFilteredGameData(var MyNotification: Notification)
    var
        GameData: Record "GLIB Game";
        Year: Integer;
    begin
        Evaluate(Year, MyNotification.GetData('Year'));
        GameData.SetRange(Year, Year);

        Page.Run(Page::"GLIB Game List", GameData);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Conf./Personalization Mgt.", 'OnRoleCenterOpen', '', true, true)]
    local procedure MyProcedure()
    var
        Game: Record "GLIB Game";
    begin
        Game.ShowNotification();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeShowNotification(var Handled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterShowNotification();
    begin
    end;
}