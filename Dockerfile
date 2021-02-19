FROM python:3.9-slim

ENV PYTHONUNBUFFERED=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

ENV HTTPDUMMY_ADDRESS=0.0.0.0
ENV HTTPDUMMY_PORT=5000
ENV HTTPDUMMY_PRINT_HEADERS=on
ENV HTTPDUMMY_PRINT_BODY=on
ENV HTTPDUMMY_SERVER_RELOADER=on
ENV HTTPDUMMY_SERVER_RELOADER_TYPE=stat
ENV HTTPDUMMY_SERVER_DEBUGGER=off

EXPOSE 5000

COPY . /usr/src/app

RUN pip install /usr/src/app

CMD [ "sh", "-c", "httpdummy\
 --address=${HTTPDUMMY_ADDRESS}\
 --port=${HTTPDUMMY_PORT}\
 --print-headers=${HTTPDUMMY_PRINT_HEADERS}\
 --print-body=${HTTPDUMMY_PRINT_BODY}\
 --server-reloader=${HTTPDUMMY_SERVER_RELOADER}\
 --server-reloader-type=${HTTPDUMMY_SERVER_RELOADER_TYPE}\
 --server-debugger=${HTTPDUMMY_SERVER_DEBUGGER}\
 ${HTTPDUMMY_CONFIG_FILE}"]
