@echo off
cd bin/windows
call kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
cd "%~dp0"