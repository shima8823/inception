FROM debian:buster

RUN apt-get update && apt-get install -y curl nginx

# EXPOSE 80
# ADD ./html /usr/share/nginx/html

# "daemon off;"とするとフォアグラウンドで起動する
CMD ["nginx", "-g", "daemon off;"]


# CMD tail -f /dev/null