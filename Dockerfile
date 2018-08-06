FROM marthoc/deconz

# Runtime environment variables
ENV DECONZ_VNC_SCREEN="1280x720x16" \
    DECONZ_VNC_PASSWORD="vnc" \
    DECONZ_VNC_PORT=5920

# Install vnc
RUN apt-get update && \
    apt-get install -y \
        x11vnc \
        xvfb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add tini, start.sh
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-armhf /tini
COPY root /
RUN chmod +x /tini && \
    chmod +x /start.sh

ENTRYPOINT [ "/tini", "--", "/start.sh" ]
