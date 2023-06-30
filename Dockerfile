FROM miq/mono:dev

WORKDIR /app

COPY package.json .yarnrc.yml yarn.lock tsconfig.base.json tsconfig.json ./
COPY .yarn/ ./.yarn/

COPY ./apps/client/package.json ./apps/client/package.json

COPY ./app-packages/ui/package.json ./app-packages/ui/package.json

COPY ./apps/backend/requirements.txt ./apps/backend/requirements.txt

RUN yarn && pip3 install -r ./apps/backend/requirements.txt && pip3 install tzdata

COPY . .
