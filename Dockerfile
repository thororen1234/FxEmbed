FROM node:lts
WORKDIR /app

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

COPY package*.json pnpm-*.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .
RUN node esbuild.config.mjs --no-sentry-upload

CMD ["node", "dist/index.js"]