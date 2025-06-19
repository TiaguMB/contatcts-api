FROM node:22-slim

WORKDIR /usr/src/app

COPY package*.json ./

RUN corepack enable && corepack prepare pnpm@10.12.1 --activate
COPY pnpm-lock.yaml ./
RUN pnpm install

COPY . .

EXPOSE 3000

CMD ["pnpm", "run", "start"]
