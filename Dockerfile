FROM webdevops/php-apache:7.2-alpine

COPY . /app

ENV WEB_DOCUMENT_ROOT /app