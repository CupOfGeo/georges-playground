from fastapi.routing import APIRouter
from src.api import auth, dummy, echo, monitoring

api_router = APIRouter()
api_router.include_router(monitoring.router)
api_router.include_router(echo.router, prefix="/echo", tags=["echo"])
api_router.include_router(dummy.router, prefix="/dummy", tags=["dummy"])
api_router.include_router(auth.router, prefix="/auth", tags=["auth"])
