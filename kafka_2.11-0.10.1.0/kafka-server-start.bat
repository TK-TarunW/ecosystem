@echo off
cd bin/windows
start kafka-server-start.bat "%~dp0kafka-server.properties"
cd "%~dp0"

