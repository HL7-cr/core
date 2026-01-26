# docker run --rm -it -v "$(pwd)/ig/terminology.git:/ig" ig-terminology:v1 bash

# Ubuntu 24.04 (Noble)
FROM ubuntu:24.04

LABEL maintainer="Alejandro Benavides <alejandro@meddyg.com>"

# --------- Base / Locale / TZ ---------
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=America/Costa_Rica \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

RUN apt-get update && \
        apt-get install -y --no-install-recommends \
            tzdata ca-certificates curl git gnupg2 unzip jq \
            build-essential pkg-config locales \
            openjdk-21-jre-headless \
            ruby-full ruby-dev zlib1g-dev \
            openssh-client && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure -f noninteractive tzdata && \
    sed -i 's/^# *en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen && locale-gen && \
    rm -rf /var/lib/apt/lists/*

# Java LTS coherente
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# --------- Node.js 20 LTS + SUSHI global ---------
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs && \
    npm config set fund false && npm config set audit false && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@latest && \
    npm i -g fsh-sushi fhir

# Jekyll/Bundler (si tu IG usa Jekyll)
RUN gem install bundler jekyll --no-document

# --------- Usuario con UID/GID del host (robusto) ---------
ARG UID=1000
ARG GID=1000

# Crea grupo/usuario si NO existen; si ya existen esos IDs, los reutiliza
RUN set -eux; \
    if ! getent group "${GID}" >/dev/null; then groupadd -g "${GID}" app; fi; \
    if ! getent passwd "${UID}" >/dev/null; then useradd -m -u "${UID}" -g "${GID}" -s /bin/bash app; fi

# No fijamos HOME aquí para no romper cuando ejecutes con otro usuario/ID

# Directorio de trabajo (montarás tu IG aquí)
WORKDIR /ig

# Evitar warnings de git al bind-mount
RUN git config --system --add safe.directory /ig

# Usa SIEMPRE ids numéricos (funciona aunque el nombre no exista)
USER ${UID}:${GID}

CMD ["bash"]
