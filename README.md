# Sinatra Webpack vue.js SPA template project

## Build Setup
```
bundle install
yarn
```

### Note from the author.
Ruby 2.5
Stack:
    vuejs,
    sinatra,
    psql
front-end routes:
    /
    /late
    /vendor/:vendor
    /undelivered

In the client side the main page lists any shipment in the database, as you'll see many of the queries are limited to 100,
I just didn't have a chance to add pagination and for the sake of loading times I decided a quick and dirty thing like limit was appropriate for demoability while not something that would satisfy a production setting.

The main page will have two links to undelivered shipments and late shipments.

Things I would like to do if I were continuing this:
    tests, tests everywhere,
    replace the query Im doing for late shipments with a database view,
    pagination,
    box to enter vendor linked to the vendor route

I look forward to reviewing this with you all.
## Dependency Installation
    bundle
    yarn install

## Run development
```
foreman start
# for back-end
# open http://localhost:9292
# for front-end
# open http://localhost:8080
```

## Run production
```
yarn run build
APP_ENV=production bundle exec rackup
# open http://localhost:9292
```
