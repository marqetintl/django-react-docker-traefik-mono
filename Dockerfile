
# pull the official docker image
FROM node:19-alpine3.16

# set work directory
WORKDIR /app

# COPY tsconfig.eslint.json ./
COPY package.json .
COPY .yarnrc.yml .
COPY yarn.lock .
COPY .yarn/ ./.yarn/

ENV CLIENT=/app/apps/client

# install dependencies
COPY ./apps/client/package.json ${CLIENT}/package.json
COPY ./apps/client/vite.config.ts ${CLIENT}/vite.config.ts
COPY ./apps/client ${CLIENT}

RUN yarn 

RUN apk add --no-cache python3 py3-pip python3-dev build-base libffi-dev openssl-dev

RUN pip3 install --upgrade pip

# prevent Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1

# prevent Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED 1

# install dependencies
COPY ./apps/server/requirements.txt .

RUN pip3 install -r requirements.txt
RUN pip3 install tzdata

# copy project
COPY ./apps/server ./apps/server
