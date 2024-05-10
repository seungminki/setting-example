import boto3
import logging

import settings


class Boto3Client:
    aws_access_key_id = settings.AWS_ACCESS_KEY_ID
    aws_secret_access_key = settings.AWS_SECRET_ACCESS_KEY
    region_name = settings.AWS_REGION_NAME
    database = settings.AWS_ATHENA_DATABASE

    service_name = None

    @classmethod
    def get_client(cls, type: str):
        return type


class AthenaClient:

    @staticmethod
    def _get_s3_object(file_name):
        return file_name
