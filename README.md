# Mlflow Tracking
Mlflow Tracking Server

Make sure to mount /mlruns and /mlartifacts to persistent storage if desired. 
All data will be lost if the container is removed, otherwise.

## Usage
### Run
```bash
docker compose up -d
```

### Build
When changing the Dockerfile, run the build process again
```bash
./build.sh
```