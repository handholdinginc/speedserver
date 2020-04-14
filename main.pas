program main;

{$MODE Delphi}

uses
speed,
Interfaces, jwaWindows, Windows, LCLIntf, LCLProc, Messages, SysUtils, Classes, Graphics,
Controls, Forms, ComCtrls, StdCtrls, Menus, Buttons, shellapi,
imagehlp, ExtCtrls, Dialogs, Clipbrd, CEDebugger, kerneldebugger, assemblerunit,
hotkeyhandler, registry, Math, ImgList, commctrl, NewKernelHandler,
unrandomizer, symbolhandler, ActnList, LResources, hypermode, memscan,
autoassembler, plugin, savefirstscan, menuitemExtra, speedhack2, AccessCheck,
foundlisthelper, disassembler, peinfounit, PEInfoFunctions,
simpleaobscanner, pointervaluelist, ManualModuleLoader, debughelper,
frmRegistersunit, ctypes, addresslist, addresslisthandlerunit, memoryrecordunit,
windows7taskbar, tablist, DebuggerInterface, vehdebugger, tableconverter,
customtypehandler, lua, luahandler, lauxlib, lualib, frmSelectionlistunit,
htmlhelp, win32int, {defaulttranslator,} fileaccess, formdesignerunit,
ceguicomponents, frmautoinjectunit, cesupport, trainergenerator, genericHotkey,
luafile, xmplayer_server, sharedMemory{$ifdef windows}, win32proc{$endif},
vmxfunctions, FileUtil, networkInterfaceApi, networkconfig, d3dhookUnit, PNGcomn,
FPimage, byteinterpreter, frmgroupscanalgoritmgeneratorunit, vartypestrings,
processlist,
groupscancommandparser, GraphType, IntfGraphics, RemoteMemoryManager,
DBK64SecondaryLoader, savedscanhandler, debuggertypedefinitions, networkInterface,
FrmMemoryRecordDropdownSettingsUnit, xmlutils, zstream, zstreamext, commonTypeDefs,
VirtualQueryExCache, LazLogger, LazUTF8, LCLVersion,
cefuncproc, MainUnit2, ProcessWindowUnit, MemoryBrowserFormUnit, TypePopup, HotKeys,
aboutunit, formhotkeyunit, formDifferentBitSizeUnit,
CommentsUnit, formsettingsunit, formAddressChangeUnit, Changeoffsetunit,
FoundCodeUnit, advancedoptionsunit, frmProcessWatcherUnit,
formPointerOrPointeeUnit, OpenSave, formmemoryregionsunit, formProcessInfo,
PasteTableentryFRM, pointerscannerfrm, PointerscannerSettingsFrm,
frmFloatingPointPanelUnit, pluginexports {$ifdef windows},DBK32functions, frmUltimapUnit,
frmSetCrosshairUnit{$endif},StructuresFrm2 {$ifdef windows} ,frmMemoryViewExUnit,
frmD3DHookSnapshotConfigUnit,frmSaveSnapshotsUnit, frmsnapshothandlerUnit,
frmNetworkDataCompressionUnit{$endif},ProcessHandlerUnit, pointeraddresslist,
PointerscanresultReader, Parsers, Globals {$ifdef windows},GnuAssembler, xinput{$endif} ,DPIHelper,
multilineinputqueryunit {$ifdef windows},winsapi{$endif} ,LuaClass, Filehandler{$ifdef windows}, feces{$endif}
{$ifdef windows},frmDBVMWatchConfigUnit, frmDotNetObjectListUnit{$endif} ,ceregistry ,UnexpectedExceptionsHelper
,frmFoundlistPreferencesUnit, fontSaveLoadRegistry{$ifdef windows}, cheatecoins{$endif},strutils,
uCeHook,
uCeConfig,
uCeList,
Generics.Collections,
uprocess;


var
   c	  : config;
   l	  : list;
   proc	  : process;
   procs  : TList<process>;
   pfound : process;
   h	  : hook;

begin

   OutputDebugString('checkpoint 1');

   // testing:
   // configure the ce speedhack
   c := ceConfig.Create;
   c.Init;

   OutputDebugString('checkpoint 2');   

   // get a list of processes
   l := ceList.Create;
   procs := l.GetList;

   OutputDebugString('checkpoint 3');

   pfound := nil;
   for proc in procs do
   begin
      if CompareText(proc.Name, uppercase('blub.exe')) = 0 then
      begin
	 OutputDebugString(proc.Name);
	 pfound := proc;
	 break;
      end;
   end;
	 
   OutputDebugString('checkpoint 4');

   if pfound <> nil  then
   begin
      h := ceHook.Create;
      h.Hook(pfound);
      h.SetSpeed(10.0);
   end;

   OutputDebugString('checkpoint 5');

end.
