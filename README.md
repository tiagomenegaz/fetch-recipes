# Fetch Recipes

This README includes everything necessary to get the application up and running.
Fetch Recipes is totally supported with Docker so make sure you have it propertly configured and installed. At the moment, the whole project is configured for development purposes.

### Getting Started

Make sure you've copied and renamed your `.env.sample` to `.env`.

In the first time running this project you should run:

```
docker-compose pull &&
docker-compose run --rm app bundle install &&
docker-compose run --rm worker bundle install
```

Now, you can run the following command to run all project's dependencies:
```
docker-compose pull &&
docker-compose run --rm app rake db:create &&
docker-compose run --rm app rake db:migrate &&
docker-compose up
```

There are some useful commands that you might need to use:
```
docker-compose run --rm app rails c
docker-compose run --rm app rake db:drop db:create db:migrate
```
