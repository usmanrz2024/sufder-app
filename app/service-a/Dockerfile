FROM node:18 AS builder

WORKDIR /app
COPY package*.json ./

RUN npm install
COPY ./src ./src
COPY tsconfig.json ./
RUN npm run build

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
CMD ["node", "dist/index.js"]

