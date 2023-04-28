codeunit 50100 "OpenAI-Management"
{
    trigger OnRun()
    begin
    end;

    var
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

}