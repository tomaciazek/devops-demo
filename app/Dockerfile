FROM python:3.8 as base

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

###
FROM base AS python-deps

RUN pip install pipenv

COPY Pipfile .
COPY Pipfile.lock .

RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy

### 
FROM base AS runtime
COPY --from=python-deps /.venv /.venv

ENV PATH="/.venv/bin:$PATH"

WORKDIR /app

COPY . .

EXPOSE 8080

CMD ["gunicorn", "--config", "gunicorn.conf.py", "flaskr.app:app"]
