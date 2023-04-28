page 50100 "Open AI Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "OpenAI Setup";
    Caption = 'OpenAI Setup';
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Organization ID"; Rec."Organization ID")
                {
                    //pplicationArea = All;
                    Caption = 'Organization ID';

                }
                field("API Key"; Rec."API Key")
                {
                    //pplicationArea = All;
                    Caption = 'API Key';
                    ExtendedDatatype = Masked;

                }

                field("Default Max Token"; Rec."Default Max Token")
                {
                    //pplicationArea = All;
                    Caption = 'Default Max Token';
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