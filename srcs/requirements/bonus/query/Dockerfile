FROM jenkins/jenkins:lts
USER root

# Install necessary tools
RUN apt-get update && apt-get install -y wget unzip

# Install Query Monitor
RUN wget https://downloads.wordpress.org/plugin/query-monitor.zip && \
    unzip query-monitor.zip -d /var/jenkins_home/plugins/ && \
    rm query-monitor.zip

# Configuration of Jenkins (you may add other configurations here)
USER jenkins
