# Stage 1: build the documentation site
FROM node:18-alpine AS build

WORKDIR /app
# Install dependencies and build the static site
COPY website/package.json website/yarn.lock ./website/
RUN cd website && yarn install --frozen-lockfile
COPY website ./website
RUN cd website && yarn build

# Stage 2: serve the static site using nginx
FROM nginx:alpine
COPY --from=build /app/website/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
