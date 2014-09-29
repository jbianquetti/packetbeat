FROM dockerfile/elasticsearch
MAINTAINER Brian L. Scott "Brainscott@gmail.com"
RUN apt-get update
RUN sudo apt-get install curl -y
RUN echo "Installing Kibana..."
WORKDIR /data 
RUN curl -L -O https://github.com/packetbeat/kibana/releases/download/v3.0.0-pb/kibana-3.0-packetbeat.tar.gz
RUN tar -xzvf kibana-3.0-packetbeat.tar.gz
WORKDIR /data/kibana-3.0-packetbeat

EXPOSE 8000
EXPOSE 9200
EXPOSE 22
CMD ["/elasticsearch/bin/elasticsearch"]
CMD ["python", "-m", "SimpleHTTPServer"]
