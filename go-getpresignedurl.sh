#!/bin/bash -x

# unzip aws-java-sdk-1.11.219.zip aws-java-sdk-1.11.219/lib/aws-java-sdk-1.11.219.jar aws-java-sdk-1.11.219/third-party/lib/\*

#CLASSPATH=".:$CLASSPATH:aws-java-sdk-1.11.219/lib/aws-java-sdk-1.11.219.jar:aws-java-sdk-1.11.219/third-party/lib/*"
CLASSPATH=".:$CLASSPATH:aws-java-sdk-1.11.219/lib/aws-java-sdk-1.11.219.jar:aws-java-sdk-1.11.219/third-party/lib/commons-logging-1.1.3.jar:aws-java-sdk-1.11.219/third-party/lib/jackson-databind-2.6.7.1.jar:aws-java-sdk-1.11.219/third-party/lib/jackson-core-2.6.7.jar:aws-java-sdk-1.11.219/third-party/lib/jackson-annotations-2.6.0.jar:aws-java-sdk-1.11.219/third-party/lib/httpcore-4.4.4.jar:aws-java-sdk-1.11.219/third-party/lib/httpclient-4.5.2.jar:aws-java-sdk-1.11.219/third-party/lib/joda-time-2.8.1.jar"

code=GetPresignedUrl

if [ $code.class -ot $code.java ]; then
  javac -O -Xlint -cp "$CLASSPATH" $code.java
else
  true
fi
if [ $? -eq 0 ]; then
  java -cp "$CLASSPATH" $code
fi
