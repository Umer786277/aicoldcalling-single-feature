FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev build-essential && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
