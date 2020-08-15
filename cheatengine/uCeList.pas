unit uCeList;

{$MODE Delphi}

interface

uses speed, // list
uProcess, // process
uLogic, // CreateProcessFromString
Classes, // TStringList
ProcessList, // GetProcessList
Generics.Collections; // TList


type 
   ceList = class(list)
      function GetList : TList<process>;
   end;		    

implementation

   function ceList.GetList : TList<process>;
   var
      s	 : string;
      sl : TStringList;
      p	 : process;
   begin
      result := TList<process>.Create;
      sl := TStringList.Create;
      GetProcessList(sl);
      
      for s in sl do
      begin
	 result.Insert(0,logic_CreateProcessFromString(s));
      end;	    
   end;

end.

   

