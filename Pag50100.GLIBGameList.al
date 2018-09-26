page 50100 "GLIB Game List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "GLIB Game";
    Caption = 'Games';

    layout
    {
        area(Content)
        {
            repeater("Details")
            {
                Caption = 'Game Details';
                field(Id; Id)
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field(Year; Year)
                {
                    ApplicationArea = All;
                }
                field(Publisher; Publisher)
                {
                    ApplicationArea = All;
                }
                field(Genre; Genre)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("FillDemoGameData")
            {
                ApplicationArea = All;
                Caption = 'Fill Game Data';
                Image = Entry;

                trigger OnAction()
                begin
                    FillDemoGameData();
                end;
            }
        }
    }
}