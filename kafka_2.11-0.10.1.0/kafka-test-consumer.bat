@echo off
cd bin/windows
start kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic test --from-beginning
cd "%~dp0"