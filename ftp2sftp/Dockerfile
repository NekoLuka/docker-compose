FROM python:3.12.6-alpine3.20
LABEL authors="NekoLuka"

WORKDIR /app

RUN pip install --no-cache-dir ftp2sftp

COPY . .

ENTRYPOINT ["python", "-m", "ftp2sftp"]
