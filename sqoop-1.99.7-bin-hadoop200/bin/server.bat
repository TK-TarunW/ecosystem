@echo off
set HADOOP_HOME=E:\TK-tarunw\reqsol\ecosystem\hadoop-2.7.3
set HADOOP_COMMON_HOME=%HADOOP_HOME%\share\hadoop\common
set HADOOP_HDFS_HOME=%HADOOP_HOME%\share\hadoop\hdfs
set HADOOP_MAPRED_HOME=%HADOOP_HOME%\share\hadoop\mapreduce
set HADOOP_YARN_HOME=%HADOOP_HOME%\share\hadoop\yarn
set SQOOP_BASEDIR=E:\TK-tarunw\reqsol\ecosystem\sqoop-1.99.7-bin-hadoop200
set DEFAULT_SQOOP_CONF_DIR=%SQOOP_BASEDIR%\conf
set SQOOP_IDENT_STRING=%USER%
set SQOOP_PID_DIR=%SQOOP_BASEDIR%\tmp
set sqoop_pidfile=%SQOOP_PID_DIR%\sqoop-tarunwalia-jetty-server.pid"
set JAVA_OPTS=-Dsqoop.config.dir=%DEFAULT_SQOOP_CONF_DIR%
set SQOOP_CLIENT_LIB=%SQOOP_BASEDIR%\shell\lib\*
set SQOOP_SERVER_LIB=%SQOOP_BASEDIR%\server\lib\*
set SQOOP_TOOLS_LIB=%SQOOP_BASEDIR%\tools\lib\*

set HADOOP_COMMON_HOME_LIB=%HADOOP_HOME%\share\hadoop\common\lib\*
set HADOOP_HDFS_HOME_LIB=%HADOOP_HOME%\share\hadoop\hdfs\lib\*
set HADOOP_MAPRED_HOME_LIB=%HADOOP_HOME%\share\hadoop\mapreduce\lib\*
set HADOOP_YARN_HOME_LIB=%HADOOP_HOME%\share\hadoop\yarn\lib\*

set HADOOP_COMMON_LIB=%HADOOP_HOME%\share\hadoop\common\*
set HADOOP_HDFS_LIB=%HADOOP_HOME%\share\hadoop\hdfs\*
set HADOOP_MAPRED_LIB=%HADOOP_HOME%\share\hadoop\mapreduce\*
set HADOOP_YARN_LIB=%HADOOP_HOME%\share\hadoop\yarn\*



set CLASSPATH= %HADOOP_MAPRED_LIB%;%SQOOP_SERVER_LIB%;%SQOOP_CLIENT_LIB%;%SQOOP_TOOLS_LIB%;%HADOOP_COMMON_HOME_LIB%;%HADOOP_HDFS_HOME_LIB%,%HADOOP_MAPRED_HOME_LIB%;%HADOOP_YARN_HOME_LIB%;%HADOOP_COMMON_LIB%;%HADOOP_HDFS_LIB%;%HADOOP_MAPRED_LIB%;%HADOOP_YARN_LIB%






java %JAVA_OPTS%  -cp %CLASSPATH% org.apache.sqoop.server.SqoopJettyServer