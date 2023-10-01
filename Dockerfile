FROM python:3.11-bookworm
RUN apt update && apt upgrade -y
RUN set -x \
    && apt install curl iputils-ping -y
RUN curl -sSL https://install.python-poetry.org | python3 - \
    && ln -s /root/.local/bin/poetry /usr/bin/

# Create .venv in the project folder when you run poetry shell
RUN poetry config virtualenvs.in-project true

WORKDIR /root
COPY ./bashrc .

WORKDIR /app
#RUN poetry init