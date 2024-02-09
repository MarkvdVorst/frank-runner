:: This file is generated by build.xml
@echo off
setlocal enabledelayedexpansion
if not exist "%~dp0download\" (
	mkdir "%~dp0download"
)
if not exist "%~dp0build\tmp\build\" (
	mkdir "%~dp0build\tmp\build"
)
set DOWNLOAD_HELP=download https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.2+13/OpenJDK21U-jdk_x64_windows_hotspot_21.0.2_13.zip manually, move it to %~dp0download and restart this script
if not exist "%~dp0download\OpenJDK21U-jdk_x64_windows_hotspot_21.0.2_13.zip" (
	echo "In case of errors %DOWNLOAD_HELP%"
	curl -f -o "%~dp0download\OpenJDK21U-jdk_x64_windows_hotspot_21.0.2_13.zip.tmp" -L https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.2+13/OpenJDK21U-jdk_x64_windows_hotspot_21.0.2_13.zip
	if !errorlevel! neq 0 (
		echo "Please %DOWNLOAD_HELP%"
		goto error
	)
	move "%~dp0download\OpenJDK21U-jdk_x64_windows_hotspot_21.0.2_13.zip.tmp" "%~dp0download\OpenJDK21U-jdk_x64_windows_hotspot_21.0.2_13.zip"
)
if not exist "%~dp0build\jdk-21.0.2+13\" (
	tar --exclude=*/demo --exclude=*/sample --exclude=*/manual --exclude=*/src.zip -xvf "%~dp0download\OpenJDK21U-jdk_x64_windows_hotspot_21.0.2_13.zip" -C "%~dp0build\tmp\build"
	if !errorlevel! neq 0 (
		echo "Please %DOWNLOAD_HELP%"
		goto error
	)
	move "%~dp0build\tmp\build\jdk-21.0.2+13" "%~dp0build\jdk-21.0.2+13"
)
set DOWNLOAD_HELP=download https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.10-bin.zip manually, move it to %~dp0download and restart this script
if not exist "%~dp0download\apache-ant-1.10.10-bin.zip" (
	echo "In case of errors %DOWNLOAD_HELP%"
	curl -f -o "%~dp0download\apache-ant-1.10.10-bin.zip.tmp" -L https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.10-bin.zip
	if !errorlevel! neq 0 (
		echo "Please %DOWNLOAD_HELP%"
		goto error
	)
	move "%~dp0download\apache-ant-1.10.10-bin.zip.tmp" "%~dp0download\apache-ant-1.10.10-bin.zip"
)
if not exist "%~dp0build\apache-ant-1.10.10\" (
	tar --exclude=*/demo --exclude=*/sample --exclude=*/manual --exclude=*/src.zip -xvf "%~dp0download\apache-ant-1.10.10-bin.zip" -C "%~dp0build\tmp\build"
	if !errorlevel! neq 0 (
		echo "Please %DOWNLOAD_HELP%"
		goto error
	)
	move "%~dp0build\tmp\build\apache-ant-1.10.10" "%~dp0build\apache-ant-1.10.10"
)
set DOWNLOAD_HELP=download https://github.com/mozilla/rhino/releases/download/Rhino1_7_14_Release/rhino-1.7.14.zip manually, move it to %~dp0download and restart this script
if not exist "%~dp0download\rhino-1.7.14.zip" (
	echo "In case of errors %DOWNLOAD_HELP%"
	curl -f -o "%~dp0download\rhino-1.7.14.zip.tmp" -L https://github.com/mozilla/rhino/releases/download/Rhino1_7_14_Release/rhino-1.7.14.zip
	if !errorlevel! neq 0 (
		echo "Please %DOWNLOAD_HELP%"
		goto error
	)
	move "%~dp0download\rhino-1.7.14.zip.tmp" "%~dp0download\rhino-1.7.14.zip"
)
if not exist "%~dp0build\rhino1.7.14\" (
	tar --exclude=*/demo --exclude=*/sample --exclude=*/manual --exclude=*/src.zip -xvf "%~dp0download\rhino-1.7.14.zip" -C "%~dp0build\tmp\build"
	if !errorlevel! neq 0 (
		echo "Please %DOWNLOAD_HELP%"
		goto error
	)
	move "%~dp0build\tmp\build\rhino1.7.14" "%~dp0build\rhino1.7.14"
)
if not exist "%~dp0build\apache-ant-1.10.10\lib\rhino-1.7.14.jar" (
	del "%~dp0build\apache-ant-1.10.10\lib\rhino-*.jar"
	copy "%~dp0build\rhino1.7.14\lib\rhino-*.jar" "%~dp0build\apache-ant-1.10.10\lib\"
)
set JDK_8_DIR=%~dp0%build\jdk8u392-b08
set JDK_11_DIR=%~dp0%build\jdk-11.0.21+9
set JDK_17_DIR=%~dp0%build\jdk-17.0.8+7
set JDK_21_DIR=%~dp0%build\jdk-21.0.2+13
set JAVA_HOME=%JDK_21_DIR%
set ANT_HOME=%~dp0build\apache-ant-1.10.10
call "%~dp0build\apache-ant-1.10.10\bin\ant" -Dfr.jdk.8.dir="%JDK_8_DIR%" -Dfr.jdk.11.dir="%JDK_11_DIR%" -Dfr.jdk.17.dir="%JDK_17_DIR%" -Dfr.jdk.21.dir="%JDK_21_DIR%" -emacs -buildfile "%~dp0build.xml" %* start
if %errorlevel% equ 0 goto end
:error
rem https://superuser.com/questions/527898/how-to-pause-only-if-executing-in-a-new-window
set arg0=%0
if [%arg0:~2,1%]==[:] if not [%TERM_PROGRAM%] == [vscode] pause
exit /b %errorlevel%
:end
