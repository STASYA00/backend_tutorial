<a name="readme-top"></a>

<br />
<div align="center">
  <a href="https://github.com/STASYA00/backend_tutorial">
    <img src="./assets/server_client_cover.png" alt="Logo" width="900">
  </a>

  <h3 align="center">Flask Backend Tutorial</h3>

  <p align="center">
    Simple Flask app with Google Cloud Functions deployment.
  </p>
</div>



## Table of Contents
- [About](#about)
- [Getting Started](#getting-started)
- [Deployment](#deployment)
- [Endpoints](#endpoints)
- [Documentation](#documentation)
- [License](#license)


[![Watch the video](https://img.youtube.com/vi/msXjNLDgkYM/0.jpg)](https://www.youtube.com/watch?v=msXjNLDgkYM&list=PL30XbgdrzGDQCRn2p6sSoTQLoyojgQ8AQ&index=2)

## About

Flask backend boilerplate with multiple endpoints and Google Cloud Functions deployment support.

**Built with:**
- Flask
- Google Cloud Functions (Gen 2)
- Python 3.11

## Getting Started

**Local development:**
```bash
pip install -r requirements.txt
python app.py
```

Server runs at `http://localhost:5000`

**Try the API:**
See [example/demo.ipynb](example/demo.ipynb) for example requests.

## Deployment

Deploy to Google Cloud Functions:

1. Configure `.env`:
   ```bash
   cp .env.example .env
   # Edit .env with your GCP settings
   ```

2. Deploy:
   ```bash
   ./deploy-gcf.sh  # Linux/Mac
   deploy-gcf.bat   # Windows
   ```

See [docs/deploy-cloud-functions.md](docs/deploy-cloud-functions.md) for details.

## Endpoints

- `GET /` - Hello message
- `GET /health` - Health check
- `GET /test?lat=<lat>&lon=<lon>` - Test endpoint with location parameters
- `POST /echo` - Echo JSON payload

## Documentation

- [GCP Setup Guide](docs/GCP.md)
- [Cloud Functions Deployment](docs/deploy-cloud-functions.md)

## License

MIT License



