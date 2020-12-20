from snsHandler import SnsHandler
from env import Variables
import json

def handler(event, context):
    
    env = Variables()
    sns = SnsHandler(env.get_sns_arn())
    
    sns.publish(event)
    
    print(event)
