FROM cimg/node:lts-browsers

LABEL org.opencontainers.image.source="https://github.com/gsmlg-ci/svg-autocrop"
WORKDIR /home/circleci/project/app

RUN git clone --depth=1 --single-branch https://github.com/cncf/svg-autocrop.git /home/circleci/project/app \
  && npm install puppeteer@latest \
  && npm install \
  && npm install express morgan

COPY ./server.js /home/circleci/project/app/

ENV PORT=3050

CMD ["node", "server.js"]
