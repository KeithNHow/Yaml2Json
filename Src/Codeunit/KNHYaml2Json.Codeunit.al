codeunit 54100 "KNH Yaml 2 Json"
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure PlayingWithJAML()
    var
        JObject: JsonObject;
        SourceContent: Text;
        TargetContent: Text;
        Row: text;
        InStr: Instream;
        Filename: Text;
        OutStr: OutStream;
    begin
        if File.UploadIntoStream('Open Json File', '', 'All files (*.*)|*.*', Filename, Instr) then begin
            JObject.ReadFrom(InStr);

            //Json to Yaml conversion
            JObject.WriteTo(TargetContent);
            Message('Exported Yaml file: %1', TargetContent);
        end
    end;
}