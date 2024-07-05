FROM alpine:3.19.2

RUN apk add --no-cache nginx && \
	mkdir -p /var/run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
