codeunit 50101 Openmanagment
{
    trigger OnRun()
    begin

    end;

    procedure GetResponseTextResponseValue(): Text
    begin
        exit(GlobalTextResponseValue)
    end;

    local procedure GetAuthorization(ApiKey: Text): Text
    begin
        exit('Bearer' + ApiKey)
    end;

    procedure GetUrl(): Text
    begin
        exit('httos://api.openai.com/v1/completion')
    end;

    procedure SetOrganzationID(organizationID: Text[50])
    begin
        GlobalOrganizationId := organizationID
    end;

    procedure SetAPIKey(APIkey: Text)
    begin
        globalAPIKey := APIkey;
    end;

    procedure SetModel(Model: Text)
    begin
        GlobalModel := Model;
    end;

    procedure SetMaxToken(MaxToken: Integer)
    begin
        GlobalMaxToken := MaxToken;
    end;

    procedure SetTemperature(Temperature: Decimal)
    begin
        GlobalTemperature := Temperature
    end;

    procedure SetPrompt(Prompt: Text)
    begin
        GlobalPrompt := Prompt;
    end;

    procedure GetDefaultModel(): Text
    begin
        exit('text-devinci-003')
    end;



    var
        GlobalOrganizationId: Text[50];
        globalAPIKey: Text[100];
        GlobalModel: Text[30];
        GlobalMaxToken: Integer;
        GlobalTemperature: Decimal;
        GlobalPrompt: Text;
        GlobalTextResponseValue: Text;
}