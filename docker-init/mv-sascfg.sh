#!/usr/bin/env bash

NB_USER=jovyan

SASPY_DIR="$(python -c 'import saspy; from pathlib import Path; print(str(Path(saspy.__file__).parent))')"
mv "/home/${NB_USER}/bin/sascfg_personal.py" "${SASPY_DIR}"