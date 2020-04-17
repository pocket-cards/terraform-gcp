# Digital Human Platform

## PreInstallation

- setx GOOGLE_APPLICATION_CREDENTIALS C:\Project\Credentials\PocketCards\pocket-cards-dev-050d70a87d1a.json
- setx GOOGLE_CLOUD_PROJECT pocket-cards-dev
- [Node.js](https://nodejs.org/dist/latest-v8.x/node-v8.16.1-x64.msi)
- [Visual Studio Code](https://go.microsoft.com/fwlink/?Linkid=852157)
- Visual Studio Code Extendsions
  - Bracket Pair Colorizer
  - Output Colorizer
  - Peacock
  - Prettier
  - REST Client
  - Terraform
  - TSLint
  - vscode-icons
  - YAML
- [Git](https://github.com/git-for-windows/git/releases/download/v2.23.0.windows.1/Git-2.23.0-64-bit.exe)
- [TortoiseGit](https://download.tortoisegit.org/tgit/2.8.0.0/TortoiseGit-2.8.0.0-64bit.msi)
- [TortoiseGit Japanese Language Pack](https://download.tortoisegit.org/tgit/2.8.0.0/TortoiseGit-LanguagePack-2.8.0.0-64bit-ja.msi)
- [gcloud without python](https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-196.0.0-windows-x86_64.zip?hl=JA)
  - 解凍フォルダにて、`install.bat`をクリックする
- [gcloud with python](https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-196.0.0-windows-x86_64-bundled-python.zip?hl=JA)
  - 解凍フォルダにて、`install.bat`をクリックする

## Project Create

Create project from GCP console.

- Digital Assistant - Manage
- Digital Assistant - Dev
- Digital Assistant - Staging
- Digital Assistant - Prod

## GCloud Config Setup - Cloud Shell

```sh
gcloud config set compute/region asia-northeast-1
```

## Setup Manage Project - Cloud Shell

### Create Terraform User

```sh
export USER_ID=terraform
export PROJECT_ID=`gcloud config list --format 'value(core.project)' 2>/dev/null`
export LOCAL_JSON_PATH=./admin.json
export TERRAFORM_STATE_BUCKET=digital-assistant
export SERVICE_ACCOUNT=${USER_ID}@${PROJECT_ID}.iam.gserviceaccount.com
export BUCKET_NAME=gs://${TERRAFORM_STATE_BUCKET}

gcloud iam service-accounts create ${USER_ID} --display-name "Terraform Admin"
gcloud iam service-accounts keys create ${LOCAL_JSON_PATH} --iam-account ${SERVICE_ACCOUNT}
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member serviceAccount:${SERVICE_ACCOUNT} --role roles/editor

```

### Create Terraform State Bucket

```sh
gsutil mb -b on -l ASIA-NORTHEAST1 ${BUCKET_NAME}
gsutil iam ch serviceAccount:${SERVICE_ACCOUNT}:objectAdmin ${BUCKET_NAME}

```

## Setup Others Project - Console

- Add service account to projects what created.
- Create App Engine App

### Enable GCP Services - Cloud Shell

```sh
gcloud services enable cloudscheduler.googleapis.com
gcloud services enable cloudfunctions.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable run.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable secretmanager.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
```

### Enable App Engine - Console

Create application in asia-northeast-1

### CloudBuild Connect Repository - Console

## GCloud Login - Command Prompt

```sh
gcloud auth login
```

## Set PROJECT_ID and GOOGLE_APPLICATION_CREDENTIALS - Command Prompt

```sh
setx GOOGLE_ID ${PROJECT_ID}
setx GOOGLE_PROJECT ${PROJECT_ID}
setx GOOGLE_APPLICATION_CREDENTIALS ${LOCAL_JSON_PATH}
```

## 暗号化方法

変数を適切な値を変更してから、GCloud Shell で実行する

```sh
export TARGET_VALUE=AIzaSyCAwMrnuaedxYl8enAmD9IwNZ1DglQt60c
export PROJECT_ID=digital-assistant-dev
export KEYRING_LOCATION=asia-northeast1
export KEYRING_NAME=keyring-envs
export KEY_NAME=api-key

echo -n ${TARGET_VALUE} | \
gcloud kms encrypt \
--project ${PROJECT_ID} \
--plaintext-file=- \
--ciphertext-file=- \
--location=${KEYRING_LOCATION} \
--keyring=${KEYRING_NAME} \
--key=${KEY_NAME} \
| base64 -w 0 > key.txt | echo $'\n' >> key.txt
```

## 複合化方法

変数を適切な値を変更してから、GCloud Shell で実行する

```sh
export TARGET_VALUE=CiQA+lBo1CitnyMsruff02M8vtkYj8hNeqvlrWUb6+tv6RIaFXYSMwAWnQXqyTD+IF10De7/w8vUcvHQKnAxF8yTeoJr/OB25ps4DIi2Ou9BF6nh4a7kL9cw+A==
export PROJECT_ID=virtual-assistant-b7e02f
export KEYRING_LOCATION=asia-northeast1
export KEYRING_NAME=keyring-envs
export KEY_NAME=api-key

echo -n ${TARGET_VALUE} \
| base64 -d \
| gcloud kms decrypt \
--project ${PROJECT_ID} \
--plaintext-file=- \
--ciphertext-file=- \
--location=${KEYRING_LOCATION} \
--keyring=${KEYRING_NAME} \
--key=${KEY_NAME}
```
