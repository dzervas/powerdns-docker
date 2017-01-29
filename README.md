# powerdns-docker
[PowerDNS](https://www.powerdns.com/) & [PowerDNS-Admin](https://github.com/ngoduykhanh/PowerDNS-Admin) docker images

Beware, these images are configured to use SQLite and are intended to run for small-scale usecases.
If you want to cover larger scale usecases use MySQL/MariaDB/PostgreSQL backends.

## Usage
```
git clone git@github.com:dzervas/powerdns-docker
cd powerdns-docker && docker-compose up -d
```

To create a new administrator (run the image once to create the database, before attempting to create an admin):
```
docker-compose stop admin
docker-compose run python create_admin.py myusername mypassword
docker-compose restart admin
```
