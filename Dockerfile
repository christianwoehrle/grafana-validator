# Build Monzo
FROM golang:1.13 AS build-env-monzo
RUN git clone https://github.com/monzo/envoy-preflight.git /src
RUN pwd
RUN ls /src -la
RUN cd /src && go get -v -d && go build -ldflags '-w -s' -a -installsuffix cgo -o envoy-preflight 
RUN ls /src -la



# build stage
FROM golang:1.13 AS build-env
ADD . /src
#disable crosscompiling
ENV CGO_ENABLED=0

#compile linux only
ENV GOOS=linux
RUN cd /src && go get -v -d && go build -ldflags '-w -s' -a -installsuffix cgo -o goapp

# final stage
FROM scratch
COPY --from=build-env /src/goapp /app/
COPY --from=build-env-monzo /src/envoy-preflight /app/
COPY check.yaml /app/
WORKDIR /app
