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
django-admin startproject mysite .
```

In the **Project** pane on the left you will see a folder called `mysite` and a file called
`manage.py`. The `manage.py` is used to execute Django management commands like creating admin users
and running database migrations.

Next we will create what is known as a Django app. In the Django context, an app is a component of a
website site. Apps are used to provide structure to a project and to group files into re-usable parts.

Create an app called `blog` by running the following command:

```bash
python manage.py startapp blog
```

You will now see a folder called `blog`. *TODO: Explain the files in `blog`?*

To link your `blog` app into the Django project, open `mysite/settings.py` and at the end of the
`INSTALLED_APPS` list (around line 40) add `'blog'`. It should look like:

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
