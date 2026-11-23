#!/usr/bin/env bash
set -e

npm install -g corepack@latest
corepack enable
npm install -g pnpm

cd mcp

corepack enable || true

if [ -f pnpm-lock.yaml ]; then
  pnpm install --frozen-lockfile
  pnpm start
elif [ -f package-lock.json ]; then
  npm ci
  npm start
else
  npm install
  npm start
fi
