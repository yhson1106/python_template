setup:
	git config commit.template .gitmessage.txt
	poetry install
	pre-commit install

clean:
	rm -vrf ./build ./dist ./*.tgz ./*.egg-info .pytest_cache .mypy_cache
	find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete

format:
	poetry run isort .
	poetry run black .

lint:
	poetry run mypy .
	poetry run flake8

test:
	poetry run pytest --cov=python_project
