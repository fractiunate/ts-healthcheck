# Multi-Stage Image --> don't get dependencies to docker file! https://docs.docker.com/build/building/multi-stage/

FROM alpine
RUN apk add --update nodejs npm
WORKDIR /app
COPY package*.json ./
COPY tsconfig.json ./
# Install from package-lock.json
RUN npm clean-install 
RUN npm i -g typescript


COPY src .

RUN echo $(ls -1 /app)
RUN tsc
RUN echo $(ls -1 /app/dist)

# 3000 as default
ARG SERVER_PORT=3000
ARG SERVER_HOST="0.0.0.0"

# or ENV foo=/bar
ENV PORT ${SERVER_PORT}
ENV HOST ${SERVER_HOST}


EXPOSE ${SERVER_PORT}
CMD ["npm", "start"]

# docker build . --build-arg SERVER_PORT=3000 -t ts-healthcheck:latest --progress=plain