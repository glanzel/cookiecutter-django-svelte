from django.db import models

# Create your models here.

class Hello(models.Model):
    content = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.content