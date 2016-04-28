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
)

pip install "${apps[@]}"
