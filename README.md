# Parcel M1 Docker Bug

Running `npm run build` on an M1 Mac works locally, but fails in Docker.

The following repo demonstrates the setup necessary to trigger the bug, based on https://parceljs.org/getting-started/webapp/:

```sh
❯ docker build . -t parcel-bug
[+] Building 21.3s (9/9) FINISHED
 => [internal] load build definition from Dockerfile                       0.0s
 => => transferring dockerfile: 116B                                       0.0s
 => [internal] load .dockerignore                                          0.0s
 => => transferring context: 34B                                           0.0s
 => [internal] load metadata for docker.io/library/node:16.18.1-bullseye   0.3s
 => [1/5] FROM docker.io/library/node:16.18.1-bullseye@sha256:7fb41fa8410  0.0s
 => [internal] load build context                                          0.0s
 => => transferring context: 329B                                          0.0s
 => CACHED [2/5] WORKDIR /app                                              0.0s
 => [3/5] COPY . .                                                         0.0s
 => [4/5] RUN npm i                                                       19.6s
 => ERROR [5/5] RUN npm run build                                          1.2s
------
 > [5/5] RUN npm run build:
#0 0.389
#0 0.389 > parcel-bug@1.0.0 build
#0 0.389 > parcel build index.html
#0 0.389
#0 0.819 Building...
#0 1.102 🚨 Build failed.
#0 1.104
#0 1.105 @parcel/transformer-css: Could not resolve module
#0 1.105 "/app/node_modules/lightningcss/lightningcss.linux-arm64-gnu.node" from
#0 1.105 "/app/node_modules/lightningcss/node/index.js"
#0 1.106
#0 1.106   Error: Could not resolve module
#0 1.106   "/app/node_modules/lightningcss/lightningcss.linux-arm64-gnu.node" from
#0 1.106   "/app/node_modules/lightningcss/node/index.js"
#0 1.106       at $0578d0f6e116167e$export$fb2a0b866a8162dc.resolve
#0 1.106   (/app/node_modules/@parcel/package-manager/lib/index.js:4991:21)
#0 1.106       at NodePackageManager.resolveSync
#0 1.106   (/app/node_modules/@parcel/package-manager/lib/index.js:3510:42)
#0 1.106       at NodePackageManager.requireSync
#0 1.106   (/app/node_modules/@parcel/package-manager/lib/index.js:3352:34)
#0 1.106       at Module.m.require
#0 1.106   (/app/node_modules/@parcel/package-manager/lib/index.js:3366:25)
#0 1.106       at require (node:internal/modules/cjs/helpers:103:18)
#0 1.106       at Object.<anonymous> (/app/node_modules/lightningcss/node/index.js:21:22)
#0 1.106       at Module._compile (node:internal/modules/cjs/loader:1155:14)
#0 1.106       at Object.Module._extensions..js
#0 1.106   (node:internal/modules/cjs/loader:1209:10)
#0 1.106       at Module.load (node:internal/modules/cjs/loader:1033:32)
#0 1.106       at NodePackageManager.load
#0 1.106   (/app/node_modules/@parcel/package-manager/lib/index.js:3375:15)
#0 1.108
------
ERROR: failed to solve: executor failed running [/bin/sh -c npm run build]: exit code: 1
```
