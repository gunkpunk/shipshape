FROM haskell:9.6

RUN apt-get update && \
    apt-get install -y --no-install-recommends graphviz make && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/cpsa
RUN git clone --depth 1 https://github.com/mitre/cpsa.git . && \
    cabal update && \
    cabal install --overwrite-policy=always --ghc-options="-j1 +RTS -M2g -RTS"

ENV PATH=/root/.cabal/bin:$PATH
WORKDIR /work
CMD ["cpsa4", "-h"]
