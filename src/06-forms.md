# Forms

Now that we can view our blog posts, it would be nice to be able to create them through our website.

To enable this we will create a new page which will use a `ModelForm` to generate a HTML form that users
can fill out to create a new post.

Let's first create the template. Right-click on `blog/templates` and select **New**, **HTML File**.
Call the file `new_post.html`. Make the title `New Post` and add a heading of `<h1>New Post</h1>`.
Your HTML should look like:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Post</title>
</head>
<body>
    <h1>New Post</h1>
</body>
</html>
```

Create a new view function in `blog/views.py` which renders our template:

```python
def new_post(request):
    return render(request, "new_post.html")
```

Next we need to create a url for this page. Open `main/urls.py` and add a path for the new page to
`urlpatterns`:

```python
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.posts),
    path('new/', views.new_post),
]
```

We would like to be able to get to this page from the homepage so open `blog/template/posts.html`
and below the heading add a `<a>` tag:

```html
<body>
    <h1>Welcome to {{ name }}'s Blog!</h1>
    <a href="/new/">Create a new post</a>

    <!-- the rest of the body is unchanged -->
```

Test that everything works by refreshing your home page and following the link. You should see your
`New Post` heading.

We will create a class to represent our form in `blog/views.py`. Open that file and at the top
import the `ModelForm` base class:

```python
from django.forms import ModelForm
```

At the bottom of the file create a form class for our `Post` model by subclassing `ModelForm` and
linking it to our model using the `Meta` inner-class:

```python
class PostForm(ModelForm):
    class Meta:
        model = Post
        fields = ["title", "body", "public"]
```

The `fields` attribute determines which fields on our model can be set using this form.

To render our form in the template we need to create a new instance in our `new_post` view function
and pass it into our template:

```python
def new_post(request):
    form = PostForm()
    return render(request, "new_post.html", {"form": form})
```

Then in `blog/templates/new_post.html` we render the form with `form.to_p`. This must go inside a
`<form>` tag with a CSRF token which is used to fix a security vulnerability:

```html
<body>
    <h1>New Post</h1>

    <form method="POST">
        {% csrf_token %}
        {{ form.as_p }}
        <button>Submit</button>
    </form>
</body>
```

Refresh your New Post page and you should see the form. You can complete it and click Submit but
currently it wont save because we haven't configured our view function to handle submissions.

Since the browser will use the `/new/` url for both fetching the HTML and for submitting the
form, both types of requests will be handled by our `new_post` view function. We can distinguish
which is which by looking at the HTTP request method. Requests for the HTML will have method `GET`
whereas submissions of the form will have method `POST`.

Configure your view function to use the `PostForm` class to save data from `POST` requests:

```python
def new_post(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        form.save()
        return redirect("/")
    form = PostForm()
    return render(request, "new_post.html", {"form": form})
```

After the form is saved we redirect users back to the home page. You will need to import the
redirect function at the top of `blog/views.py`:

```python
from django.shortcuts import render, redirect
```
