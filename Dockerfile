FROM node:12.18.1-alpine

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --only=production
COPY ./src ./src

CMD npm start

# Install AZ cli onto the image.
RUN apk add --no-cache curl tar openssl sudo bash jq python3
RUN apk --update --no-cache add postgresql-client postgresql
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev make python3-dev
RUN pip3 install virtualenv &&\
    python3 -m virtualenv /azure-cli
ARG AZURE_CLI_VERSION=2.25.0
RUN /azure-cli/bin/python -m pip --no-cache-dir install azure-cli==${AZURE_CLI_VERSION}
RUN /azure-cli/bin/python -m azure.cli -h
RUN /azure-cli/bin/python -m azure.cli login
