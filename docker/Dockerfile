FROM perl:5.38.0

WORKDIR /app

COPY cpanfile .
RUN cpanm --quiet --notest --installdeps .

COPY . .

VOLUME ["/app"]

CMD ["perl", "-Ilib", "script/siderdb_server.pl", "--port=5000"]
