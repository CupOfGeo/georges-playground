import httpx


# Replace these with your Discord client ID and secret
OAUTH2_URL = "https://discord.com/api/oauth2/authorize"
TOKEN_URL = "https://discord.com/api/oauth2/token"
API_BASE_URL = "https://discord.com/api/users/@me"


class DiscordOAuth2:
    def __init__(self, client_id: int, client_secret: str, redirect_uri: str):
        self.client_id = client_id
        self.client_secret = client_secret
        self.redirect_uri = redirect_uri

    def get_redirect_url(self):
        return f"{OAUTH2_URL}" + \
            f"?client_id={self.client_id}&redirect_uri={self.redirect_uri}&response_type=code&scope=identify%20email"

    async def get_token(self, code: str):
        data = {
            "client_id": self.client_id,
            "client_secret": self.client_secret,
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": self.redirect_uri,
            "scope": "identify email",
        }
        headers = {
            "Content-Type": "application/x-www-form-urlencoded"
        }
        async with httpx.AsyncClient() as client:
            resp = await client.post(TOKEN_URL, data=data, headers=headers)
            resp.raise_for_status()
            return resp.json().get("access_token")

    async def get_username(self, token: str):
        headers = {
            "Authorization": f"Bearer {token}"
        }
        async with httpx.AsyncClient() as client:
            resp = await client.get(API_BASE_URL, headers=headers)
            resp.raise_for_status()
            return resp.json().get("username")
