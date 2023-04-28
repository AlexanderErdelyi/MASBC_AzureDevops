codeunit 50111 "OpenAI Management"
{
    trigger OnRun()
    var
        myInt: Integer;
        GlobalTextResponseValue: Text;

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

    procedure SendDefaultRequest(Request: Text; var Response: Text)
    var
        OpenISetup: Record "OpenAI Setup";
    begin
        OpenAISetup.Get();
        SetOrganizationId(OpenAISetup."Organization ID");
        SetAPIKey(OpenAISetup."API Key");
        SetMaxToken(OpenAISetup."Default Max Token");
        SetTemperature(OpenAISetup."Default Temerature");
        SetPrompt(Request);
        if GetResponse() then
            Response := GetResponseTextResponseValue()
    end;

    local procedure ReadResponse(var Response: Text): Text
    var
        JsonObjResponse: JsonObject;
        JsonTokResponse: JsonToken;
        JsonTokChoices: JsonToken;
        JsonObjChoices: JsonObject;
        JsonTokTextValue: JsonToken;
        JsonArr: JsonArray;
    begin
        GlobalTextResponseValue := '';
        JsonObjResponse.ReadFrom(Response);
        if JsonObjResponse.Get('choices', JsonTokResponse) then begin
            JsonArr := JsonTokResponse.AsArray();
            JsonArr.Get(0, JsonTokChoices);
            JsonObjChoices := JsonTokChoices.AsObject();
            JsonObjChoices.get('text', JsonTokTextValue);
            GlobalTextResponseValue := JsonTokTextValue.AsValue().AsText();
        end;
    end;

    procedure GetDefaultModel(): Text
    begin
        exit('text-devinci-003')
    end;

    local procedure SetBody(var Content: HttpContent)
    var
        bodyJson: JsonObject;
        JsonData: Text;
    begin
        bodyJson.Add('model', GetDefaultModel());
        bodyJson.Add('prompt', GlobalPrompt);
        bodyJson.Add('max_tokens', GlobalMaxToken);
        bodyJson.Add('temperature', GlobalTemperature);
        bodyJson.WriteTo(JsonData);
        Content.WriteFrom(JsonData);
    end;

local procedure SetHeaders(var Content: HttpContent; var Request: HttpRequestMessage)
    var
        Headers: HttpHeaders;
        AuthorizationValue: Text;
    begin
        Content.GetHeaders(Headers);
        Headers.Clear();
        Headers.Add('ContentType', 'application/json');
        Request.GetHeaders(Headers);
        Headers.Add('OpenAIOrganization', GlobalOrganizationID);
        AuthorizationValue := GetAuthorization(GlobalAPIKey);
        Headers.Add('Authorization, AuthorizationValue');
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