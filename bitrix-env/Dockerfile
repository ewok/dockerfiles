FROM centos:6.6

# bitrix
ADD http://repos.1c-bitrix.ru/yum/bitrix-env.sh /tmp/
RUN chmod +x /tmp/bitrix-env.sh
RUN sed -i 's/read version_c/version_c=5/gi' /tmp/bitrix-env.sh
RUN /tmp/bitrix-env.sh

# player patch for bitrix
RUN echo "location ^~ /bitrix/components/bitrix/player/mediaplayer/player {add_header Content-Type video/x-flv;}" >> /etc/nginx/bx/conf/bitrix.conf

# update + ssh
RUN yum update -y
RUN yum install -y openssh-server

# ffmpeg
RUN yum groupinstall "Development tools" -y
ADD dag.repo /etc/yum.repos.d/
ADD RPM-GPG-KEY.dag.txt /tmp/
RUN rpm --import /tmp/RPM-GPG-KEY.dag.txt
RUN yum --enablerepo=dag install -y ffmpeg-devel php-devel re2c php-xml ffmpeg

RUN mkdir -p /srv/build/ffmpeg
ADD ffmpeg-php-0.6.0 /srv/build/ffmpeg
WORKDIR /srv/build/ffmpeg
RUN phpize
RUN ./configure
RUN sed -i 's#PIX_FMT_RGBA32#PIX_FMT_RGB32#' ./ffmpeg_frame.c
RUN make && make install
RUN echo -e "extension=ffmpeg.so\n" > /etc/php.d/ffmpeg.ini

#bvat bitrix(default 256M)
WORKDIR /etc/init.d
RUN sed -i 's/memory=`free.*/memory=$\{BVAT_MEM\:\=262144\}/gi' bvat

# default password
ENV SSH_PASS="bitrix"
RUN echo "bitrix:$SSH_PASS" | chpasswd

# zoneinfo
ENV TIMEZONE="Europe/Moscow"
RUN cp -f /usr/share/zoneinfo/$TIMEZONE /etc/localtime
RUN date

# entrypoint
WORKDIR /
ADD run.sh /
RUN chmod +x /run.sh

ENTRYPOINT exec /run.sh

