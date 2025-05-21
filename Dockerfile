# Docker multistage build to reduce image size
FROM python:3.10 AS build

ARG MLFLOW_VERSION=2.22.0
ARG MLFLOW_GO_VERSION=0.2.1
ARG MLFLOW_BACKEND=python

RUN python -m venv /opt/venv
# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies based on backend
RUN if [ "$MLFLOW_BACKEND" = "go" ]; then \
      pip install mlflow-go-backend==${MLFLOW_GO_VERSION} psycopg2 mysqlclient boto3; \
    else \
      pip install mlflow==${MLFLOW_VERSION} psycopg2 mysqlclient boto3; \
    fi

FROM python:3.10-slim
COPY --from=build /opt/venv /opt/venv
COPY --from=build /usr/lib /usr/lib
# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"
EXPOSE 5000/tcp

ARG MLFLOW_BACKEND=python

# Set entrypoint based on backend
ENTRYPOINT ["/bin/sh", "-c", "if [ \"$MLFLOW_BACKEND\" = \"go\" ]; then mlflow-go server --host 0.0.0.0; else mlflow server --host 0.0.0.0; fi"]
CMD [ "--backend-store-uri", "sqlite:////mlruns/mlruns.db", \
    "--default-artifact-root", "/mlartifacts"]