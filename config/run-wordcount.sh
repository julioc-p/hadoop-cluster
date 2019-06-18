#!/bin/bash

# probar el cluster de hadoop con el wordcount

# crear archivos de input 
mkdir input
echo "Hola Docker" >input/file2.txt
echo "Hola Hadoop" >input/file1.txt

# crear el directorio de input en el HDFS
hadoop fs -mkdir -p input

# colocar los archivos en el directorio
hdfs dfs -put ./input/* input

# correr el wordcount 
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-3.2.0-sources.jar org.apache.hadoop.examples.WordCount input output

# mostrar los archivos de input
echo -e "\ninput file1.txt:"
hdfs dfs -cat input/file1.txt

echo -e "\ninput file2.txt:"
hdfs dfs -cat input/file2.txt

# mostrar el output del wordcount
echo -e "\nwordcount output:"
hdfs dfs -cat output/part-r-00000