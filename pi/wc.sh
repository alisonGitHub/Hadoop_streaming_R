#!

echo "running word counting jobs - R code"

# hadoop fs -copyFromLocal 
hadoop fs -rm -r -f $HADOOP_HOME/data/wordCount_result \

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar \
-input $HADOOP_HOME/data/wordCount/ \
-output $HADOOP_HOME/data/wordCount_result \
-mapper $HADOOP_HOME/R_code/wordCount/mapper.R \
-reducer $HADOOP_HOME/R_code/wordCount/reducer.R  \
-file $HADOOP_HOME/R_code/wordCount/mapper.R  \
-file $HADOOP_HOME/R_code/wordCount/reducer.R  \
-jobconf mapred.reduce.tasks=2

echo "done. here is the results"
hadoop fs -ls $HADOOP_HOME/data/wordCount_result 
hadoop fs -cat $HADOOP_HOME/data/wordCount_result/part* 

