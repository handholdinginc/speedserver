unit Router;

{$MODE Delphi}

interface

uses
speed,
uProcess,
sysutils, httpdefs, fpjson, jsonparser,
Generics.Collections; // TList

// global methods
procedure RouterInit(_c : config; _l : list; _h : hook);
procedure jsonResponse(var res: TResponse; data: String; code : integer=200);
procedure SetProcess(req: TRequest; res: TResponse);
procedure SetSpeed(req: TRequest; res: TResponse);
procedure SetDisable(req: TRequest; res: TResponse);
procedure GetProcessList(req: TRequest; res: TResponse);

implementation
var
   c	  : config;
   l	  : list;
   h	  : hook;

procedure jsonResponse(var res : TResponse; data: String; code : integer =200);
begin
   // needed for axios:
   res.SetCustomHeader('Access-Control-Allow-Origin','*');
   res.SetCustomHeader('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
   res.SetCustomHeader('Access-Control-Allow-Headers', 'Content-Type');
   res.SetCustomHeader('Access-Control-Allow-Credentials','true');
   res.Content := data;
   res.Code := code;
   res.ContentType := 'application/json';
   res.ContentLength := length(res.Content);
   res.SendContent;
end;

procedure GetProcessList(req: TRequest; res: TResponse);
var
   jObject : TJSONObject;
   jArray  : TJSONArray;
   jElem   : TJSONObject;
   ps	   : TList<process>;
   p	   : process;
   e	   : Exception;
   code	   : integer; // exit code
begin
  try
   jObject := TJSONObject.Create;

   ps:=l.GetList;
   jArray := TJSONArray.Create;
   for p in ps do
   begin
      jElem := TJSONObject.Create;
      jElem.Add('name', p.Name);
      jElem.Add('id', p.ID);
      jArray.Add(jElem);
   end;
   jObject.Add('Processes', jArray);
   jsonResponse(res, jObject.AsJSON);
  finally
   jObject.Free;
  end;
end;

procedure SetSpeed(req: TRequest; res: TResponse);
var
   jObject : TJSONObject;
   name	   : string;
   spd	   : single;
   p	   : process;
   e	   : Exception;
   code	   : integer; // exit code
begin
  try
   jObject := TJSONObject.Create;
   name:=req.RouteParams['name'];
   spd:=StrToFloat(req.RouteParams['speed']);
   jObject.Strings['name'] := name;
   jObject.Add('speed', spd);

   // check we have a process
   p:=h.GetProcess;
   if p = nil then
   begin
      code := 500; // generic error
      e := Exception.Create('No process hooked.');
      jObject.Strings['error'] := e.ToString;
      jsonResponse(res, jObject.AsJSON, code);
      Exit;
   end;

   jObject.Strings['hookedProcessName'] := p.Name;

   // check it's the right process
   if (length(name) > 0) and  // default to currently hooked proc if none given
      (CompareText(uppercase(p.Name) , uppercase(name)) <> 0) then
   begin
      e := Exception.Create('Process hook mismatch');
      jObject.Strings['error'] := e.ToString;
      code := 500; // generic error
      jsonResponse(res, jObject.AsJSON, code);
      Exit;
   end;

   // set the speed
   e := h.SetSpeed(spd);
   if e <> nil then
   begin
      jObject.Strings['error'] := e.ToString;
      code := 500; // generic error
      jsonResponse(res, jObject.AsJSON, code);
      Exit;
   end;      

   jsonResponse(res, jObject.AsJSON);
  finally
   jObject.Free;
  end;
end;

procedure SetDisable(req: TRequest; res: TResponse);
var
   jObject   : TJSONObject;
   e	     : Exception;
   code	     : integer;
begin
  try
   jObject := TJSONObject.Create;

   // unhook
   e:= h.Unhook;
   if e<> nil then 
   begin
      jObject.Strings['error'] := e.ToString;
      code := 500; // generic error
      jsonResponse(res, jObject.AsJSON, code);
      Exit;
   end;

   // success
   jsonResponse(res, jObject.AsJSON);

  finally
   jObject.Free;
  end;
end;
procedure SetProcess(req: TRequest; res: TResponse);
var
   name	     : string;
   proc	     : process;
   foundproc : process;
   procs     : TList<process>;
   jObject   : TJSONObject;
   e	     : Exception;
   code	     : integer;
begin
  try
   jObject := TJSONObject.Create;
   name:=req.RouteParams['name'];
   foundproc:=nil;
   procs := l.GetList;
   for proc in procs do
   begin
      if CompareText(proc.Name, uppercase(name)) = 0 then
      begin
	 foundproc := proc;
	 break;
      end;
   end;
   
   e := nil;
   if foundproc <> nil then
      e := h.Hook(proc)
   else
      e := Exception.Create('Process not found.');
   
   if e <> nil then
   begin
      code := 500; // generic error
      jObject.Strings['error'] := e.ToString;
   end
   else
   begin
      code := 200; // generic success
      jObject.Add('found', true);
      jObject.Strings['name'] := foundproc.Name;
      jObject.Add('id', foundproc.ID);
   end;

   jsonResponse(res, jObject.AsJSON, code);
  finally
   jObject.Free;
  end;
end;

procedure RouterInit(_c : config; _l : list; _h : hook);
begin
   c:=_c;
   l:=_l;
   h:=_h;
end;


end.
