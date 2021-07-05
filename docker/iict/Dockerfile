FROM alpine:3.14 as build
RUN apk add fio
COPY fio-jobs fio-jobs
COPY run-all-jobs.sh run-all-jobs.sh

ENTRYPOINT ["sh", "/run-all-jobs.sh"]