#Calendar Aggregation API

This is a project to aggregate and manage calendar events from various sources.



#Get Started using Docker
This project used Docker. These instructions are written based on OSX, though ostensibly docker should make things easier to work across Windows/Linux/etc.

1. Download & install [Docker Toolbox](https://www.docker.com/products/docker-toolbox)
2. Make sure you have the commands `docker-compose` and `docker-machine` available in your terminal.
3. Clone this repository.
4. Within the cloned repository, run `eval $(docker-machine env default)`. This sets up your environment variables for docker use. Note that by running this in the terminal, you'll have to run this again with every new terminal window. You can add this line to you `.bashrc` or equivalent to avoid having to repeat this.
5. Run `docker-compose up` to build and start up the docker container/service.
6. Run `docker-compose run web rake db:setup` to set up the database. Note: whenever you want to run a rails command within docker, you prefix the rails command with `docker-compose run web`.
7. So, you should now have an app running within docker and a database all set up. To view anything, you'll need the IP. Get that by running `docker-machine ip`. The api runs on port 3000, so visit `<the_docker_machine_ip>:3000` and get going!.


##Notes on working with Docker

 - **If you keep getting `ERROR: Couldn't connect to Docker daemon - you might need to run docker-machine start default.`**

    Make sure that you have run `eval $(docker-machine env default)` *in the current terminal window* to set up your environment variables, or otherwise run that command via `.bashrc` or equivalent.

- **To run rails/rake commands like `rails c`, `rake db:migrate`, etc**

    **tldr;** prefix things with `docker-compose run web`

    Commands run within the context of the app running inside docker need to be told to run *there* vs your current directory which is just a "mounted volume", or external files/directories that you can edit in your normal file system which docker pulls in to use (This is how you can easily edit files running in docker, learn more about that [here](http://container-solutions.com/understanding-volumes-docker/)). So by prefixing the command with `docker-compose run web` (ex. `docker-compose run web rails console`) you are telling docker to run `rails console` within the context of the 'web' process which is the one that our api is running in.
