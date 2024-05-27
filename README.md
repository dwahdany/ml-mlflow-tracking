# Mlflow Tracking
Mlflow Tracking Server

Make sure to mount /mlruns and /mlartifacts to persistent storage if desired. 

## Usage
### (Login to registry)
Should you never have used the registry, login first:
```bash
docker login container-registry.gitlab.cc-asp.fraunhofer.de
```
If you can't access the registry, you must build the image yourself (see below).

### Run
```bash
docker compose up -d
```

### Build
When changing the Dockerfile, run the build process again
```bash
./build.sh
```