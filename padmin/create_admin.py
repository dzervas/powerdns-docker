import app.models
import sys

tmp = app.models.User(username=sys.argv[1], plain_text_password=sys.argv[2])
tmp.create_local_user()
