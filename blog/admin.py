from django.contrib import admin
from . import models

# Register your models here.
@admin.register(models.Agent)
class AgentAdmin(admin.ModelAdmin):
    list_display= ['name' , 'ip' , 'hname' ]
    ordering= ['name']
    list_per_page =  10


@admin.register(models.ListenerForm)
class ListenerFormAdmin(admin.ModelAdmin):
    list_display= ['interface' , 'created_date' , 'stoped_date' ]
    ordering= ['created_date']
    list_per_page =  10
    
@admin.register(models.Modules)
class ModuleAdmin(admin.ModelAdmin):
    list_display= ['module_name' ,  'module_type' , 'created_date' ]
    ordering= ['created_date']
    list_per_page =  10