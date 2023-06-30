from fastapi.testclient import TestClient
from src.api.application import get_app
import uuid
app = get_app()
client = TestClient(app)


def test_read_main():

    url = app.url_path_for("send_echo_message")
    message = uuid.uuid4().hex
    response = client.post(
        url,
        json={
            "message": message,
        },
    )

    assert response.status_code == 200
    assert response.json() == {"message": message}
