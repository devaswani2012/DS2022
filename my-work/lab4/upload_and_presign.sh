#!/bin/bash

FILE_NAME="realmadrid.png"
BUCKET_NAME="ds2022-vzu3vu"

aws s3 cp "$FILE_NAME" "s3://$BUCKET_NAME/"

if [ $? -eq 0 ]; then
    echo "File uploaded successfully."

    PRESIGNED_URL=$(aws s3 presign s3://ds2022-vzu3vu/realmadrid.png --expires-in 604800)

    echo "Presigned URL (expires in 7 days): $PRESIGNED_URL"
else
    echo "Failed to upload the file."
fi

# https://ds2022-vzu3vu.s3.us-east-1.amazonaws.com/realmadrid.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAX2DZEIRCDTQKYXN7%2F20240930%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240930T153846Z&X-Amz-Expires=30&X-Amz-SignedHeaders=host&X-Amz-Signature=32497c5fd2a3bf46b7e074d4f41c66464e693a52ac11ce6e2324c20657a32549
