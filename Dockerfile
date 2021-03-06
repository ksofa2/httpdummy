FROM python:3.7-slim

ENV PYTHONUNBUFFERED=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

ENV HTTPDUMMY_ADDRESS=0.0.0.0
ENV HTTPDUMMY_PORT=5000
ENV HTTPDUMMY_HEADERS=yes
ENV HTTPDUMMY_BODY=yes
ENV HTTPDUMMY_RELOADER_TYPE=stat

EXPOSE 5000

COPY . /usr/src/app

RUN pip install /usr/src/app

CMD ["httpdummy"]
