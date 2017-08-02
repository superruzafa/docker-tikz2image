FROM ubuntu:17.10

ARG "BUILD_DATE=unknown"
ARG "VCS_REF=unknown"
ARG "VCS_URL=unknown"
ARG "VERSION=v0.1.0-dev"

LABEL \
  maintainer="Alfonso Ruzafa <superruzafa@gmail.com>" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.name="tikz2image" \
  org.label-schema.description="Converts Tkiz (La)TeX documents into images" \
  org.label-schema.usage="https://github.com/superruzafa/docker-tikz2image/blob/master/README.md" \
  org.label-schema.vcs-url=$VCS_URL \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.version=$VERSION \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.docker.cmd="cat tikz.tex | docker container run --rm -i superruzafa/tikz2image -f png 2>/dev/null > tikz.png"

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

