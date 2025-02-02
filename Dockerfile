FROM python:3.8-slim-bullseye

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
    build-essential

WORKDIR /app
COPY requirements.txt /app
RUN pip install --no-cache-dir --requirement /app/requirements.txt
COPY . /app

EXPOSE 7755

ENTRYPOINT ["/app/run.sh"]
