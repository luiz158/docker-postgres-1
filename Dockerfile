# PostgreSQL 9.2

FROM fgrehm/ventriloquist-base

RUN wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update
RUN apt-get install -y postgresql-9.2

ADD config /
RUN /bin/prepare-postgres vagrant vagrant

EXPOSE  5432
CMD     ["/bin/start-postgres"]
