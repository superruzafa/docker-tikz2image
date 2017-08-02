FROM ubuntu:17.10

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      texlive \
      texlive-latex-extra \
      imagemagick \
      ghostscript \
      pdf2svg

RUN mkdir /code
WORKDIR /code
COPY entrypoint.sh /code/

ENTRYPOINT ["./entrypoint.sh"]

