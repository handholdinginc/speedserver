unit Server;

{$MODE Delphi}

interface

uses
speed,
router,
fphttpapp,  httproute;

// global methods
procedure RunWebServer(_c : config; _l : list; _h : hook; port : integer); 

implementation
   //main webserver loop
   procedure RunWebServer(_c : config; _l : list; _h : hook; port: integer);
   begin
      Application.Port := port;
      RouterInit(_c,_l,_h);
      HTTPRouter.RegisterRoute('/api/set/:name', @SetProcess);
      HTTPRouter.RegisterRoute('/api/speed/:speed/:name', @SetSpeed);
      HTTPRouter.RegisterRoute('/api/list', @GetProcessList);
      HTTPRouter.RegisterRoute('/api/disable', @SetDisable);      
      Application.Threaded := true;
      Application.Initialize;
      Application.Run;
   end;
end.
