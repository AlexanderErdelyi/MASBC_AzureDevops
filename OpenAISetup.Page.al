page 50100 "Open AI Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "OpenAI Setup";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                // field(Name; NameSource)
                // {
                //     ApplicationArea = All;

                // }
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
                Caption = 'Senden';

                trigger OnAction()
                var
                    OpenAIMgt: Codeunit "Open AI Management";
                begin
                    Clear(OpenAIMgt);
                    //OpenAIMgt.SendDefaultRequest(Request, Response);
                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        OpenAIMgt: Codeunit "Open AI Management";
    begin
        OpenAISetup.get();
    end;

    var
        Request: Text[250];
        Response: Text;
        OpenAISetup: Record "OpenAI Setup";
}