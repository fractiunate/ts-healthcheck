npm install --save-dev ts-node nodemon
npx tsc --init

## Docker

Build image with `docker build . --build-arg SERVER_PORT=3000 -t ts-healthcheck:latest --progress=plain`

## Options to watch files

https://stackoverflow.com/questions/37979489/how-to-watch-and-reload-ts-node-when-typescript-files-change

## Prettier ESLint

Prettier ESLint Extension: https://marketplace.visualstudio.com/items?itemName=rvest.vs-code-prettier-eslint

How to: https://www.alphr.com/auto-format-vs-code/

```
 npm i -D prettier@^2.5.1 eslint@^8.7.0

 # For typescript projects
 npm i -D @typescript-eslint/parser@^5.0.1 typescript@^4.4.4
```

## Prettier JSON

https://marketplace.visualstudio.com/items?itemName=SimonSiefke.prettier-vscode
