"""
Main entry point for fast api app

written by george
"""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from src.settings import settings


def get_application() -> FastAPI:
    """Make a fastAPI app with some additional settings."""
    _app = FastAPI(title=settings.PROJECT_NAME)

    _app.add_middleware(
        CORSMiddleware,
        allow_origins=[str(origin) for origin in settings.BACKEND_CORS_ORIGINS],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    return _app


app = get_application()


@app.get("/")
def hello_world() -> str:
    """This is my smaple endpoint"""
    return "Thanks"
