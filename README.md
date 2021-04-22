![](https://img.shields.io/badge/Microverse-blueviolet)

<h1 align="center">🕴️ Tasks-Tracker-API (backend) 🕴️</h1>

> This is the backend repo for the full stack project - Tasks-Tracker-React.

### ✨ [FrontEnd Files](https://github.com/belsman/Tasks-Tracker-React)

## Project Detail
- This app lets users track the number of hours spent on a set of pre-determined daily routine. 
- The user can log in by entering their name and password
- Users can add individual measurements for each kind of task. 
- Users can view past records and go deep into details for each one.

## Live demo

- 🔗 [End Point](https://enigmatic-escarpment-42132.herokuapp.com/)
- 🔗 [Sign up to get a token](https://enigmatic-escarpment-42132.herokuapp.com/signup)
- 🔗 [Login to get a token if you have an account](https://enigmatic-escarpment-42132.herokuapp.com/auth/login)
- 🔗 [POST, GET on this endpoint](https://enigmatic-escarpment-42132.herokuapp.com/measurements)

## Built With

- Ruby 2.7
- Rails 6.1.1
- Postgresql

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

In order for ```Tasks-Tracker-API``` to work locally on your machine, you need these installations:
- Ruby
- Postgres database engine

### Install

1) Open the Terminal
2) Run

```sh
git clone https://github.com/belsman/Tasks-Tracker-API.git
```

or, for SSH:

```sh
git clone git@github.com:belsman/Tasks-Tracker-API.git
```

3) Run ```cd Tasks-Tracker-API``` to enter the main directory
4) Run ```bundle install```
5) Run ```yarn install```
6) Create database and run migrations with these command:
    - ```rails db:create```
    - ```rails db:migrate```
7) Start up the local server with ```rails s -p 9000```
8) Visit ```http://127.0.0.1:9000/signup``` to uptain an auth token
9) Navigate the routes by visiting the following routes with the auth token embedded in
  ***Authorization header***
  - ```POST: /measurements```
  - ```GET: /measurements```


### Run Rails-spec

1) Open the terminal
2) Run ```cd Rails-Capstone``` to enter main directory
3) Migrate the test database: ```rails db:migrate RAILS_ENV=test```
4) Run ```rake spec```

## Author

👤 **Bello Babakolo**

- Github: [@belsman](https://github.com/belsman)
- Twitter: [@d_belsman](https://twitter.com/d_belsman)
- Linkdin: [Bello Babakolo](https://www.linkedin.com/in/bello-babakolo-b23b17145/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse for showing the way for this project to happen
- [Gregoire Vella on Behance](https://www.behance.net/gregoirevella)
- [This Awesome toturial](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one)