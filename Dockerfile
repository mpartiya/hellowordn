FROM java:openjdk-8-jdk

# Install Mule standalone 3.9.0
#RUN cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.9.0/mule-standalone-3.9.0.tar.gz && echo "39b773bf20702f614faf30b2ffca4716 mule-standalone-3.9.0.tar.gz" | md5sum -c
#RUN cd /opt && tar xvzf ~/mule-standalone-3.9.0.tar.gz && rm ~/mule-standalone-3.9.0.tar.gz && ln -s /opt/mule-standalone-3.9.0 /opt/mule

# Install Mulemule-standalone-4.3.0-20210119
RUN cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/4.3.0-20210119/mule-standalone-4.3.0-20210119.tar.gz && echo "0859dad4a6dd992361d34837658e517d mule-standalone-4.3.0-20210119.tar.gz" | md5sum -c
RUN cd /opt && tar xvzf ~/mule-standalone-4.3.0-20210119.tar.gz && rm ~/mule-standalone-4.3.0-20210119.tar.gz && ln -s /opt/mule-standalone-4.3.0-20210119 /opt/mule

#Define environment variables.# Copy hello word app
#COPY helloword.zip "/opt/mule/apps"
#COPY $(build.artifactstagingdirectory)/drop/target/1.0-mule-application.jar "/opt/mule/apps"

COPY $(System.DefaultWorkingDirectory)/_Emersonprocess-helloword/drop/target/1.0-mule-application.jar "/opt/mule/apps"

#COPY helloword.jar "/opt/mule/apps"

# Define working directory.
WORKDIR /opt/mule

# Command to start the application
CMD [ "/opt/mule/bin/mule" ]

# Default http port
EXPOSE 8091:8091
