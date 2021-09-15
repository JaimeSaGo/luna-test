from __future__ import unicode_literals
from django.db import models

# Create your models here.

class catalogo(models.Model):
    id = models.AutoField(primary_key=True)
    sku = models.IntegerField(blank=False, null=False)
    name = models.CharField(max_length=100, blank=False, null=False)
    brand = models.CharField(max_length=100, blank=False, null=False)
    model = models.CharField(max_length=100, blank=False, null=False)
    price = models.FloatField(null=False, blank=False)
    description = models.CharField(max_length=200, blank=False, null=False)
    def __unicode__(self):
        return self.id

    def __str__(self):
        return "%s" %(self.pk)