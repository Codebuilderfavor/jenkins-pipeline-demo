FROM alpine:3.19

RUN echo "Hello from Docker image built by Jenkins!" > /message.txt

CMD ["cat", "/message.txt"]
