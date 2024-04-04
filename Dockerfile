FROM node:20-alpine AS builder
RUN corepack enable

WORKDIR /app

COPY ./package.json ./pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . .

RUN pnpm build

FROM alpine:latest
EXPOSE 80

RUN apk add --update nginx && rm -rf /var/cache/apk/*

COPY --from=builder /app/dist /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]