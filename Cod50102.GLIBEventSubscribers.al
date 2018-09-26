codeunit 50102 "GLIB Event Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"GLIB Fill Demo Game Data Meth", 'OnBeforeFillDemoGameData', '', true, true)]
    local procedure DisableFillingDemoData_OnBeforeFillDemoGameData(var Handled: Boolean)
    begin
        Handled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"GLIB Fill Demo Game Data Meth", 'OnAfterFillDemoGameData', '', true, true)]
    local procedure ShowMessage_OnAfterFillDemoGameData()
    begin
        Message('Done!');
    end;
}