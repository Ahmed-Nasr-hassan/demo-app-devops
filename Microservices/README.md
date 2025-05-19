# Flask Docker App

This is a simple Flask application containerized using Docker. It uses **Gunicorn** as the production WSGI server.

**`requirements.txt`**
  1. Flask==2.2.2
  2. Werkzeug==2.2.2 # Flask dependency
  3. gunicorn==23.0.0 # WSGI sevrer

## Dockerized Setup

### Build and Run the Docker Image

```bash
  docker build -t demo-app .
```

```bash
  docker run -p 5000:5000 demo-app
```

## Testing Using Curl:

```bash
curl http://localhost:5000/users
[
  {
    "id": 1,
    "name": "John Doe"
  },
  {
    "id": 2,
    "name": "Jane Doe"
  }
]

```

