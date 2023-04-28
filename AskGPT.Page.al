page 50112 "Ask GPT"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Ask GPT';
    UsageCategory = Tasks;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(RequestGroup)
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
            group(ResponseGroup)
            {
                ShowCaption = true;
                Caption = 'Response';
                field(Response; Response)
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