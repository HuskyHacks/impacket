FROM python:3.8-alpine as compile
WORKDIR /opt
RUN apk add --no-cache git gcc musl-dev python3-dev libffi-dev openssl-dev cargo
ENV PATH="/opt/venv/bin:$PATH"
WORKDIR /opt
RUN git clone --depth 1 https://github.com/HuskyHacks/impacket.git
WORKDIR /opt/impacket
RUN pip3 install setuptools-rust
RUN python3 setup.py install

ENTRYPOINT ["/bin/sh"]