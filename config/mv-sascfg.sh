#!/usr/bin/env bash

SASPY_DIR="$(python -c 'import saspy; from pathlib import Path; print(str(Path(saspy.__file__).parent))')"
mv sascfg_personal.py "${SASPY_DIR}"