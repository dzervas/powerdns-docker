import app.models
tmp = app.models.User(username=args[1], plain_text_password=args[2])
tmp.create_local_user()
