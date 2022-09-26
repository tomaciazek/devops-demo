import pytest
from flaskr.app import app

# pylint: disable=redefined-outer-name


@pytest.fixture()
def client():
    return app.test_client()


def test_text(client):
    response = client.get("/api/echo?text=test")
    assert response.json["text"] == "test"


def test_no_text(client):
    response = client.get("/api/echo")
    assert response.status_code == 422
    assert (
        response.json["errors"]["query"]["text"][0]
        == "Missing data for required field."
    )
