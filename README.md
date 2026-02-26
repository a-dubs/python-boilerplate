# python-boilerplate

## Development Setup

### Pre-commit Hooks

This project uses [pre-commit](https://pre-commit.com/) to ensure code quality and consistency. Pre-commit runs automated checks before each commit to catch issues early.

#### Installation

1. Install pre-commit (if not already installed):
   ```bash
   pip install pre-commit
   ```

2. Install the pre-commit hooks:
   ```bash
   pre-commit install
   ```

3. (Optional) Enable pre-push hooks for running tests before pushing:
   ```bash
   pre-commit install --hook-type pre-push
   ```

#### What Gets Checked

The following checks run automatically on every commit:
- **File hygiene**: trailing whitespace, end-of-file fixes, large files, merge conflicts, etc.
- **Ruff**: Python linting and formatting (replaces flake8, isort, and more)
- **Mypy**: Static type checking

#### Opt-in Test Hooks

Unit tests are **opt-in** and do NOT run automatically on commit. You can run them in two ways:

1. **Manual execution** (run tests on-demand):
   ```bash
   # Run all tests
   pre-commit run pytest --hook-stage manual --all-files

   # Run tests in parallel (faster)
   pre-commit run pytest-fast --hook-stage manual --all-files
   ```

2. **Enable on git push** (tests run before every push):
   ```bash
   # First, enable pre-push hooks (one-time setup)
   pre-commit install --hook-type pre-push

   # Now tests will run automatically before each push
   git push  # This will trigger pytest-fast (parallel)
   ```

#### Running Pre-commit Manually

You can run all hooks manually at any time:
```bash
# Run all hooks on all files
pre-commit run --all-files

# Run specific hook
pre-commit run ruff --all-files
pre-commit run mypy --all-files

# Run manual/push-stage hooks (like pytest)
pre-commit run --hook-stage manual --all-files
```

#### Disabling Pre-commit

If you need to skip pre-commit hooks for a specific commit:
```bash
git commit --no-verify -m "your message"
```

To uninstall pre-commit hooks:
```bash
pre-commit uninstall
pre-commit uninstall --hook-type pre-push
```
