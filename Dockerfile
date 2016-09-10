FROM debian:latest
#FROM debian:jessie

MAINTAINER Michel Labbe

# build intial apt binary cache and install iperf3
RUN apt-get update && apt-get install -y iperf3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -r iperf
    
USER iperf
    
# Expose the default iperf3 server port
EXPOSE 5201

# entrypoint allows you to pass your arguments to the container at runtime
# very similar to a binary you would run. For example, in the following
# docker run -it <IMAGE> --help' is like running 'iperf --help'
ENTRYPOINT ["iperf3"]

# iperf -s = run in Server mode
CMD ["-s"]
