# Demo application
This repository contains a demo application (a simple echo web service).


# Running locally

## Debug & develop
First [install Pipenv](https://pipenv.pypa.io/en/latest/install/#installing-pipenv), then go to the `app` directory and
issue the following command:
```bash
pipenv install --dev
```

Then you may either run the application using the included VS Code launch configuration or the following command:
```bash
pipenv run flask --app flaskr.app run
```
