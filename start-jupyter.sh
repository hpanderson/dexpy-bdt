export DEXPY_ENV_NAME=coffee_talk
source activate $DEXPY_ENV_NAME
jupyter notebook --notebook-dir=. --no-browser --ip=0.0.0.0
