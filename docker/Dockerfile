FROM perl:5.38.0

WORKDIR /app

RUN apt-get update \
    && apt-get install -y postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY cpanfile .
RUN cpanm --quiet --notest --installdeps .

COPY . .

VOLUME ["/app"]

CMD ["make", "server"]
