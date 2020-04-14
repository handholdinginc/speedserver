unit mprocess;

{$MODE Delphi}

interface

uses
Generics.Collections;


type 
   process = class(TEnumerable<string>)
   private
      pID : integer;
      pName : string;
      procedure setID(i : integer);
      procedure setName(n : string);
   public
      property ID   : integer read pID write setID;
      property Name : string read pName write setName;
   end;		    

implementation

   // global functions
   function CreateProcessFromString(s :string) : process; 
   var
      p	:  process;
   begin
      // unimplemented
      // TODO: implement creating a process object from a PID string as returned by the windows API
      p := process.Create();
      result := p;
   end;

   procedure process.setID(i:integer);
   begin
      pID := i;
   end;
      
   procedure process.SetName(n : string);
   begin
      pName := n;
   end;
     


end.

   
