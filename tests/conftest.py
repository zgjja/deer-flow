import pytest


@pytest.fixture
def set_tavily_api_key(monkeypatch):
    monkeypatch.setenv("API_KEY", "test-123456")
