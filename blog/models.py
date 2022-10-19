from django.db import models

class Agent(models.Model):
    name = models.CharField(max_length=100)
    ip = models.CharField(max_length=100)
    hname = models.CharField(max_length=100)

 
class ListenerForm(models.Model):
    interface = models.CharField(max_length=100)
    created_date = models.DateTimeField(auto_now_add=True)
    stoped_date = models.DateTimeField(null=True)
    



# class Movie(models.Model):
#     name = models.CharField(max_length=200)
#     image = models.ImageField(upload_to='images')



# class PayloadForm(models.Model):
#     listener_name = models.CharField(max_length=100)


    # listener_name = models.CharField(max_length=100)


