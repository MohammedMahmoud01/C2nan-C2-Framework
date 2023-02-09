from rest_framework import serializers
from decimal import Decimal
from  .models import *



class ModuleSerializer(serializers.ModelSerializer):
  class Meta:
        model = Modules
        fields = ['id' , 'module_name' , 'module_type' , 'created_date']
        
        
class AgentTaskSerializer(serializers.ModelSerializer):
  module_name = serializers.CharField(read_only=True, source="module.module_name")
  name = serializers.CharField(read_only=True, source="agent.name")
  hname = serializers.CharField(read_only=True, source="agent.hname")
  username = serializers.CharField(read_only=True, source="agent.username")
  agentId = serializers.CharField(read_only=True, source="agent.id")
  moduleId = serializers.CharField(read_only=True, source="module.id")

  class Meta:
        model = Modules
        fields = ['id'  , 'moduleId', 'module_name' , 'name' , 'hname' ,  'agentId', 'username' ,  'created_date']