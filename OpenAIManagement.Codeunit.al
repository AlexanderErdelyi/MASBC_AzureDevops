codeunit 50111 "OpenAI Management"
{
    trigger OnRun()
    var
        myInt: Integer;
        GlobalTextResponseValue: Text;
    
    begin
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
}