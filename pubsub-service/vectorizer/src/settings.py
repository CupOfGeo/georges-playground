import enum
from pathlib import Path
from tempfile import gettempdir

from dotenv import load_dotenv
from pydantic import BaseSettings
from yarl import URL

load_dotenv('.env')

TEMP_DIR = Path(gettempdir())


class LogLevel(str, enum.Enum):  # noqa: WPS600
    """Possible log levels."""

    NOTSET = "NOTSET"
    DEBUG = "DEBUG"
    INFO = "INFO"
    WARNING = "WARNING"
    ERROR = "ERROR"
    FATAL = "FATAL"


class Env(str, enum.Enum):
    """ Possible Deploy Environments."""
    LOCAL = "LOCAL"
    DEV = "DEV"  # dev or staging
    PROD = "PROD"


class Settings(BaseSettings):
    """
    Application settings.

    These parameters can be configured
    with environment variables.
    """

    host: str = "0.0.0.0"
    port: int = 8080
    # quantity of workers for uvicorn
    workers_count: int = 1
    # Enable uvicorn reloading
    reload: bool = False

    # Current environment
    environment: Env = Env.DEV  # local, dev, prod

    backend_cors_origins: list = []

    log_level: LogLevel = LogLevel.INFO

    discord_client_id: int = 0
    discord_client_secret: str = ""

    # Variables for the database
    db_host: str = "0.0.0.0"
    db_port: int = 5432
    db_user: str = "crud-fastapi-app"
    db_pass: str = "pass"
    db_base: str = "crud-fastapi-db"
    db_echo: bool = False

    @property
    def db_url(self) -> URL:
        """
        Assemble database URL from settings.

        :return: database URL.
        """
        # local postgres URL schema
        if self.environment == 'LOCAL':
            return URL.build(
                scheme="postgresql+asyncpg",
                host=self.db_host,
                port=self.db_port,
                user=self.db_user,
                password=self.db_pass,
                path=f"/{self.db_base}",
            )

        # gcp cloud sql has a different connection url schema
        return URL.build(
            scheme="postgresql+asyncpg",
            host=f"{self.db_host}?host=/cloudsql/playground-geo:us-central1:crud-fastapi-db",
            user=self.db_user,
            password=self.db_pass,
        )

    class Config:
        env_file = ".env"
        env_prefix = "FASTAPI_CRUD_"
        env_file_encoding = "utf-8"


settings = Settings()
