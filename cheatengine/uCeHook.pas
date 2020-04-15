unit uCeHook;

{$MODE Delphi}

interface

uses speedhack2, 
SysUtils, // Exception
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
      function GetProcess : process;
   end;		    

implementation
var
   ProcessSelected : boolean;
   hookActive	   : boolean;
   currProcess	   : process;
   prevProcess	   : process;
   currSpeed	   : single;
   prevSpeed	   : single;   

  function ceHook.GetProcess : process;
  begin
     if (hookActive) then
	Exit(currProcess)
     else
	Exit(nil);
  end;
	   
  function ceHook.Hook (p : process) : Exception;
  var
     e	    : integer; // error
     proch  : TProcessHandler;
     pid    : dword;
  begin
     // TODO: check if hooked to a different process already
     // if so, unhook first

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
     
     // update currently hooked process data
     hookActive:=true;
     prevProcess:= currProcess;
     currProcess:= p;

     result:=nil;
  end;

  function ceHook.SetSpeed(f : single) : Exception;
  begin
     speedhack.setSpeed(f);
     exit(nil);
  end;

  function ceHook.Unhook : Exception;
  var
     e : Exception;
  begin
     // TODO: implement unhooking
     e:=nil;
     if (hookActive) then
	e:= SetSpeed(1.0);

     hookActive:=false;
     prevProcess:= currProcess;
     currProcess:=nil;

     Exit(e);
  end;

initialization
begin
   currSpeed:=1.0;
   prevSpeed:=1.0;
end;



end.

   

