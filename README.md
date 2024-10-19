# Django Project with Docker Compose

This project uses `Docker Compose` to orchestrate the Django backend along with several useful commands to simplify common tasks. The commands can be run using `make` via the provided `Makefile`.

## Prerequisites

Ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Make](https://www.gnu.org/software/make/manual/make.html) (optional, but simplifies running commands)

## Setup

1. Copy the example `.env.sample` file to create a new `.env` file:
   ```bash
   make copy-env
   ```

2. Build the Docker containers for the project:
   ```bash
   make build
   ```

3. Start the application in the background:
   ```bash
   make up
   ```

4. Apply Django database migrations:
   ```bash
   make migrate
   ```

5. To stop the backend:
   ```bash
   make stop
   ```

6. To shut down the backend:
   ```bash
   make down
   ```

## Running Tests

### Pytest

To run the test suite using `pytest` inside the Docker container:

```bash
make pytest
```

### Test Coverage

To run the test suite and generate a coverage report:

```bash
make coverage
```

## Linting and Formatting

### Bandit

To check the code for common security issues using `bandit`:

```bash
make bandit
```

### Black

To automatically format the codebase using `black`:

```bash
make black
```

### Flake8

To lint the codebase for style violations using `flake8`:

```bash
make flake8
```

## Help

To print the available commands and their descriptions:

```bash
make help
```

---

### Example `.env.sample`

Make sure to customize the `.env.sample` file according to your project's needs. Here’s an example of what it might look like:

```bash
SECRET_KEY=your-secret-key
DEBUG=True
DB_NAME=postgres
DB_USER=postgres
DB_PASSWORD=postgres
DB_HOST=db
DB_PORT=5432
```

Once customized, copy it to `.env` by running:

```bash
make copy-env
```

---

### Notes

- You can silence the output of make commands by default. Use `VERBOSE=1` to enable verbose output:
  ```bash
  VERBOSE=1 make <command>
  ```
