FROM nginx:1.20

ARG GROUP_NAME=hoge
ARG GROUP_ID ${GROUP_ID}
ARG USER_NAME=hoge
ARG USER_ID ${USER_ID}

COPY ./infra/docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./infra/docker/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

RUN groupadd -g $GROUP_ID $GROUP_NAME && \
       useradd -m -s /bin/bash -u $USER_ID -g $GROUP_ID $USER_NAME && \
       chown -R $USER_NAME:$GROUP_NAME /var/cache/nginx && \
       chmod -R g+w /var/cache/nginx && \
       chown -R www-data:www-data /etc/nginx/conf.d

USER $USER_NAME
