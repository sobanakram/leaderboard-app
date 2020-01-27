# Leaderboard App

# How to run this project

Clone this repository.

```console
$ git clone git@github.com:sobanakram/leaderboard-app.git
$ cd leaderboard-app
```
make sure you have Ruby version 2.6.5

Install gem dependencies
```console
$ bundle install
```

Create, migrate database
```console
$ rails db:create db:migrate
```

Run rails server
```console
$ rails s
```

Open offline/leaderboard.html

Run script from this repo https://github.com/stevebutterworth/Leaderboard-Data-Simulator
Leaderboard will auto update after every second.
