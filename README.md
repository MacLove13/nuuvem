# Nuuvem Test Web-1
This is the Nuuvem test, carried out by Felipe Moura Barbosa on 05/30/2023

It consists of a web system for uploading files, normalizing data and storing them in a database.

--
## Setup

## Requirements
- Ruby 3.2.2
- Rails 7.0.5
- Postgres

## Run with Docker
- Change the DB_Host in your .env to: `db`. `(DB_HOST=db)`
- `docker-compose up`

## OR Step by step
- Copy .env file. `cp .env.example .env`
- Run bundle install to install gems `bundle install`
- Create database. `rake db:create`
- Run migrations. `rake db:migrate`
- Start Application. `rails s`

## To enable login via Google Account
- Add envs to your .env file `GOOGLE_OAUTH_CLIENT_ID` and `GOOGLE_OAUTH_CLIENT_SECRET`.
- Create a Key in the Google Developer Console: `https://console.cloud.google.com/`.
- For this example you can use my credentials which will only work with rails on Localhost on port 3000.
-- Client ID: `244447681242-9826i81qagk3jh6ujrumve008elar13m.apps.googleusercontent.com`
-- Secret Key: `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`

--
# DB Relationships

### User
-- The user is the account created to access the dashboard and uploads.
- A user can have many reports.

### Report
-- Reports that users have uploaded to the system.
- A report is owned by a single user.
- A report can contain many items.

### Report Item
-- The items in a report.
- An item belongs to a single report.

![Alt text](doc/diagram.png?raw=true "Diagram")

# Dashboard
You will have an overview of the data in a simple way on the Dashboard.

![Alt text](doc/dashboard1.png?raw=true "Dashboard")
![Alt text](doc/dashboard2.png?raw=true "Dashboard")
![Alt text](doc/dashboard3.png?raw=true "Dashboard")

--
# Libraries used
- Devise
- Omniauth-google-oauth2
- Omniauth-rails_csrf_protection
- Bootstrap
- Cssbundling-rails
- Fontawesome
- Chartkick & groupdate
- Kaminari
