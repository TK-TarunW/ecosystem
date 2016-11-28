@echo off
cd bin/windows
start kafka-console-producer.bat --broker-list localhost:9092 --topic test
cd "%~dp0"