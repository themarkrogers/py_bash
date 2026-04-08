<!--- BADGES: START --->

[![GitHub license](https://img.shields.io/badge/License-AGPLv3-blue.svg)][#license-gh-package]
[![Unit Tests](https://github.com/themarkrogers/py_bash/actions/workflows/ci.yml/badge.svg)](https://github.com/themarkrogers/py_bash/actions/workflows/ci.yml)
[![Project Status](http://opensource.box.com/badges/active.svg)](http://opensource.box.com/badges)
<!-- [![PyPI - Python Version](https://img.shields.io/pypi/pyversions/py_bash)][#pypi-package] -->
<!-- [![PyPI](https://img.shields.io/pypi/v/py_bash)][#pypi-package] -->

[#license-gh-package]: https://www.gnu.org/licenses/agpl-3.0.en.html#license-text
<!-- [#pypi-package]: https://pypi.org/project/py_bash/ -->

<!--- BADGES: END --->

# Py-Bash

![Logo](assets/py_bash-logo.png)

## Description

This library simplifies the use of Bash/Shell commands in Python.

## Initial Setup

Prerequisites:

* Install `uv` (if needed):
  * macOS: `brew install uv`
    * If needed, then [install Homebrew](https://brew.sh/)
  * Other: `curl -LsSf https://astral.sh/uv/install.sh | sh`
* Install `make` (if needed):
  * macOS: (built-in)
  * Other: TBD
* Install `python3` (if needed):
  * macOS: `brew install python@3.12` OR `brew install python@3.13` OR `brew install python@3.14`
  * Other: TBD


## Common Operations

* Install project dependencies: `make install`
* Run Tests: `make run-tests`
* Format & Lint: `make lint`
* Format, Lint, and Fix: `make lint-fix`
