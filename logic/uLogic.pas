unit uLogic;

{$MODE Delphi}

interface

uses uProcess;
   // global functions

function logic_CreateProcessFromString(s :string) : process;

implementation

   function logic_CreateProcessFromString(s :string) : process; 
   var
      id   : integer;
      sId  : string; // string of id
      e	   : integer; // error
   begin
      { writeln(s); }
      result := process.Create;
      // numeric ID is the first few characters
      sID := '$' + copy(s, 1, 8);      
      val(sID, id, e); // convert from str to int
      if e<> 0 then
	 Exit(nil);
      result.ID:=id;

      // the name is the rest 
      result.Name:=copy(s,10,length(s)-1);
   end;
end.
