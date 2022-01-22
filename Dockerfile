FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code

RUN pip install -U pip
RUN pip install poetry
RUN poetry config virtualenvs.create false
COPY pyproject.toml /code/
COPY poetry.lock /code/
RUN poetry install
COPY . /code/
