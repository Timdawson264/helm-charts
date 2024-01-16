FROM python:3.10.12-alpine3.18

RUN apk add --no-cache duplicity tini bash

#RUN apk -U add gettext librsync-dev gcc musl-dev gnupg
#RUN pip3 install setuptools_scm
#RUN pip3 install duplicity

COPY run.sh /

ENTRYPOINT ["/sbin/tini", "--"]
CMD bash /run.sh