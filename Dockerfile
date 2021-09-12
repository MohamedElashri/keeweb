FROM alpine:latest AS git

RUN apk add --no-cache git
RUN git clone --branch gh-pages --depth 1 https://github.com/keeweb/keeweb
RUN git clone --branch master --depth 1 https://github.com/keeweb/keeweb-plugins
RUN rm -r keeweb/.git
RUN mv keeweb-plugins/docs keeweb/plugins


FROM nginx:alpine
WORKDIR /opt/keeweb
COPY --from=git /keeweb /usr/share/nginx/html
EXPOSE 80
