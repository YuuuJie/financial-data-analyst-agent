from fastapi import FastAPI

app = FastAPI(
    title="Financial Data Analyst Agent",
    version="0.1.0",
)


@app.get("/")
def root():
    return {
        "message": "Financial Data Analyst Agent API is running."
    }


@app.get("/health")
def health():
    return {
        "status": "ok"
    }