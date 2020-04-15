program main;

{$MODE Delphi}

uses
// CE:
Interfaces, LCLIntf, LCLProc, SysUtils, Classes, Graphics,Controls, Forms, ComCtrls, StdCtrls, Menus, Buttons, ExtCtrls, Dialogs, Clipbrd, CEDebugger, assemblerunit,hotkeyhandler, ImgList, commctrl, NewKernelHandler,symbolhandler, ActnList, LResources, autoassembler, disassembler, peinfounit, pointervaluelist, frmRegistersunit, addresslist,windows7taskbar, customtypehandler,  luahandler, frmSelectionlistunit,win32int, formdesignerunit,ceguicomponents, frmautoinjectunit, trainergenerator,xmplayer_server, {$ifdef windows}win32proc{$endif},vmxfunctions, FileUtil, FPimage, GraphType, IntfGraphics, xmlutils, LazLogger, LazUTF8, LCLVersion,cefuncproc, MainUnit2, ProcessWindowUnit, MemoryBrowserFormUnit, TypePopup, HotKeys,aboutunit, formhotkeyunit, formDifferentBitSizeUnit,CommentsUnit, formsettingsunit, formAddressChangeUnit, Changeoffsetunit,FoundCodeUnit, advancedoptionsunit, frmProcessWatcherUnit,formPointerOrPointeeUnit,  formmemoryregionsunit, formProcessInfo,PasteTableentryFRM, pointerscannerfrm, PointerscannerSettingsFrm,frmFloatingPointPanelUnit, pluginexports {$ifdef windows},DBK32functions {$endif},StructuresFrm2,ProcessHandlerUnit, Globals {$ifdef windows},winsapi{$endif}, Filehandler{$ifdef windows}, feces{$endif},ceregistry ,UnexpectedExceptionsHelper,frmFoundlistPreferencesUnit {$ifdef windows}, cheatecoins{$endif}, 
Windows, // debugging
speed, 
uCeHook,
uCeConfig,
uCeList,
Server,
Generics.Collections,
uprocess;


var
   _c	  : config;
   _l	  : list;
   proc	  : process;
   procs  : TList<process>;
   _h	  : hook;
begin

   // init the ce speedhack
   _c := ceConfig.Create;
   _c.Init;

   // init the process list
   _l := ceList.Create;
   //procs := l.GetList; // to get the list

   // init the code
   _h := ceHook.Create;
   //h.Hook(proc); // to hook
   //h.SetSpeed(10.0);

   RunWebServer(_c,_l,_h, 9080);

end.
