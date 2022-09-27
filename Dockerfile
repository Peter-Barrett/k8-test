FROM node:14.19.3 AS builder

RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm

COPY . /application
WORKDIR /application
RUN pnpm install
RUN pnpm run build

# #for a smaller image
FROM node:14.19.3-alpine3.15
RUN mkdir /application
WORKDIR /application
COPY --from=builder /application ./

EXPOSE 3000
CMD [ "node", "dist/main.js" ]
