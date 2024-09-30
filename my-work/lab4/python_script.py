#!/Library/Frameworks/Python.framework/Versions/3.12/bin/python3

import requests
import boto3
import os

file_url = 'https://images.app.goo.gl/QFH4zAyBfzds1jWQ7'
file_name = 'downloaded_file.gif'
bucket_name = 'ds2022-vzu3vu'
expires_in = 604800  # 7 days in seconds

response = requests.get(file_url)
if response.status_code == 200:
    with open(file_name, 'wb') as f:
        f.write(response.content)
    print(f'Successfully downloaded {file_name}')
else:
    print('Failed to download the file')
    exit(1)

s3 = boto3.client('s3', region_name='us-east-1')
s3.upload_file(file_name, bucket_name, file_name)

presigned_url = s3.generate_presigned_url(
    'get_object',
    Params={'Bucket': bucket_name, 'Key': file_name},
    ExpiresIn=expires_in
)

print(f'Presigned URL (expires in 7 days): {presigned_url}')

os.remove(file_name)

# https://ds2022-vzu3vu.s3.amazonaws.com/downloaded_file.gif?AWSAccessKeyId=AKIAX2DZEIRCDTQKYXN7&Signature=lUQ%2Fn0UIQlT2cd1puFkBcUoNlOQ%3D&Expires=1728334494
