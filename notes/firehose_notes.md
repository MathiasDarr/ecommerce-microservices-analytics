Create a firehose data delivery stream
Buffer Size
    - 5 MB file size
Buffer Interval -> minimum of 60 seconds
    60 seconds
    
    
## Install the kinesis agent ##
sudo yum install -y aws-kinesis-agent

wget http://media.sundog-soft.com/AWSBigData/LogGenerator.zip

unzip the log data

chmod a+x LogGenerator.py

chmod a+x vs chmod 755

cd /etc/aws-kinesis/
sudo vim agent.json




Modify the endpoint to firehose




{
  "cloudwatch.emitMetrics": true,
  "kinesis.endpoint": "",
  "firehose.endpoint": "firehose.us-west-2.amazonaws.com",

  

  "flows": [
    {
      "filePattern": "/tmp/app.log*",
      "kinesisStream": "yourkinesisstream",
      "partitionKeyOption": "RANDOM"
    },
    {
      "filePattern": "/tmp/app.log*",
      "deliveryStream": "yourdeliverystream"
    }
  ]
}
~   

## Start the agent ##
sudo service aws-kinesis-agent start

## Ensure that the agent starts automatically ##
sudo chkconfig aws-kinesis-agent on




