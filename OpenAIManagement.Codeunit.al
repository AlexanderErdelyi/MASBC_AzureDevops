codeunit Id MyCodeunit
{
    trigger OnRun()
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
    
    //var
        //myInt: Integer;
}