#!/bin/bash -x

# unzip aws-java-sdk-1.11.219.zip aws-java-sdk-1.11.219/lib/aws-java-sdk-1.11.219.jar aws-java-sdk-1.11.219/third-party/lib/\*

CLASSPATH=".:$CLASSPATH:aws-java-sdk-1.11.219/lib/aws-java-sdk-1.11.219.jar:aws-java-sdk-1.11.219/third-party/lib/*"

code=S3Sample

if [ $code.class -ot $code.java ]; then
  javac -O -Xlint -cp "$CLASSPATH" $code.java
else
  true
fi
if [ $? -eq 0 ]; then
  java -cp "$CLASSPATH" $code
fi
