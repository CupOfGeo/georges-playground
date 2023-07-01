# from pydantic import BaseModel
# from typing import Optional

from fastapi import HTTPException, status
from fastapi.responses import RedirectResponse

from fastapi import APIRouter
from src.api.auth.discord_oauth2 import DiscordOAuth2
from yarl import URL
from src.settings import settings

router = APIRouter()

# also set in discord dev console
REDIRECT_ROUTE = "/discord/login_auth"

redirect_url = URL.build(scheme='http',
                         host=settings.host,
                         port=settings.port,
                         path=f"/api/auth{REDIRECT_ROUTE}")

discord_oauth2 = DiscordOAuth2(settings.discord_client_id,
                               settings.discord_client_secret, redirect_url)


@router.get("/discord/login")
async def login():
    # Redirect user to Discord authorization page
    return RedirectResponse(url=discord_oauth2.get_redirect_url())


@router.get(REDIRECT_ROUTE)
async def login_auth(code: str):
    if code is None:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Unauthorized",
            headers={"WWW-Authenticate": "Bearer"},
        )
    token = await discord_oauth2.get_token(code)
    username = await discord_oauth2.get_username(token)
    print(username)
    return {"username": username}
