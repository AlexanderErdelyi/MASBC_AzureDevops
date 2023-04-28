page Id MyPage
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'AskGPT';
    UsageCategory = Tasks;
    InsertAllowed = false;
    DeleteAllowed = false
    SourceTable = Name;

    layout
    {
        area(Content)
        {
            group(requestGroup)
            {
                ShowCaption = true;
                Caption = 'Request';
                field(Request; Request)
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;


                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}