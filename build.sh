#!/bin/bash
set -e

echo "Building frontend..."
node_modules/.bin/vite build

echo "Bundling server..."
node_modules/.bin/esbuild server/index.ts \
  --bundle \
  --platform=node \
  --format=cjs \
  --outfile=dist/index.cjs \
  --define:process.env.NODE_ENV=\"production\" \
  --external:fsevents \
  --external:lightningcss \
  --external:esbuild \
  --external:vite \
  --external:@vitejs/plugin-react \
  --external:@replit/vite-plugin-runtime-error-modal \
  --external:@replit/vite-plugin-cartographer \
  --external:@replit/vite-plugin-dev-banner \
  --external:better-sqlite3 \
  --external:pg-native \
  --external:bufferutil \
  --external:utf-8-validate

echo "Build complete."
