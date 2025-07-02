# Stage 1: build the documentation site
FROM node:18-alpine AS build

WORKDIR /app

RUN apk add --no-cache \
    autoconf \
    automake \
    libtool \
    make \
    gcc \
    g++ \
    python3 \
    bash

COPY website/package.json website/yarn.lock ./website/
RUN cd website && yarn install --frozen-lockfile
COPY website ./website
RUN cd website && yarn build

FROM nginx:alpine
COPY --from=build /app/website/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
