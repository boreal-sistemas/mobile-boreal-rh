unit Androidapi.JNI.FileProvider;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os;  // ? ESSENCIAL

type
  JFileProviderClass = interface(JObjectClass)
    ['{D031C5EF-7980-4DBB-8025-1665F34F0F2A}']
    [JavaSignature('androidx/core/content/FileProvider')]
    function getUriForFile(context: JContext; authority: JString; file_: JFile): Jnet_Uri; cdecl;
  end;

  [JavaSignature('androidx/core/content/FileProvider')]
  JFileProvider = interface(JObject)
    ['{13D3C19A-75C4-4B39-9F1C-60E9308B3122}']
  end;

  TJFileProvider = class(TJavaGenericImport<JFileProviderClass, JFileProvider>) end;

implementation

end.

