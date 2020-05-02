## Project setup

### System dependencies

* postgresql 12.2
* postgis 3.0.1

### Configuration
* Rename and fill with real data .env.tt to .env
* GOOGLE_MAP_API_KEY is required

## Getting Started

1\. Stop postgres services to have free ports and run

2\. Run docker
```ShellSession
$ docker-compose up
```
There are containers for postgresql, rails server

Of course, if you prefer system programs - you can use them.
You can use only some services with docker. Just run
```ShellSession
$ docker-compose up service1 service2
```
i.e.
```ShellSession
$ docker-compose up postgres
```
3\. Create db and run migrations in web container
```ShellSession
$ docker-compose run web rake db:create db:migrate
```
