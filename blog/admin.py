from django.contrib import admin
from . import models

# Register your models here.
@admin.register(models.Agent)
class AgentAdmin(admin.ModelAdmin):
    list_display= ['name' , 'ip' , 'hname'  , 'created_date' , 'updated_date']
    ordering= ['name']
    list_per_page =  10


@admin.register(models.ListenerForm)
class ListenerFormAdmin(admin.ModelAdmin):
    list_display= ['interface' , 'created_date' , 'ip'  , 'stoped_date' ]
    ordering= ['created_date']
    list_per_page =  10
    
@admin.register(models.AgentTasks)
class AgentTasksAdmin(admin.ModelAdmin):
    list_display = [ 'module' , 'agent' ,  'hname',  'username', 'created_date' ]
    list_filter = ['agent' , 'module']
    ordering= ['module' , 'agent' , 'created_date']
    list_per_page =  10
    def hname(self , agentTask):
        return agentTask.agent.hname
    def username(self , agentTask):
        return agentTask.agent.username
@admin.register(models.Modules)
class ModuleAdmin(admin.ModelAdmin):
    list_display= ['module_name' ,  'module_type' , 'created_date' ]
    ordering= ['created_date']
    list_per_page =  10