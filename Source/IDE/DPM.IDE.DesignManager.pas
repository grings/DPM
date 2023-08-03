unit DPM.IDE.DesignManager;

interface

uses
  System.Classes;

type
  IDPMIDEDesignManager = interface
  ['{31ADC6E0-7B8E-4203-A635-7D02FC4C0FC7}']

  end;

  TDPMIDEDesignManager = class(TInterfacedObject, IDPMIDEDesignManager)
  private
    FPaths : TStringList;
  protected
    procedure RemovePath(const APath : string);
    procedure EnsurePath(const APath: string);
  public
    constructor Create;
    destructor Destroy;override;
  end;

implementation

uses
  WinApi.Windows,
  System.SysUtils,
  System.StrUtils;

{ TDPMIDEDesignManager }

constructor TDPMIDEDesignManager.Create;
var
  i: Integer;
begin
  FPaths := TStringList.Create(TDuplicates.dupIgnore, false, false);
  FPaths.Delimiter := ';';
  FPaths.DelimitedText := GetEnvironmentVariable('PATH');
  for i := 0 to FPaths.Count -1 do
    FPaths.Objects[i] := TObject(1); //set the reference count for the path entry so we don't remove ones that
                                     // that were there on startup.
end;

destructor TDPMIDEDesignManager.Destroy;
begin
  FPaths.Free;
  inherited;
end;


procedure SetEnvironmentVariable(const Name, Value: string);
begin
  WinApi.Windows.SetEnvironmentVariable(PChar(Name), PChar(Value));
end;

procedure TDPMIDEDesignManager.EnsurePath(const APath: string);
var
  i : integer;
  count : integer;
begin
  i := FPaths.IndexOf(APath);
  if i = -1 then
  begin
    FPaths.InsertObject(0, APath, TObject(1));
    SetEnvironmentVariable('PATH', FPaths.DelimitedText);
  end
  else
  begin
    //already there, so just increment the reference count;
    count := Integer(FPaths.Objects[i]);
    Inc(count);
    FPaths.Objects[i] := TObject(count);
  end;
end;

procedure TDPMIDEDesignManager.RemovePath(const APath: string);
var
  i : integer;
  count : integer;
begin
  i := FPaths.IndexOf(APath);
  if i = -1 then
    exit;
  count := Integer(FPaths.Objects[i]);
  if count > 1 then
  begin
    Dec(count);
    FPaths.Objects[i] := TObject(count);
   end
  else
  begin
    FPaths.Delete(i);
    SetEnvironmentVariable('PATH', FPaths.DelimitedText);
  end;
end;

end.