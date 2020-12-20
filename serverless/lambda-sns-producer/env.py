import os

class Variables:
    def __init__(self):
        self.__sns_arn = os.environ.get('sns_arn', '')

    def get_sns_arn(self):
        return self.__sns_arn