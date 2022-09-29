# Demo application
This repository contains a demo application (a simple echo web service) including containerization, orchestration,
IaC and CI/CD code.


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

## Docker image
You may either build and run the `Dockerfile` contained in the `app` directory, or use `docker-compose up`.

# Infrastructure-as-Code
The `terraform` directory contains the definition of contents of a common environment and a full definition of the
development environment. Terraform state is kept in the common environment, represented by the `common` resource group
on Azure, in a blob storage container. That resource group along with the storage account and the container were created
manually.

Each environment is represented by a directory inside `terraform/envs`. These represent the root modules, which other
modules from the `terraform` directory. All `terraform` commands should be invoked from one of those directories.

In a fresh deployment, the `common` infrastructure needs to be applied first, as other environments depend on it.

> NOTE: Only the development environment is included in this demo.
