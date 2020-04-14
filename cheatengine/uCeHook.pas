unit uCeHook;

{$MODE Delphi}

interface

uses speedhack2, 
SysUtils, 
windows, // windows api calls
ProcessHandlerUnit, // processhandler
symbolhandler, // symhandler
NewKernelHandler, // DontUseDBKOpenProcess
speed, uProcess;

type 
   ceHook = class(hook)
      function Hook (p : process) : Exception;
      function SetSpeed(f : single) : Exception;
      function Unhook : Exception;
   end;		    
var
   ProcessSelected :  boolean;

implementation

  function ceHook.Hook (p : process) : Exception;
  var
     e	    : integer; // error
     proch  : TProcessHandler;
     pid    : dword;
  begin
     if p = nil then
	Exit(Exception.Create('nil process passed'));

     // pwop
     proch:= ProcessHandler;
     pid := p.ID;
     ProcessHandler.processid := p.ID;
     DontUseDBKOpenProcess;
     SetLastError (0);
     ProcessHandler.ProcessHandle:=NewKernelHandler.OpenProcess(process_all_access,false,ProcessHandler.processid);
     e:=GetLastError;
     if e <> 0 then
	Exit(Exception.Create(Format('OpenProcess failed with error %d', [e])));
     ProcessSelected:=true;
     symhandler.reinitialize; 
     symhandler.waitforsymbolsloaded(true);

     // create speedhack
     if speedhack <> nil then
	FreeAndNil(speedhack);
     speedhack := TSpeedhack.Create;
     
     result:=nil;
  end;

  function ceHook.SetSpeed(f : single) : Exception;
  begin
     speedhack.setSpeed(f);
     exit(nil);
  end;

  function ceHook.Unhook : Exception;
  begin
  end;

end.

   

