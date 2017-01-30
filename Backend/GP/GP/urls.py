from django.conf.urls import url
from django.contrib import admin
from Twitter.views import search_form , search

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'search_form/$' , search_form),
    url(r'search/$' , search),

]
