FROM alpine:3.4

RUN apk --update add ca-certificates
RUN mkdir /usr/prometheus-operated-chart
COPY . /usr/prometheus-operated-chart
RUN /usr/prometheus-operated-chart/helm_installer.sh
WORKDIR /usr/prometheus-operated-chart

RUN helm lint
RUN helm package --save=false .
CMD helm serve --address 0.0.0.0:8879 --repo-path .