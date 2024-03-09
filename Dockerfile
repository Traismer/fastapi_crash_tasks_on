FROM python:3.12-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

# Install dependencies
COPY pyproject.toml poetry.lock* /code/
RUN pip install poetry && poetry config virtualenvs.create false \
  && poetry install --no-root --no-dev

# Copy project
COPY . /code/

# Command to run the application
CMD ["uvicorn", "myapp.main:app", "--host", "0.0.0.0", "--port", "80"]