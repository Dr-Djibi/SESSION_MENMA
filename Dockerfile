FROM node:20-bookworm-slim

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/Dr-Djibi/Menma-Session/archive/refs/heads/main.zip -O update.zip \
    && unzip -q update.zip -d /tmp_session \
    && mv /tmp_session/Menma-Session-main /menma_session \
    && rm -rf update.zip /tmp_session

WORKDIR /menma_session

RUN npm install
RUN npm run build

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

CMD ["npm", "start"]

