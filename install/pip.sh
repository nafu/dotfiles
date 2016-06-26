# Install anaconda

anaconda=anaconda3-2.5.0

pyenv install $anaconda
pyenv global $anaconda

# Install packages

apps=(
  # In use evervim
  markdown
  # redshift_requirements.txt
  # https://github.com/3mei/rjmetrics_blog_posts/blob/master/jupyter_redshift_analytics_stack/assets/redshift_requirements.txt
  psycopg2
  sqlalchemy
  ipython-sql
  simplejson
  --upgrade https://storage.googleapis.com/tensorflow/mac/tensorflow-0.8.0-py3-none-any.whl
)

pip install "${apps[@]}"

# This solves import error
# https://github.com/pymc-devs/pymc3/issues/801
conda install jupyter

# Avoid psycopg2 image not found
# http://stackoverflow.com/questions/16407995/psycopg2-image-not-found
sudo ln -s /Library/PostgreSQL/9.4/lib/libssl.1.0.0.dylib /usr/local/lib
sudo ln -s /Library/PostgreSQL/9.4/lib/libcrypto.1.0.0.dylib /usr/local/lib
