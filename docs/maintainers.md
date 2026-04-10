# Notes for maintainers

Operational context for merging, releasing, and reviewing changes. User-facing setup remains in
[README.md](../README.md).

## Quick start

```bash
make install
```

```python
from py_bash_wrapper.bash_utils import run_command, run_bash

print(run_command(["python", "-c", "print(1+1)"], check=True).stdout.strip())
print(run_bash("echo hello | wc -c", check=True).stdout.strip())
```

```bash
make run-tests
```

## Common operations

* Install dependencies and pre-commit hooks: `make install`
* Run tests (coverage HTML): `make run-tests`
* Run tests (terminal coverage summary): `make run-tests-terminal`
* Lint and format check: `make lint`
* Lint with auto-fix and format write: `make lint-fix`
* Build sdist and wheel: `make build`

## Version source of truth

- **`VERSION`** at the repo root holds the canonical SemVer string **without** a `v` prefix.
  - This must be manually bumped on each branch before merging to `main`.
- **Git tags** use a **`v` prefix** (e.g., `v0.2.0`).
- **`py_bash_wrapper.__version__`** comes from installed package metadata when available; from a checkout it can fall
  back to reading `VERSION`. See `py_bash_wrapper/__init__.py`.

The canonical version string is the repo-root `VERSION` file (which contains no `v` prefix).
Git tags use a `v` prefix (e.g., `v0.2.0`). Packaging reads `VERSION` via `pyproject.toml` dynamic metadata.

To cut a release: bump `VERSION` on a branch, open a PR, and merge to `main`.
When `VERSION` changes on `main`, the **Tag and release from VERSION** workflow
(`.github/workflows/release-from-version.yml`) creates an annotated tag `vX.Y.Z` on that commit. Then, if that tag does
not already exist on the remote, and if no GitHub Release already exists for that same tag, then the workflow pushes it.
The same workflow then verifies tag/version consistency, builds the wheel and sdist artifacts, publishes a GitHub
Release immediately with auto-generated notes, and uploads the same artifacts to PyPI (Trusted Publishing; GitHub
environment `pypi`). Configure the publisher in PyPI before the first upload; see [docs/maintainers.md](https://github.com/themarkrogers/py_bash_wrapper/blob/main/docs/maintainers.md).

After a tag exists (or locally before pushing), `make version-check-tag` can be run to confirm the current `v*` tag
matches `VERSION`. CI runs `scripts/verify_version_matches_tag.py` on tag pushes for the same check.


## Release path

- The high-level flow: bump `VERSION` on a branch, merge to `main`, then the
  [Tag and release from VERSION workflow](../.github/workflows/release-from-version.yml) creates the tag, GitHub
  Release, and PyPI upload when appropriate.
- See more details in [README.md](../README.md) (Versioning).

## PyPI publishing

Releases upload to [PyPI](https://pypi.org/project/py_bash_wrapper/).

**Workflow and environment**

- Triggered on all pushes to `main`.
- GHA Workflow file: `.github/workflows/release-from-version.yml`.
- Job: `publish-pypi` uses GitHub environment **`pypi`**. Create that environment under the repository
  **Settings > Environments** if it does not exist yet. Optional: add required reviewers or wait timers for extra
  safety.

## CI

- **`.github/workflows/ci.yml`** runs on pushes to `main` and on pull requests: install via `make install`, `make lint`,
  `make build`, `twine check` on `dist/*`, smoke-install the wheel in a clean venv, then `make run-tests-terminal`.
- Failures there should be treated as merge blockers unless explicitly waived with a documented reason.

## Dependabot

- **`.github/dependabot.yml`** opens weekly PRs for pip dependencies and GitHub Actions, with grouping and labels.
- Reviewer and label conventions are defined in that file; keep dependency bumps scoped and CI-green.

## Security and shell usage

- **`run_bash`** executes a string through the system Bash. Never pass untrusted or externally controlled strings as the
  command body.
- Prefer **`run_command`** with a fixed `argv` when shell features are not required. Patterns and caveats are spelled
  out in [usage_examples.md](usage_examples.md).
