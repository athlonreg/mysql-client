FROM python:3-alpine

## uncomment for chinese
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --update --no-cache mariadb-connector-c-dev mysql-client\
	&& apk add --no-cache --virtual .build-deps \
		mariadb-dev \
		gcc \
		musl-dev
RUN pip install mysqlclient # for chinese use pip install mysqlclient -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN apk del .build-deps
