from django.db import models
from django.contrib.auth.models import User # new

class Agent(models.Model):
    name = models.CharField(max_length=100)
    ip = models.CharField(max_length=100)
    hname = models.CharField(max_length=100)
    username = models.CharField(max_length=100)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateField(auto_now=True)
    def __str__(self) -> str:
        return self.name
        
class ListenerForm(models.Model):
    interface = models.CharField(max_length=100)
    created_date = models.DateTimeField(auto_now_add=True)
    stoped_date = models.DateTimeField(null=True , blank = True)
    ip = models.CharField(max_length=200,   null=True , blank = True)
    def __str__(self) -> str:
        return self.interface

class Modules(models.Model):
    module_name = models.CharField(max_length=200)
    module_type = models.IntegerField()
    created_date = models.DateTimeField(auto_now_add=True)
    def __str__(self) -> str:
        return self.module_name
class AgentTasks(models.Model):
    agent = models.ForeignKey(Agent , on_delete=models.PROTECT)
    user = models.ForeignKey(User, blank=True , null=True , default=None, on_delete=models.CASCADE)  
    module = models.ForeignKey(Modules, on_delete=models.PROTECT)
    created_date = models.DateTimeField(auto_now_add=True)   
    task_result = models.TextField(null = True  , blank = True)
    
# class Movie(models.Model):
#     name = models.CharField(max_length=200)
#     image = models.ImageField(upload_to='images')



# class PayloadForm(models.Model):
#     listener_name = models.CharField(max_length=100)


    # listener_name = models.CharField(max_length=100)


