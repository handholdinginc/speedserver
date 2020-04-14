unit uCeConfig;

{$MODE Delphi}

interface

uses SysUtils, speed, symbolhandler;

type 
   ceConfig = class(config)
      function IsConfigSet(c :  string) : boolean;
      function SetConfig(c : string) : string;
      function Init : Exception;
   end;		    

implementation

   function ceConfig.IsConfigSet(c :  string) : boolean;
   begin
      result:=false;
   end;

   function ceConfig.SetConfig(c : string) : string;
   begin
      result:='';
   end;

   function ceConfig.Init : Exception;
   begin
      symhandlerInitialize;
      symhandler.waitforsymbolsloaded(true);
      symhandler.loadCommonModuleList;
      result:=nil;
   end;

end.

   

