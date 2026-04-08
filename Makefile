build:
	uv run python -m build
install:
	uv sync --extra dev --extra test
	uv run pre-commit install --install-hooks
lint:
	uv run mypy .
	uv run ruff check .
	uv run ruff format --check .
lint-fix:
	uv run mypy .
	uv run ruff check --fix
	uv run ruff format .
pre-commit:
	uv run ruff check .
	uv run ruff format --check .
	uv run pytest
run-tests:
	uv run pytest --cov=py_bash --cov-report=html
run-tests-terminal:
	uv run pytest --cov=py_bash --cov-report=term-missing
