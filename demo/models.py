from __future__ import unicode_literals
from django.db import models



class auto_scraper(models.Model):
    url_id = models.CharField(max_length=300, primary_key=True)
    data = models.TextField(max_length=50000, null=False, blank=False)

    def __str__(self):  # __unicode__ on Python 2

        return self.url_id


class url(models.Model):
    url_link = models.CharField(max_length=300)
    status = models.IntegerField(default=0)

    def __str__(self):  # __unicode__ on Python 2

        return self.url_link

