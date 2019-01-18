# CENTOS, Oracle Java
cd /opt/
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/8u192-b12/750e1c8617c5452694857ad95c3ee230/jdk-8u192-linux-x64.tar.gz"
tar xzf jdk-8u192-linux-x64.tar.gz
cd /opt/jdk1.8.0_192/
alternatives --install /usr/bin/java java /opt/jdk1.8.0_192/bin/java 2
alternatives --config java # Choose here
alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_192/bin/jar 2
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_192/bin/javac 2
alternatives --set jar /opt/jdk1.8.0_192/bin/jar
alternatives --set javac /opt/jdk1.8.0_192/bin/javac
# Add to java.sh in /etc/profile.d/
export JAVA_HOME=/opt/jdk1.8.0_192
export JRE_HOME=/opt/jdk1.8.0_192/jre
export PATH=$PATH:/opt/jdk1.8.0_192/bin:/opt/jdk1.8.0_192/jre/bin

