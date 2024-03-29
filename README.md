# CouchDB Test Setup

This is a simple docker-based CouchDB setup for testing purposes.
The setup consists of two CouchDB servers running within the same docker network.
Note that this is *not* a clustered setup - just two servers alongside each other.

The motivation behind this setup is to test and experiment with
[replications](https://docs.couchdb.org/en/main/api/server/common.html#replicate).
Further, testing my [Python CouchDB wrapper](https://github.com/n-vlahovic/couchdb3)
is another reason for creating this small setup.


## Requirements

- `docker`: [Installation guide](https://docs.docker.com/get-docker/)
- `docker-compose`: [Installation guide](https://docs.docker.com/compose/install/)


## Setup

Create an environment file labeled `.env` in this directory.
The file ought to have the following structure

```
COUCHDB_USER=  # The admin username
COUCHDB_PASSWORD=  # The admin password
```

Note that both servers have identical admin logins and internal port.
This can easily be changed by creating variables of the form `{VAR}_{NUM}` where
`VAR` denotes either one of `COUCHDB_USER COUCHDB_PASSWORD` and
`NUM` either one of `0 1`. Then substitute the variables in the
`docker-compose.yml` file accordingly.


## Persistency

Considering the ephemeral nature of docker storage, a volume mapping has been
defined in `docker-compose.yml`. It (creates and) maps the folders
`data/db0 ; data/db1` to `couchdb0 ; couchdb1`'data locations respectively.

Note that the above paths are relative to the project directory, e.g
`path/to/couchdb-docker-setup/data/dbx`.


## Usage

### Build

To build the setup (i.e. run the servers) simply execute the command

    make build

or

    docker-compose up --build -d
    # Finish db setups with the shell script
    docker exec -it test-couchdb0 ./db_setup.sh
  	docker exec -it test-couchdb1 ./db_setup.sh  


### Stop

To stop the servers execute

    make stop

or

    docker-compose stop

### Purge

**READ CAREFULLY BEFORE EXECUTING REMOVE COMMANDS**

To purge (stop and remove all) first execute

    make purge

or

    docker-compose down -v

then, provided you want to remove the data stored on your drive, remove the
folder `data` in the project directory.

**BEWARE:**

  - Make sure to remove the proper folder! Executing a command of the form
  `rm -rf data` can be dangerous as it removes folders relative to the path
  from which the command has been executed. A safer approach would be
  `rm -rf ~/path/to/couchdb-docker-setup/data`.
  - Stating the obvious, all data stored in the database servers will be lost.
