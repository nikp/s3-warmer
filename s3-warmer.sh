#!/bin/bash

# Check for AWS CLI installation
if ! command -v aws &> /dev/null; then
    echo "AWS CLI not installed."
    exit 1
fi

# AWS Region
REGION="us-east-1"

# Prefix for bucket names
BUCKET_PREFIX="seriously-dont-run-this-script-what-do-you-think-you-are-doing"

NUM_BUCKETS=1000000

echo "S3 Account Warming Commencing!"

echo "Requesting limit increase..."

aws service-quotas request-service-quota-increase \
    --service-code "s3" \
    --quota-code "L-DC2B2D3D" \
    --desired-value $NUM_BUCKETS

echo "Creating buckets..."

for ((i=1; i<=NUM_BUCKETS; i++)); do
    BUCKET_NAME="${BUCKET_PREFIX}-${i}"
    echo "Creating Bucket $i of $NUM_BUCKETS: $BUCKET_NAME"
    
    aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION"
    
    if [ $? -ne 0 ]; then
        echo "Failed to create bucket $BUCKET_NAME. Someone should open a pull request to add retry logic."
        break
    fi
done

echo "S3 Account Warm and ready for action!"