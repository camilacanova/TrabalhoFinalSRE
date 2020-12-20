from sqsHandler import SqsHandler
from env import Variables
import json

def handler(event, context):
    mensagem = event['pathParameters']['mensagem'];
    
    body = {
        "message": "A mensagem " + str(mensagem) + " foi enviada"
    }
    
    env = Variables()
    sqs = SqsHandler(env.get_sqs_url())

    sqs.send(mensagem)
    
    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response
