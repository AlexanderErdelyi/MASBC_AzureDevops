codeunit 50111 "OpenAI Management"
{
    procedure GetResponce(): Boolean
    var
        apiURL: Text;
        apiKey: Text;
        prompt: Text;
        bodyJson: JsonObject;
        requestHeaders: HttpHeaders;
        ResponseText: Text;
        Request: HttpRequestMessage;
        Client: HttpClient;
        Content: HttpContent;
    begin
        SetBody(Content);
        SetHeaders(Content, Request);
        Post(Content, Request, ResponseText);
        ReadResponse(ResponseText);
        exit(GlobalTextResponseValue <> '');
    end;

    local procedure Post(var Content: HttpContent; var Request: HttpRequestMessage; var ResponseText: Text)
    var
        Client: HttpClient;
        ErrorText: Label 'Something Wrong Please retry.';
        ErrorResponseText: Label 'Something Wrong. Error: \%1';
        Response: HttpResponseMessage;
    begin
        Request.Content := Content;
        Request.SetRequestUri(GetUrl());
        Request.Method := 'POST';

        if not Client.Send(Request, Response) then
            Error(ErrorText);

        Response.Content.ReadAs(ResponseText);
        if not Response.IsSuccessStatusCode then
            Error(ErrorResponseText, ResponseText);

    end;

    local procedure SetBody(var Content: HttpContent)
    var

    Begin

    End;

    local procedure SetHeaders(var Content: HttpContent; var Request: HttpRequestMessage)
    var

    Begin

    End;

    local procedure ReadResponse(var ResponseText: Text)
    var

    Begin

    End;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
        GlobalTextResponseValue: Text
}