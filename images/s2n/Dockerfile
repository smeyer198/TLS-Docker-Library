FROM alpine-build as s2n-base1
RUN apk add openssl-dev
RUN git clone --depth=1 https://github.com/awslabs/s2n
WORKDIR s2n
RUN make bin

FROM scratch as s2n-base2
ENV S2N_DONT_MLOCK=1
COPY --from=s2n-base1 /lib/ld-musl-x86_64.so.1 \
  /lib/libcrypto.so.1.0.0 \
  /lib/libz.so.1 \
  /src/s2n/lib/libs2n.so /lib/

FROM s2n-base2 as s2n-server
LABEL "server_type"="s2n"
LABEL "server_version"="latest"
COPY --from=s2n-base1 /src/s2n/bin/s2nd /bin/
ENTRYPOINT ["s2nd"]

FROM s2n-base2 as s2n-client
LABEL "client_type"="s2n"
LABEL "client_version"="latest"
ENV S2N_ENABLE_CLIENT_MODE=1
COPY --from=s2n-base1 /src/s2n/bin/s2nc /bin/
ENTRYPOINT ["s2nc"]