# Creating a New Django Project

Open PyCharm and start a new project by clicking **Create New Project** from the welcome screen or
**New Project...** from the **File** menu.

In the **Location** box, replace `untitled` with `mysite`. Under **Project Interpreter** make sure
**Virtualenv** is selected.

> If you have PyCharm Professional Edition you will see a Django option when creating a new project.
> We won't use it during this workshop but you may wish to try it on your own as it simplifies the
> setup of Django projects.

In the bottom of the window, open the **Terminal** pane. Enter the following command to install
Django:

```bash
pip install django
```

Once pip has finished installing Django, create a new Django project by executing:

```
django-admin startproject main .
```

In the **Project** pane on the left you will see a folder called `main` and a file called
`manage.py`. The `manage.py` is used to execute Django management commands like creating admin users
and running database migrations.

Next we will create what is known as a Django app. In the Django context, an app is a component of a
website site. Apps are used to provide structure to a project and to group files into re-usable parts.

Create an app called `blog` by running the following command:

```bash
python manage.py startapp blog
```

You will now see a folder called `blog`. Inside the `blog` folder Django has created some files to
scaffold your app. These are mostly empty now but we will add some content to them shortly. The
following table summaries the intention behind each file:

| File        | Purpose                                                         |
| ---         | ---                                                             |
| `views.py`  | functions and classes that handle requests made to your website |
| `models.py` | classes for interacting with your database                      |
| `admin.py`  | classes for configuring the Django admin interface              |
| `apps.py`   | used to configure the app                                       |
| `tests.py`  | a place to write automated tests for your app                   |

To install your `blog` app into your Django project, open `main/settings.py` and at the end of the
`INSTALLED_APPS` list add `'blog'`. It should look like:

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

You can now run your site by executing:

```bash
python manage.py runserver
```

Go to [http://127.0.0.1:8000/](http://127.0.0.1:8000/) in web browser to see your site.

> The IP address `127.0.0.1` refers to your computer. `8000` is an arbitrary port chosen
> by Django. If you wanted to run multiple Django projects on the same computer at the same time
> you would configure them to listen on different ports.

## Challenges

1. Open a second terminal by clicking the **+** next to the **Local** tab in the terminal pane at
   the bottom of PyCharm. In this new terminal, run the following command to see some of the other
   django management commands that are available:

   ```bash
   python manage.py help
   ```
   
   You can get more information about a command with
   
   ```bash
   python manage.py help COMMAND
   ```
   
   For example:
   
   ```bash
   python manage.py help runserver
   ```
