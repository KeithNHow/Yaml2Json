codeunit 54100 "KNH Yaml 2 Json"
{
    trigger OnRun()
    begin
        this.Json2Yaml();
        this.Yaml2Json();
    end;

    procedure Json2Yaml()
    var
        JToken: JsonToken;
        JObject: JsonObject;
        TargetContent: Text;
        InStr: Instream;
        Filename: Text;
    begin

        if File.UploadIntoStream('Open Json File', 'C:\Temp\', 'All files (*.*)|*.*', Filename, InStr) then begin
            JToken.ReadFrom(InStr);
            JObject := JToken.AsObject();

            //Json to Yaml conversion
            JObject.WriteTo(TargetContent);
            Message('Exported Yaml file: %1', TargetContent);
        end
    end;

    procedure Yaml2Json()
    var
        JToken: JsonToken;
        JObject: JsonObject;
        TargetContent: Text;
        InStr: Instream;
        Filename: Text;
    begin
        if File.UploadIntoStream('Open Yaml File', 'C:\Temp\', 'All files (*.*)|*.*', Filename, InStr) then begin
            JToken.ReadFrom(InStr);
            JObject := JToken.AsObject();

            //Yaml to Json conversion
            JObject.WriteTo(TargetContent);
            Message('Exported Json file: %1', TargetContent);
        end
    end;
}