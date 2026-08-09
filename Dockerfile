ARG PYTHON_VERSION=3.13

# ---------- Build stage ----------
FROM python:${PYTHON_VERSION}-slim AS builder

ENV PDM_CHECK_UPDATE=false
ENV PDM_VENV_IN_PROJECT=1

WORKDIR /app

RUN pip install --no-cache-dir "pdm==2.28.0"

COPY pyproject.toml pdm.lock ./

RUN pdm install --check --prod --no-self --no-editable


# ---------- Runtime stage ----------
FROM python:${PYTHON_VERSION}-slim AS runtime

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/.venv/bin:$PATH"

WORKDIR /app

COPY --from=builder /app/.venv /app/.venv
COPY src ./src

EXPOSE 8000

CMD ["uvicorn", "financial_data_analyst.main:app", "--app-dir", "src", "--host", "0.0.0.0", "--port", "8000"]