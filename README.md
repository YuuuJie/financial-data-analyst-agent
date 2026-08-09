# Financial Data Analyst Agent

An AI-powered financial data analysis agent for natural-language querying and actionable insights.

> Current stage: project infrastructure and containerized development environment are complete.  
> AI agent, database querying, and financial analysis capabilities will be implemented in later development stages.

## Overview

Financial Data Analyst Agent is a portfolio project designed to explore how AI agents can help users interact with structured financial and business data through natural language.

The long-term goal is to support workflows such as:

- Natural-language financial data queries
- Automated SQL generation and execution
- Financial and operational metric analysis
- Data-driven insight generation
- Multi-agent review and validation workflows

The current version focuses on building a reliable and reproducible application foundation.

## Current Features

- Structured Python project using a `src` layout
- Dependency management with PDM
- Reproducible dependencies with `pdm.lock`
- FastAPI application with health-check endpoint
- Multi-stage Docker build using Python 3.13 slim
- Docker build cache optimization
- Docker Compose orchestration
- PostgreSQL database service
- Persistent PostgreSQL volume
- Environment-based configuration
- Database health check and service dependency management

## Tech Stack

### Backend

- Python 3.13
- FastAPI
- Uvicorn

### Database

- PostgreSQL 16

### Dependency Management

- PDM
- `pyproject.toml`
- `pdm.lock`

### Infrastructure

- Docker
- Docker Compose

## Project Structure

```text
financial-data-analyst-agent/
├── src/
│   └── financial_data_analyst/
│       ├── __init__.py
│       └── main.py
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── .env.example
├── .gitignore
├── pyproject.toml
├── pdm.lock
└── README.md
```

## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/YuuuJie/financial-data-analyst-agent.git
cd financial-data-analyst-agent
```

### 2. Create the environment file

On Windows PowerShell:

```powershell
Copy-Item .env.example .env
```

On macOS or Linux:

```bash
cp .env.example .env
```

### 3. Start the application

```bash
docker compose up --build
```

Docker Compose will start:

- FastAPI API service
- PostgreSQL database service

The API waits for PostgreSQL to become healthy before starting.

## API Endpoints

After the application starts, open:

- API root: `http://localhost:8000/`
- Health check: `http://localhost:8000/health`
- Interactive API documentation: `http://localhost:8000/docs`

Expected health-check response:

```json
{
  "status": "ok"
}
```

## Stop the Application

```bash
docker compose down
```

The PostgreSQL named volume is preserved by default, so database data can survive container recreation.

## Local Development

Install dependencies with PDM:

```bash
pdm install
```

Run the FastAPI development server:

```bash
pdm run uvicorn financial_data_analyst.main:app --app-dir src --reload
```

Then visit:

```text
http://localhost:8000
```

## Development Workflow

This project follows a feature-branch workflow:

```text
feature branch
    ↓
development and local verification
    ↓
commit
    ↓
push
    ↓
Pull Request
    ↓
review
    ↓
merge into main
```

Conventional Commit-style messages are used to keep the project history clear.

Examples:

```text
feat: initialize Python project structure
build: add Docker containerization
build: add Docker Compose services
docs: update project documentation
```

## Roadmap

Planned future development includes:

- Database schema and financial sample data
- SQLAlchemy database integration
- Natural-language-to-SQL workflow
- LLM integration
- SQL review and validation
- Financial metric analysis
- Insight generation
- Agent orchestration
- Evaluation and observability

## License

MIT