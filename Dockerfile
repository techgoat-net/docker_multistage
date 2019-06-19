FROM golang as build_image
WORKDIR /tmp
RUN git clone https://github.com/restic/restic.git && cd restic && go run build.go

FROM alpine
COPY --from=build_image /tmp/restic/restic /bin
ENTRYPOINT ["restic"]
CMD ["version"]
