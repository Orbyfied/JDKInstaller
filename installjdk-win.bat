@echo off

echo downloading JDK 15 from jdk.java.net using a HTTP request, this may take a while...
powershell -Command "Invoke-WebRequest https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_windows-x64_bin.zip -Outfile jdk.zip"

echo unpacking zip file...
powershell -Command "Expand-Archive jdk.zip -DestinationPath \\"
rename jdk-15.0.1 jdk

echo [REFLECTING PARAMS] %* | find "-jp" 
if not errorlevel 1 goto writejavapath
goto skip_writejavapath
:writejavapath
    del javapath.txt
    echo jdk\bin\java.exe > javapath.txt
:skip_writejavapath    

echo [REFLECTING PARAMS] %* | find "-jh" 
goto skip_setjh
if not errorlevel 1 goto setjh
:setjh
    setx JAVA_HOME %~f0\jdk
:skip_setjh

echo [REFLECTING PARAMS] %* | find "-sp" 
goto skip_setpath
if not errorlevel 1 goto setpath
:setpath
    setx PATH %PATH%;%~f0\jdk\bin
:skip_setpath

echo done!

