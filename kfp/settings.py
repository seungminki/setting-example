import os
from dotenv import load_dotenv

load_dotenv()

AWS_REGION_NAME = os.environ.get("AWS_REGION_NAME", "")
AWS_ACCESS_KEY_ID = os.environ.get("AWS_ACCESS_KEY_ID", "")
AWS_SECRET_ACCESS_KEY = os.environ.get("AWS_SECRET_ACCESS_KEY", "")
