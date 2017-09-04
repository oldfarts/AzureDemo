FROM java:8

#Author - maintainer
MAINTAINER Author Name jani.arvas@gmail.com

#Install java 8
#--------------------------------------------------------------------
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN echo 'deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' >> /etc/apt/sources.list && \
    echo 'deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886 && \
    apt-get update && \
    echo oracle-java${JAVA_VER}-installer shared/accepted-oracle-license-v1-1 select true |  /usr/bin/debconf-set-selections && \
    apt-get install -y --force-yes --no-install-recommends oracle-java${JAVA_VER}-installer oracle-java${JAVA_VER}-set-default && \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk${JAVA_VER}-installer

#RUN update-java-alternatives -s java-8-oracle

RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc

#RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Start compiling the robottiroo program
#------------------------------------------------------------------
WORKDIR /opt/robottiroo/
RUN wget 'http://scriptdownloader.robo.ceo/binaries/locallibs.tar.gz'
RUN tar -xzvf locallibs.tar.gz
RUN rm locallibs.tar.gz

#Get robosdk stuff
RUN mkdir -p /opt/robottiroo/robosdk/
WORKDIR /opt/robottiroo/robosdk/
RUN wget 'http://scriptdownloader.robo.ceo/distribution/robosdk.tar.gz'
RUN tar -xzvf robosdk.tar.gz
RUN rm robosdk.tar.gz

#Install gradle for compilation
WORKDIR /opt/gradle/
RUN wget -q https://services.gradle.org/distributions/gradle-4.1-bin.zip \
    && unzip gradle-4.1-bin.zip -d /opt \
    && rm gradle-4.1-bin.zip
ENV GRADLE_HOME=/opt/gradle-4.1
ENV PATH=$PATH:$GRADLE_HOME/bin

#Compile gradle customBuild
#WORKDIR /opt/robottiroo/
COPY ./build.gradle /opt/robottiroo/
COPY ./build.gradlew /opt/robottiroo/
WORKDIR /opt/robottiroo/robosdk
RUN gradle customBuild

#Compile java files
#WORKDIR /opt/robottiroo/robosdk/
RUN java -Dfucktests=true Launch deploy.DeployManager

#Create VOLUME directory
RUN mkdir -p /opt/robottiroo/robottiyliherra_storage/data/
#RUN ln -s /opt/robottiroo/robottiyliherra_storage _deploy/current/
RUN mkdir -p /var/www/html
RUN echo "This is the content for file1.html" > /var/www/html/file1.html
RUN echo "This is the content for file2.html" > /var/www/html/file2.html
RUN echo "This is the content for index.html" > /var/www/html/index.html
#ADD /home/staging/staging/data/prevcontexts.data
VOLUME /home/staging/staging/robottiyliherra_storage/data/
#VOLUME /var/www/html

#Deploy the program
#-------------------------------------------------------------------
COPY ./deploy.sh /opt/robottiroo/


WORKDIR /opt/robottiroo/robosdk

EXPOSE 80
EXPOSE 443
CMD ["/opt/robottiroo/deploy.sh"]
#ENTRYPOINT /usr/bin/tail -f /dev/null


#run --rm -v $PWD:/robottiroo -p  80:443 -w /opt/robottiroo/robosdk robottiroo:latest  javac Launch.java


