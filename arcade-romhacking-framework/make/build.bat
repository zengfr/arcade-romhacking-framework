@echo off
rem set projName=dino
set root=../../../
set buildRoot=../
if not exist %cd%/%projName% mkdir %projName%
cd  %projName%
if not exist %cd%/build mkdir build
cd build
del /q *.*

cmake ../../ -DGAME_NAME:SRING=%projName% -DROM_OFFSET:STRING=%ROM_OFFSET% -DROM_START:STRING=%ROM_START% -DRAM_START:STRING=%RAM_START%  -DCMAKE_TOOLCHAIN_FILE=%root%/make/68K.cmake -G"Unix Makefiles"
pause
make
pause
call "%root%/tool/byteswaptool.exe" %buildRoot%/%projName%_hack.bin 2 %buildRoot%/%projName%_release.rom
pause

copy %projName%.rom fbas\roms\%projName%.rom
cd fbas\roms
"C:\Program Files\WinRAR\winrar.exe" a -r %projName%.zip %projName%.rom
cd ..
mame -g %projName% -w -r 480*224