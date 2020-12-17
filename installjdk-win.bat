@echo off

echo downloading JDK 15 from jdk.java.net using a HTTP request, this may take a while...
set "download=certutil.exe -urlcache -split -f"
%download% "https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_windows-x64_bin.zip" jdk.zip

echo unpacking zip file...
powershell -Command "Expand-Archive jdk.zip"
copy jdk\jdk-15.0.1\bin jdk
copy jdk\jdk-15.0.1\conf jdk
copy jdk\jdk-15.0.1\include jdk
copy jdk\jdk-15.0.1\jmods jdk
copy jdk\jdk-15.0.1\legal jdk
copy jdk\jdk-15.0.1\lib jdk
copy jdk\jdk-15.0.1\release jdk
delete jdk\jdk-15.0.1
delete jdk.zip

echo [REFLECTING PARAMS] %* | find "-njp" 
if errorlevel 1 goto writejavapath
goto skip_writejavapath
:writejavapath
    del javapath.txt
    echo jdk\bin\java.exe > javapath.txt
:skip_writejavapath    

echo [REFLECTING PARAMS] %* | find "-njh" 
goto skip_setjh
if errorlevel 1 goto setjh
:setjh
    setx "JAVA_HOME=%~f0\jdk"
:skip_setjh

echo [REFLECTING PARAMS] %* | find "-nsp" 
goto skip_setpath
if errorlevel 1 goto setpath
:setpath
    setx "PATH=%PATH%;%~f0\jdk\bin"
:skip_setpath

echo done!

