FROM alpine:3.19.2

RUN apk update && apk upgrade --no-cache && \ 
	apk add --no-cache nginx

RUN mkdir -p /var/run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
