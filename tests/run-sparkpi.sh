#/bin/bash

# Note: we assume that examples JAR is uploaded at hdfs:///jars/spark-examples.jar

docker run -it --rm --network hadoop-net -e "CORE_CONF_fs_defaultFS=hdfs://namenode:8020" -e "SPARK_MASTER=spark://spark:7077" \
  "bde2020/spark-base:2.3.1-hadoop2.8" /spark/bin/spark-submit \
     --master spark://spark:7077 --class org.apache.spark.examples.SparkPi --executor-memory 2G --total-executor-cores 12 hdfs:///jars/spark-examples.jar 1000
