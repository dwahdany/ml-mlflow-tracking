# Mlflow Tracking
Mlflow Tracking Server

Make sure to mount /mlruns and /mlartifacts to persistent storage if desired. 

## Usage
### (Login to registry)
Should you never have used the registry, login first:
```bash
docker login registry.gitlab.cc-asp.fraunhofer.de
```

### Run
```bash
docker compose up -d
```

### Build
When changing the Dockerfile, run the build process again
```bash
./build.sh
```