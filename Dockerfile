
# pull the official docker image
FROM node:19-alpine3.16

# install python and pip and clean up unnecessary packages
RUN apk add --no-cache python3 py3-pip python3-dev build-base libffi-dev openssl-dev && \
    pip3 install --upgrade pip && \
    apk del build-base libffi-dev openssl-dev

# prevent Python from writing pyc files to disc and buffering stdout and stderr
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR /app

COPY package.json .yarnrc.yml yarn.lock tsconfig.base.json tsconfig.json ./
COPY .yarn/ ./.yarn/

COPY ./apps/client/package.json ./apps/client/package.json
COPY ./packages/ui/package.json ./packages/ui/package.json

COPY ./apps/server/requirements.txt ./apps/server/requirements.txt

RUN yarn && pip3 install -r ./apps/server/requirements.txt && pip3 install tzdata

COPY ./packages/ui ./packages/ui

COPY ./apps/client ./apps/client

COPY ./apps/server ./apps/server
