# Models & Django Admin

We would like users to be able to create new blog posts through our site. These posts will need to
be saved to a database. Django has built-in support for interacting with SQL databases through an
Object-Relational-Mapping or ORM. In this model, rows in the database table are represented by
Python objects called **models**. Let's create a model for our blog posts.

Open `blog/models.py` and add the following:

```python
class Post(models.Model):
    title = models.CharField(max_length=100)
    body = models.TextField()
    public = models.BooleanField(default=True)
    created = models.DateTimeField(auto_now_add=True)
```

Django will automatically create and update the database table schema to match our model. It does
this through database **migrations** which are files containing the SQL commands needed to configure
the database.

To generate and apply migrations to create our Post table run the following in the terminal,
(after terminating `python manage.py runserver` using **Ctrl + C**)

```bash
python manage.py makemigrations
python manage.py migrate
```

By default, Django uses SQLite as the database. You should see a `db.sqlite3` file; this is
where SQLite will store our data.

Django automatically creates an admin interface that we can use to interact with our database.

In order to login we need to create a super-user account. Hop back to the terminal and run:

```bash
python manage.py createsuperuser
```

Set the username and password to whatever you would like. You can leave email address blank.

You can now use that username and password to log in to the admin interface. Hop back to the terminal and runserver as before using this command: 

```bash
python manage.py runserver
```

To access the admin interface, go to [http://127.0.0.1:8000/admin/](http://127.0.0.1:8000/admin/).
Once you are logged in
you will see links to Groups and Users but not our Posts. This is because we haven't registered our
`Post` model with the admin app. To do that open `blog/admin.py` and add the following

```python
from .models import Post

admin.site.register(Post)
```

If you refresh the admin interface in your browser you should now see a row for managing Posts.
Click the Add link and create a few Posts. In the next stage we will render them on our website.
