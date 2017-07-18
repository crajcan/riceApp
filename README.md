# This app is 

To install this app get Rails 5.1.2 and Ruby ruby 2.3.0p0. 

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


