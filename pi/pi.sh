#!

echo "running pi counting jobs"
# hadoop fs -copyFromLocal 
hadoop fs -rm -r -f $HADOOP_HOME/data/pi_result 

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar \
-input $HADOOP_HOME/data/pi/ \
-output $HADOOP_HOME/data/pi_result \
-mapper "$HADOOP_HOME/R_code/pi/mapper.R 1000"  \
-reducer $HADOOP_HOME/R_code/pi/reducer.R  \
-file $HADOOP_HOME/R_code/pi/mapper.R  \
-file $HADOOP_HOME/R_code/pi/reducer.R  \
-jobconf mapred.reduce.tasks=1

echo "done. here is the results"
hadoop fs -ls $HADOOP_HOME/data/pi_result 
hadoop fs -cat $HADOOP_HOME/data/pi_result/part*

