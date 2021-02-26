# PostGIS server
Create a **PostgreSQL** + **PostGIS** + **pgAdmin** server with Docker

## Setup
Install Git, [Docker](https://docs.docker.com/engine/install/debian/) and [Docker Compose](https://docs.docker.com/compose/install/), if not already installed.
```bash
$ sudo apt-get update
$ sudo apt-get install git
```

Clone the repo under the selected directory
```bash
$ git clone https://github.com/markusand/postgis-server
$ cd postgis-server
```

Create a `.env` file and fullfill with required variables
```bash
$ cp .env.sample .env
$ nano .env
```

Mount the container and enjoy :tada:
```bash
$ docker-compose up -d
```

## Manage database
The container exposes an instance of pgAdmin to manage the PostgreSQL from a web browser.

The connection to database must be configured the first time you enter pgAdmin. Use same variables in `.env`

- host: **host.docker.internal**
- port: `POSTGRES_PORT`
- maintenance database: **postgres**
- username: `POSTGRES_USER`
- password: `POSTGRES_PASS`

Default `reader`, `editor` and `creator` roles are created during initialization and have assigned specific privileges over the `public` schema. Assign a role to any new created user.
