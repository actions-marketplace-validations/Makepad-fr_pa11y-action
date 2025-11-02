FROM ghcr.io/puppeteer/puppeteer:16.1.0

USER root 

RUN npm install -g pa11y

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome
USER pptruser
ENTRYPOINT [ "pa11y" ]
