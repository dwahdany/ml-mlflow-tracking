# Mlflow Tracking

[![Build MLflow (Python)](https://github.com/dwahdany/ml-mlflow-tracking/actions/workflows/docker-build.yml/badge.svg?branch=main&label=mlflow-python)](https://github.com/dwahdany/ml-mlflow-tracking/actions/workflows/docker-build.yml)
[![Build MLflow-Go](https://github.com/dwahdany/ml-mlflow-tracking/actions/workflows/docker-build.yml/badge.svg?branch=main&label=mlflow-go)](https://github.com/dwahdany/ml-mlflow-tracking/actions/workflows/docker-build.yml)

Mlflow Tracking Server

Make sure to mount /mlruns and /mlartifacts to persistent storage if desired. 
All data will be lost if the container is removed, otherwise.

## Usage
**Note:** Persistent storage volume binds are in `compose.override.yaml`. Edit that file to customize storage for your environment.

### Run
```bash
docker compose up -d
```
Note that the go-backend does not support file-based databases.

### Build
When changing the Dockerfile, run the build process again
```bash
./build.sh
```