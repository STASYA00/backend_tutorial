# Deploy to Google Cloud Functions

## Prerequisites
- [Google Cloud SDK](https://docs.cloud.google.com/sdk/docs/install) installed (`gcloud`)
- [GCP project](./GCP.md) with billing enabled

## Setup

1. **Copy and configure `.env` file:**
   ```bash
   cp .env.example .env
   ```

2. **Edit `.env` with your settings:**
   ```
   GCP_PROJECT_ID=your-project-id
   GCP_REGION=us-central1
   GCF_FUNCTION_NAME=flask-app
   GCF_ALLOW_UNAUTHENTICATED=true
   ```

## Deploy

**Linux/Mac:**
```bash
./deploy-gcf.sh
```

**Windows:**
```cmd
deploy-gcf.bat
```

That's it! The script will deploy your app to Cloud Functions.

## What the script does
- Loads configuration from `.env`
- Sets your GCP project
- Deploys to Cloud Functions Gen 2 with Python 3.11
- Uses `main.py` as entry point
- Outputs the function URL

## Important Notes
- Uses `main.py` as entry point (imports Flask app from `app.py`)
- Supports multiple endpoints in a single deployment
- Cold starts may occur for infrequent requests

## Manual Deployment
If you prefer manual control:
```bash
gcloud functions deploy flask-app \
  --gen2 \
  --runtime python311 \
  --trigger-http \
  --allow-unauthenticated \
  --entry-point main \
  --region us-central1 \
  --source .
```
