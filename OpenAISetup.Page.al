page Id MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'OpenAI Setup';
    SourceTable = "OpenAl Setup";
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

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}