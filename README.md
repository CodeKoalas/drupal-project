# Composer template for Drupal projects
Code Koalas Edition

## How to use
1. `composer create-project codekoalas/koality-drupal:8.x-dev some-dir --stability dev --no-interaction`
2. Run `docker-compose up -d`
   - This Implies you have docker set up in a similar way to me. Will need to put that up somewhere later.
3. Install Dependencies inside the Docker container (you may need to do this 2-3 times if you get errors or warnings)
    - a. `docker exec -ti drupal-project /bin/bash` (optional - change drupal-project with your container name)
    - b. from inside the container run `composer install` (you can do composer upgrade first if you'd like but it will take longer to find all new dependencies if they changed at all) 
4. Go to your new local site.

## Simple Site Install
1. `composer create-project codekoalas/koality-drupal:8.x-dev some-dir --stability dev --no-interaction`
2. Run `make first-launch` (this spins up the Docker container, logs into the container and runs `composer install`)
3. Go to your new local site.

# Previous Readme
Since this is a fork the previous README can be viewed back on the main project:
https://github.com/drupal-composer/drupal-project

