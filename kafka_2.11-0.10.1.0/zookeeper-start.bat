@echo off
cd bin/windows
start zookeeper-server-start.bat "%~dp0zookeeper.properties"
cd "%~dp0"

