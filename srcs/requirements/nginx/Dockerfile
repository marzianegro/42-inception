FROM alpine:3.19.2

RUN apk add --no-cache nginx

# keeping them in separate layers for readability and speeding up rebuilds
RUN mkdir -p /var/run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
