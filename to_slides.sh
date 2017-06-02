export DEXPY_ENV_NAME=coffee_talk
source activate $DEXPY_ENV_NAME
jupyter nbconvert --to notebook dexpy-demo.ipynb --ClearOutputPreprocessor.enabled=True --ExecutePreprocessor.enabled=True
jupyter nbconvert --to slides dexpy-demo.nbconvert.ipynb --template output_toggle --reveal-prefix=reveal.js

