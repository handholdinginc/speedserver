unit uprocess;

{$MODE Delphi}

interface

uses
Generics.Collections;


type 
   process = class(TEnumerable<string>)
   private
      pID : dword;
      pName : string;
      procedure setID(i : dword);
      procedure setName(n : string);
   public
      property ID   : dword read pID write setID;
      property Name : string read pName write setName;
   end;		    

implementation

   procedure process.setID(i:dword);
   begin
      pID := i;
   end;
      
   procedure process.SetName(n : string);
   begin
      pName := n;
   end;

end.

   
