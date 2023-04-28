codeunit 50100 "Open AI Management"
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
        GlobalTextResponseValue: Text;

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