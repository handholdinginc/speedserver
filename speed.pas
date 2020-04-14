unit speed;

{$MODE Delphi}

interface

uses
SysUtils, Classes, Generics.Collections, mprocess;

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
