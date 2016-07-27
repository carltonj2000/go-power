FROM golang

WORKDIR /usr/share/nginx/html
ADD buildNServe .
ENTRYPOINT exec /usr/share/nginx/html/buildNServe

EXPOSE 8111
