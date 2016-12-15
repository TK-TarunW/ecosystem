
@echo off
set BASEDIR=E:\TK-tarunw\reqsol\ecosystem\sqoop-1.99.7-bin-hadoop200
set DEFAULT_SQOOP_CONF_DIR=%BASEDIR%\conf
set SQOOP_IDENT_STRING=%USER%
set SQOOP_PID_DIR=%BASEDIR%\tmp
set sqoop_pidfile=%SQOOP_PID_DIR%\sqoop-tarunwalia-jetty-server.pid"
set JAVA_OPTS=-Dsqoop.config.dir=%DEFAULT_SQOOP_CONF_DIR%
set SQOOP_CLIENT_LIB=%BASEDIR%\shell\lib\*
set SQOOP_SERVER_LIB=%BASEDIR%\server\lib\*
set SQOOP_TOOLS_LIB=%BASEDIR%\tools\lib\*
set CLASSPATH= %SQOOP_CLIENT_LIB%;%SQOOP_SERVER_LIB%,%SQOOP_TOOLS_LIB%
echo java %JAVA_OPTS% -cp %CLASSPATH% org.apache.sqoop.shell.SqoopShell

java %JAVA_OPTS%  -cp %CLASSPATH% org.apache.sqoop.tools.ToolRunner