```git clone git@github.com:mbgoodguy/service_app.git```

```сd service_app```

```docker-compose build```

```docker-compose up```

Interactive entry for migrations create/apply:
```docker-compose run --rm web-app sh```
```/service $ python manage.py makemigrations```
```/service $ python manage.py migrate```

Load fixtures:
```/service $ python manage.py loaddata users_fixtures.json```
```/service $ python manage.py loaddata clients.json```
```/service $ python manage.py loaddata plans.json```
```/service $ python manage.py loaddata services.json```
