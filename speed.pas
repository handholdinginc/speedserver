unit speed;

{$MODE Delphi}
{ prevent interfaces from implementing IUnknown by default: }
{ cf. https://forum.lazarus.freepascal.org/index.php?topic=30431.0 }
{$interfaces corba} 

interface

uses
SysUtils, Classes, Generics.Collections, uprocess;

type 
   hook = interface
      function Hook (p : process) : Exception;
      function SetSpeed(f : single) : Exception;
      function Unhook : Exception;
   end;

type
   config =  interface
      function IsConfigSet(c : string) : boolean;
      function SetConfig(c : string) : string;
      function Init : Exception;
   end;

type
   list	= interface
      function GetList : TList<process>;
   end;

implementation


end.
