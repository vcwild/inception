<div align="center">
  <img src=".github/assets/inception.png" width="230px" />
</div>
<div align="center">
  <img src="https://img.shields.io/github/languages/count/vcwild/inception?color=%233f52a6&style=flat-square" alt="languages" />
  <img src="https://img.shields.io/github/license/vcwild/inception?color=%233f52a6&style=flat-square" alt="license" />
  <img src="https://img.shields.io/github/repo-size/vcwild/inception?color=%233f52a6&style=flat-square" alt="repo size" />
</div>

# 42 Inception

Inception is a project to learn containerization and orchestration. We will use Docker and Docker Compose to build a simple web application.

## Subject

This project consists in having you set up a small infrastructure composed of different services under specific rules. The whole project has to be done in a virtual machine. You have to use docker compose.

Each Docker image must have the same name as its corresponding service. Each service has to run in a dedicated container. For performance matters, the containers must be built either from the penultimate stable version of Alpine or Debian. The choice is yours.

You also have to write your own Dockerfiles, one per service. The Dockerfiles must be called in your docker-compose.yml by your Makefile.

It means you have to build yourself the Docker images of your project. It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub (Alpine/Debian being excluded from this rule).

You then have to set up:

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress + php-fpm (it must be installed and
configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A docker-network that establishes the connection between your containers.

Your containers have to restart in case of a crash.

- In your WordPress database, there must be two users, one of them being the administrator. The administrator???s username can???t contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and
so forth).

To make things simpler, you have to configure your domain name so it points to your local IP address.
This domain name must be login.42.fr. Again, you have to use your own login.
For example, if your login is wil, wil.42.fr will redirect to the IP address pointing to wil???s website.

## Usage

The following commands are used for evaluation purposes.

### Check the blog

In order to check the blog, simply run the following command:

```sh
xdg-open https://vwildner.42.fr
```

Be aware that the available cert is self-signed and will be rejected by your browser.

Alternatively, you can also do this via terminal:

```sh
curl --insecure https://vwildner.42.fr -vv
```

### Check the containers

First source the environment variables:

```bash
source .env
```

You can access any container by using:

```sh
#List all containers
docker container ls
#Access a container
docker exec -it [container_name] sh
```

You can access the database by using:

```sh
docker exec -it mariadb mysql -u$DB_USER -p$DB_PASSWORD
```

You will need to check if there are at least 2 users in the wp_users table:

```sh
docker exec -it mariadb mysql -u$DB_USER -p$DB_PASSWORD \
-e "USE '$DB_NAME';SELECT * FROM wp_users"
```

### Backup

You can backup the database from within docker by using:

```sh
docker exec -it mariadb mysqldump -u$DB_USER -p$DB_PASSWORD --all-databases > wordpress.sql
```

# LICENSE

This project is licensed under the GNU Affero General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

# References

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [NGINX](https://www.nginx.com/)
- [WordPress](https://wordpress.org/)
- [MariaDB](https://mariadb.org/)
- [Alpine](https://alpinelinux.org/)
