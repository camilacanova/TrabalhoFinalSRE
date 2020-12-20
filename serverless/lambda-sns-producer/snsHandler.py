import boto3

class SnsHandler:
    def __init__(self,topicArn):
        self.__sns = boto3.client('sns')
        self.__topicArn = topicArn

    def publish(self,msg):
        response = self.__sns.publish(
            TopicArn=self.__topicArn,
            Message=msg
        )
        print(response)
    