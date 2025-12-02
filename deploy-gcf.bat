@echo off
setlocal enabledelayedexpansion

REM Load environment variables from .env file
if not exist .env (
    echo Error: .env file not found. Copy .env.example to .env and configure it.
    exit /b 1
)

for /f "usebackq tokens=1,2 delims==" %%a in (.env) do (
    set "line=%%a"
    if not "!line:~0,1!"=="#" (
        set "%%a=%%b"
    )
)

REM Validate required variables
if "%GCP_PROJECT_ID%"=="" (
    echo Error: GCP_PROJECT_ID not set in .env file
    exit /b 1
)
if "%GCP_REGION%"=="" (
    echo Error: GCP_REGION not set in .env file
    exit /b 1
)
if "%GCF_FUNCTION_NAME%"=="" (
    echo Error: GCF_FUNCTION_NAME not set in .env file
    exit /b 1
)

echo Deploying to Google Cloud Functions...
echo Project: %GCP_PROJECT_ID%
echo Region: %GCP_REGION%
echo Function: %GCF_FUNCTION_NAME%

REM Set the project
gcloud config set project %GCP_PROJECT_ID%

REM Build auth flag
set AUTH_FLAG=
if "%GCF_ALLOW_UNAUTHENTICATED%"=="true" (
    set AUTH_FLAG=--allow-unauthenticated
)

REM Deploy
gcloud functions deploy %GCF_FUNCTION_NAME% --gen2 --runtime python311 --trigger-http --entry-point app --region %GCP_REGION% --source . %AUTH_FLAG%

echo Deployment complete!
