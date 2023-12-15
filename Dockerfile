FROM python:3.9-alpine3.16

COPY requirements.txt /temp/requirements.txt

RUN apk add postgresql-client build-base postgresql-dev

RUN pip install -r /temp/requirements.txt

RUN wget -O /usr/local/bin/wait-for-it.sh \
    https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x /usr/local/bin/wait-for-it.sh

COPY service /service
WORKDIR /service
EXPOSE 8000

RUN adduser --disabled-password service-user

USER service-user

CMD ["sh", "-c", "wait-for-it.sh $DB_HOST:5432 -- python manage.py runserver 0.0.0.0:8000"]
