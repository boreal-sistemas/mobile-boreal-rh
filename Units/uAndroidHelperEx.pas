unit uAndroidHelperEx;

interface

uses
  Androidapi.JNI.Net,
  Androidapi.JNI.JavaTypes;

type
  TAndroidHelperEx = class helper for TAndroidHelper
    class function GetFileUri(const AFileName: string): Jnet_Uri; static;
  end;

implementation

uses
  Androidapi.Helpers,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App,
  Androidapi.JNI.Provider; // necessário para TJFileProvider

class function TAndroidHelperEx.GetFileUri(const AFileName: string): Jnet_Uri;
var
  FileInst: JFile;
  Context: JContext;
begin
  FileInst := TJFile.JavaClass.init(StringToJString(AFileName));
  Context := TAndroidHelper.Context;

  Result := TJFileProvider.JavaClass.getUriForFile(
    Context,
    StringToJString(JStringToString(Context.getPackageName) + '.fileprovider'),
    FileInst
  );
end;

end.
