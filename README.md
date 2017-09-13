# This app is a business forum, a lean mini-facebook for professionals to share interesting events, news opportunites and ideas.

To install this app, first get Ruby 2.3.0p0. 

To get started with the app, clone the repo and then install the needed gems: 

```
$ bundle install --without production

```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```


