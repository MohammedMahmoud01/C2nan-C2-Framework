from django.db import models

class Agent(models.Model):
    name = models.CharField(max_length=100)
    ip = models.CharField(max_length=100)
    hname = models.CharField(max_length=100)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateField(auto_now=True)
 
class ListenerForm(models.Model):
    interface = models.CharField(max_length=100)
    created_date = models.DateTimeField(auto_now_add=True)
    stoped_date = models.DateTimeField(null=True , blank = True)
    


class Modules(models.Model):
    module_name = models.CharField(max_length=200)
    module_type = models.IntegerField()
    created_date = models.DateTimeField(auto_now_add=True)
    
    
    
# class Movie(models.Model):
#     name = models.CharField(max_length=200)
#     image = models.ImageField(upload_to='images')



# class PayloadForm(models.Model):
#     listener_name = models.CharField(max_length=100)


    # listener_name = models.CharField(max_length=100)


