from rest_framework import serializers
from decimal import Decimal
from  .models import *



class ModuleSerializer(serializers.ModelSerializer):
  class Meta:
        model = Modules
        fields = ['id' , 'module_name' , 'module_type' , 'created_date']