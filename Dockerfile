# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from golang v1.11 base image
FROM golang:1.11

# Add Maintainer Info
LABEL maintainer="Jasper Mennink <mennink@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/github.com/mennink/go-test

# Copy everything from the current directory to the PWD(Present Working Directory) inside the container
COPY . .

# Download dependencies
RUN go get -d -v ./...

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /go/bin/wiki .

# Install the package
RUN go install -v ./...
RUN mv /go/bin/wiki /wiki

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["./wiki"]
