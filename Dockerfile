FROM andrewnk/turtlecoin-base

ARG BOOTSTRAP_FILE_LOCATION=https://f000.backblazeb2.com/file/turtle-blockchain/
ENV BOOTSTRAP_FILE_LOCATION=${BOOTSTRAP_FILE_LOCATION}

ARG BOOTSTRAP_FILE=latest.zip
ENV BOOTSTRAP_FILE=${BOOTSTRAP_FILE}

ARG RPC_BIND_IP=127.0.0.1
ENV RPC_BIND_IP=${RPC_BIND_IP}

ARG RPC_BIND_PORT=11898
ENV RPC_BIND_PORT=${RPC_BIND_PORT}

RUN apt-get update && \
    apt-get install -y \
    zip \
    wget

RUN mkdir /home/turtlecoin/.TurtleCoin

WORKDIR /home/turtlecoin/.TurtleCoin

RUN wget ${BOOTSTRAP_FILE_LOCATION}${BOOTSTRAP_FILE}

RUN unzip ${BOOTSTRAP_FILE} && \
    rm -fr ${BOOTSTRAP_FILE} && \
    chown -R turtlecoin:turtlecoin /home/turtlecoin/.TurtleCoin

RUN apt-get remove -y zip wget && \
    apt-get autoremove -y

EXPOSE ${RPC_BIND_PORT}

CMD su - turtlecoin -c "TurtleCoind --rpc-bind-ip=${RPC_BIND_IP} --rpc-bind-port=${RPC_BIND_PORT}"