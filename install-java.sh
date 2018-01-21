#!/usr/bin/env bash
sudo yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel
dirname $(readlink $(readlink $(which java)))

# Add following lines (w/o comment) to /etc/profile and run the command
#export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.151-1.b12.el7_4.x86_64/jre
#export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.151-5.b12.el7_4.x86_64/jre
#export PATH=$PATH:$JAVA_HOME/bin
#export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar
vi /etc/profile
source /etc/profile