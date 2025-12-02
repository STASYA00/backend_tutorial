#!/bin/bash
set -e

# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
else
    echo "Error: .env file not found. Copy .env.example to .env and configure it."
    exit 1
fi

# Validate required variables
if [ -z "$GCP_PROJECT_ID" ] || [ -z "$GCP_REGION" ] || [ -z "$GCF_FUNCTION_NAME" ]; then
    echo "Error: Missing required environment variables in .env file"
    echo "Required: GCP_PROJECT_ID, GCP_REGION, GCF_FUNCTION_NAME"
    exit 1
fi

echo "Deploying to Google Cloud Functions..."
echo "Project: $GCP_PROJECT_ID"
echo "Region: $GCP_REGION"
echo "Function: $GCF_FUNCTION_NAME"

# Set the project
gcloud config set project "$GCP_PROJECT_ID"

# Build auth flag
AUTH_FLAG=""
if [ "$GCF_ALLOW_UNAUTHENTICATED" = "true" ]; then
    AUTH_FLAG="--allow-unauthenticated"
fi

# Deploy
gcloud functions deploy "$GCF_FUNCTION_NAME" \
  --gen2 \
  --runtime python311 \
  --trigger-http \
  --entry-point main \
  --region "$GCP_REGION" \
  --source . \
  $AUTH_FLAG

echo "Deployment complete!"
