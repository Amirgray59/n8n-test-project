FROM debian:trixie-backports 
ENV DEBIAN_FRONTEND=noninteractive
ENV NODE_ENV=production
ENV N8N_USER_FOLDER=/home/node/.n8n


RUN apt-get update && apt-get install -y --no-install-recommands \ 
    ce-certificates \ 
    curl \ 
    tini \ 
    nodejs \
    npm \
    && node --version \
    && npm --version \
    && rm -rf /var/lib/apt/lists/*

RUN npm install --global n8n 
WORKDIR /home/node


EXPOSE 5678

ENTRYPOINT ["tini", "--"]
CMD ["n8n"]

