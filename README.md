# devops-capstone-project

![Build Status](https://github.com/YOUR_GITHUB_USERNAME/devops-capstone-project/actions/workflows/ci-build.yaml/badge.svg)

Capstone project: a Customer Accounts REST microservice built with Flask, tested with TDD, and deployed with CI/CD to Kubernetes.

## Endpoints

| Method | URL | Description |
|--------|-----|-------------|
| GET | `/health` | Health check |
| POST | `/accounts` | Create an account |
| GET | `/accounts` | List all accounts |
| GET | `/accounts/<id>` | Read an account |
| PUT | `/accounts/<id>` | Update an account |
| DELETE | `/accounts/<id>` | Delete an account |

## Run locally

```bash
make install   # install dependencies
make db        # start PostgreSQL in Docker
make tests     # run unit tests
make run       # start the service
```
