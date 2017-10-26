FROM ramkumarb/centos-aws:latest

RUN yum install epel-release -y && yum install ansible -y
RUN curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/1.19.3/jet-linux_amd64_1.19.3.tar.gz"
RUN tar -xaC /usr/local/bin -f jet-linux_amd64_1.19.3.tar.gz
RUN chmod +x /usr/local/bin/jet
RUN wget http://stedolan.github.io/jq/download/linux64/jq
RUN chmod +x ./jq
RUN cp jq /usr/bin

RUN wget http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
RUN rpm -Uvh mysql-community-release-el6-5.noarch.rpm
RUN yum -y install mysql mysql-server

RUN yum remove git -y
RUN yum install http://opensource.wandisco.com/centos/6/git/x86_64/wandisco-git-release-6-1.noarch.rpm -y
RUN yum install git -y
