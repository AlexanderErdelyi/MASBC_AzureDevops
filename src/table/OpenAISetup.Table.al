table 50111 "OpenAI Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(5; "Organization ID"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(10; "API Key"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(20; "Default Max Token"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(30; "Default Temperature"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}