unit speed;

{$MODE Delphi}
{ prevent interfaces from implementing IUnknown by default: }
{ cf. https://forum.lazarus.freepascal.org/index.php?topic=30431.0 }
{$interfaces corba} 

interface

uses
SysUtils, Classes, Generics.Collections, uprocess;

// handles getting list of processes
type
   list	= interface
      function GetList : TList<process>;
   end;

// the hooking interface, which contains information on
// which processes are hooked and methods which hook them.
type 
   hook = interface
      function Hook (p : process) : Exception;
      function GetProcess : process;
      function SetSpeed(f : single) : Exception;
      function Unhook : Exception;
   end;

// initialization
type
   config =  interface
      function IsConfigSet(c : string) : boolean;
      function SetConfig(c : string) : string;
      function Init : Exception;
   end;


implementation


end.
