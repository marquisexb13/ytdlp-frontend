FROM python:buster

RUN apt-get -y update && \
    apt-get install -y ffmpeg bash python3 python3-pip &&\
    apt-get -y update && \
    apt-get clean all && \
    python3 -m pip install --upgrade git+https://github.com/yt-dlp/yt-dlp.git@release && \
    python3 -m pip install apprise

RUN mkdir /downloads

WORKDIR /downloads

# Copy html
ADD static/ /static
WORKDIR /static

EXPOSE  10012
ENTRYPOINT ["python3", "-m", "http.server", "10012"]


