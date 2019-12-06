# README - Deploy Spark on a Swarm cluster

This is just an example setup. Edit service definitions (`*.yml` files) to adjust to your needs. 

## Prerequisites

Create an overlay network `hadoop-net`. For example:

    docker network create --driver overlay --attachable --subnet 192.168.8.0/22 hadoop-net

## Setup

Start namenode stack:

    docker stack deploy -c namenode.yml namenode

Prepare data directories for datanodes. Then, start datanode stack:

    docker stack deploy -c datanodes.yml datanode

After a while, verify that all datanodes have registered to namenode:

    docker run --rm -it --network hadoop-net --name cli1 --env-file env.sh bde2020/hadoop-base:1.1.0-hadoop2.8-java8 hdfs dfsadmin -report

Start Spark (master and workers in standalone mode):
    
    docker stack deploy -c spark.yml spark


