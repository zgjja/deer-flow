.PHONY: lint format install-dev serve test coverage

install-dev:
	uv pip install -e ".[dev,test]"

format:
	uv run ruff format --config pyproject.toml .

lint:
	uv run ruff check --fix --config pyproject.toml .

serve:
	uv run server.py --reload

test:
	uv run pytest tests/

langgraph-dev:
	uvx --refresh --from "langgraph-cli[inmem]" --with-editable . --python 3.12 langgraph dev --allow-blocking

coverage:
	uv run pytest --cov=src tests/ --cov-report=term-missing --cov-report=xml
