FPC = 'C:\pp\bin\x86_64-win64\fpc.exe'
FPCP = -Twin64 -Px86_64 -Rintel -MDelphi -Scghi -g -gl -WG -l -vewnhibq
CEINC = -Fi'vendor/cheat-engine/Cheat Engine' -Fi'vendor/cheat-engine/Cheat Engine/lib/x86_64-win64' -FiC:\lazarus\ide\include\win64 -FiC:\lazarus\images -FiC:\lazarus\ideintf\images

CEDEPS = -Fu'vendor/cheat-engine/Cheat Engine/VEHDebug' -Fu'vendor/cheat-engine/Cheat Engine/dbk32' -Fu'vendor/cheat-engine/Cheat Engine/lua' -Fu'vendor/cheat-engine/Cheat Engine/jvdesign' -FuC:\lazarus\designer -FuC:\lazarus\ide -FuC:\lazarus\components\ideintf\units\x86_64-win64\win32 -FuC:\lazarus\components\synedit\units\x86_64-win64\win32 -FuC:\lazarus\components\lazcontrols\lib\x86_64-win64\win32 -FuC:\lazarus\lcl\units\x86_64-win64\win32 -FuC:\lazarus\lcl\units\x86_64-win64 -FuC:\lazarus\components\codetools\units\x86_64-win64 -FuC:\lazarus\components\lazutils\lib\x86_64-win64 -FuC:\lazarus\packager\units\x86_64-win64 -Fu'vendor/cheat-engine/Cheat Engine' -FU'lib\x86_64-win64' -FE'vendor/cheat-engine/Cheat Engine/bin'

all: 
	$(FPC) $(FPCP) $(CEINC) $(CEDEPS) -Fumodels -Fucheatengine -Fuwindows -Fulogic -Furouter -FEbin -dLCL -dLCLwin32 main.pas 

# 'C:\pp\bin\x86_64-win64\fpc.exe'  -Twin64 -Px86_64 -Rintel -MDelphi -Scghi -g -gl -WG -l -vewnhibq -Filib\x86_64-win64 -FiC:\lazarus\ide\include\win64 -FiC:\lazarus\images -FiC:\lazarus\ideintf\images -FuVEHDebug -Fudbk32 -Fulua -Fujvdesign -FuC:\lazarus\designer -FuC:\lazarus\ide -FuC:\lazarus\components\ideintf\units\x86_64-win64\win32 -FuC:\lazarus\components\synedit\units\x86_64-win64\win32 -FuC:\lazarus\components\lazcontrols\lib\x86_64-win64\win32 -FuC:\lazarus\lcl\units\x86_64-win64\win32 -FuC:\lazarus\lcl\units\x86_64-win64 -FuC:\lazarus\components\codetools\units\x86_64-win64 -FuC:\lazarus\components\lazutils\lib\x86_64-win64 -FuC:\lazarus\packager\units\x86_64-win64 -Fu. -FUlib\x86_64-win64 -FEbin -obin\server-x86_64.exe -dLCL -dLCLwin32


