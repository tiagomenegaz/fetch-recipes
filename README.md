# Fetch Recipes

This README includes everything necessary to get the application up and running.
Fetch Recipes is totally supported with Docker so make sure you have it propertly configured and installed. At the moment, the whole project is configured for development purposes.

### Getting Started

Make sure you've copied and renamed your `.env.sample` to `.env`.

The first time running this project you should run:

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
docker-compose run --rm worker rake populate:space &&
docker-compose up
```

There are some useful commands that you might need to use:
```
docker-compose run --rm app rails c
docker-compose run --rm app rake db:drop db:create db:migrate
```

### Introduction

![Alt Text](https://raw.githubusercontent.com/tmmgarcia/fetch-recipes/master/img/intro.gif)

This project has two main pages

#### Recipes Index List view / Root

Display a preview of all recipes, including:
- Title
- Image

#### Recipes Details View

Display all the data for a recipe:
- Title
- Image
- List of Tags
- Description
- Chef Name

### How the project is structured?

This project has two main structures as you can see in the Docker-Compose file. The first called app, and it contains everything that a user can see when accessing the application itself. The second is called worker and contains what is necessary to collect data from the source (Contentful). This approach allows worker tasks to run parallel with any user accessing the system.

### Highlights

* Fully Dockerized
* Separation between User application and background jobs
* Service Pattern usage
* Clean UI
* Clean code

### Future Improvements

Software is a continous process and some improvements might be done in the future

* Add deployment configuration
* Add pagination at main page
* Improve application layout
