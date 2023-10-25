# import enum
# # from dotenv import load_dotenv
# from pydantic import BaseSettings

# # load_dotenv('.env')


# class LogLevel(str, enum.Enum):  # noqa: WPS600
#     """Possible log levels."""

#     NOTSET = "NOTSET"
#     DEBUG = "DEBUG"
#     INFO = "INFO"
#     WARNING = "WARNING"
#     ERROR = "ERROR"
#     FATAL = "FATAL"


# class Env(str, enum.Enum):
#     """ Possible Deploy Environments."""
#     LOCAL = "LOCAL"
#     DEV = "DEV"  # dev or staging
#     PROD = "PROD"


# class Settings(BaseSettings):
#     """
#     Application settings.

#     These parameters can be configured
#     with environment variables.
#     """

#     host: str = "0.0.0.0"
#     port: int = 8080
#     # quantity of workers for uvicorn
#     workers_count: int = 1
#     # Enable uvicorn reloading
#     reload: bool = False

#     # Current environment
#     environment: Env = Env.DEV  # local, dev, prod

#     backend_cors_origins: list = []

#     log_level: LogLevel = LogLevel.INFO

#     class Config:
#         env_file = ".env"
#         env_prefix = "AUTOSCALER_"
#         env_file_encoding = "utf-8"


# settings = Settings()
