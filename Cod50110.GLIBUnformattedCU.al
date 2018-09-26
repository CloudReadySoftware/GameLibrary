codeunit 50110 "GLIB Unformatted CU"
{
    trigger OnRun()
    var
        DemoCurrentTimeMessage: Label 'This is a demo message, now is %1';
        DemoCurrentClientTypeMessage: Label 'This is a demo message2, it is displayed on the %1';
        UnusedVariable: Integer;
    begin
        ShowMessage1(DemoCurrentTimeMessage, CurrentDateTime);
        ShowMessage2(DemoCurrentClientTypeMessage, CurrentClientType);
    end;

    local procedure ShowMessage1(MessageText: Text[1024]; pDateTime: DateTime)
    begin
        if 1 = 1 then begin
            Message(MessageText, pDateTime);
        end;
    end;

    local procedure ShowMessage2(MessageText: Text[1024]; pClientType: ClientType)
    begin
        if 1 = 1 then begin
            Message(MessageText, pClientType);
        end;
    end;
}