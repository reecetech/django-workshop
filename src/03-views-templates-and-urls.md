# Views, Templates and URLs

We will now create a page to display the posts made to our blog. In Django this requires creating a
function called a **view function** that receives a request from the web browser and returns a response that
the browser will display to the user.

To create the view function, open `blog/views.py` and add the following:


```python
from django.http import HttpResponse


def posts(request):
    return HttpResponse('It works!')
```

We also need to configure which url will execute this view function. Open `myproject/urls.py` and
import our `views` module at the top of the file below the existing import:

```python
from blog import views
```

Add your `posts` view to the `urlpatterns`:

```python
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.posts),
]
```

> The first argument to `path` is an empty string because we want the blog posts to appear on the
> home page of blog. If you wanted the url for your blog to be `http://127.0.0.1:8000/myblog/` then
> you would write: `path('myblog/', views.posts)`.

Visit [http://127.0.0.1:8000/](http://127.0.0.1:8000/) in your browser and you should see the text
from the view function.

Instead of returning plain text, we would like our view function to return HTML so we can use
display headings, links, images etc. To do this we create a Django template file.

Right-click on the `blog` folder and select **New / Directory**. Name the folder `templates`.
Right-click on `templates` and select **New / HTML File**. Name the file `posts.html`.

PyCharm helpfully adds some starting HTML in the new file. In the `<title>` tag enter `My Blog` and
hit Enter. In the `<body>` tags enter:

```html
<h1>Welcome to My Blog!</h1>
```

Your full HTML should look like:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Blog</title>
</head>
<body>
    <h1>Welcome to My Blog!</h1>
</body>
</html>
```

Back in `blog/views.py` change the `posts` function to:

```python
from django.shortcuts import render


def posts(request):
    return render(request, "posts.html")
```

The reason we call `posts.html` a template is because as well as regular HTML, it can contain
special placeholder tags that Django can use to dynamically substitute in data each time a user
requests the page. To demonstrate this, change the heading in `posts.html` to:

```html
<h1>Welcome to {{ name }}'s Blog!</h1>
```

Then make your `posts` view function provide your name to the template:

```python
def posts(request):
    return render(request, "posts.html", {"name": "Alice"})
```

Refresh the page in your web browser and your name should be substituted into the heading. We will
use this same technique to pass blog posts into the template to be rendered.


## Challenges

1. Django has a large number of
   [**filters**](https://docs.djangoproject.com/en/2.2/ref/templates/builtins/#built-in-filter-reference)
   that transform data inside templates. Try changing `{{ name }}` to
   `{{ name | upper }}` to one such filter in action.
3. What happens if you forget to supply the data to the template? Make it obvious when data is
   missing by adding `'string_if_invalid': '<MISSING>',` to the `OPTIONS` dictionary under
   `TEMPLATE` in `myproject/settings.py`.
