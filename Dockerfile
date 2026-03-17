FROM node:20-bullseye-slim

RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Dr-Djibi/Menma-Session.git /menma_session

WORKDIR /menma_session

RUN npm install --production

EXPOSE 3000

CMD ["node", "index.js"]
