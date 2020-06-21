FROM node:lts AS npm_build

WORKDIR /app

COPY ./package.json /app/package.json
RUN yarn install
COPY ./src /app/src
COPY ./static /app/static
COPY ./docs /app/docs
COPY docusaurus.config.js sidebars.json babel.config.js /app/

RUN ls -lah /app/

RUN yarn run build

RUN ls -lah /app/build/

FROM nginx:alpine
COPY --from=npm_build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
