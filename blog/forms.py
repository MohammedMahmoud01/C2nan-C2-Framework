from django.forms import ModelForm
from django import forms
from .models import *



class listener(ModelForm):
    interface = forms.TextInput()
    class Meta:
        model = ListenerForm
        fields = ['interface']
        
        
    # created_date = forms.DateTimeField(auto_now_add=True)
    # stoped_date = forms.DateTimeField(null=True)
         
# class listenerform(ModelForm):
#     listener_name = forms.TextInput()
#     portNum = forms.NumberInput()
#     interface = forms.TextInput()
#     class Meta:
#         model = ListenerForm
#         fields = ['listener_name','portNum','interface']

# class payloadform(ModelForm):
#     listener_name = forms.TextInput()
#     class Meta:
#         model = PayloadForm
#         fields = ['listener_name']

# class agent(ModelForm):
#     name = forms.TextInput()
#     ip = forms.NumberInput()
#     class Meta:
#         model = Agent
#         fields = ['name','ip']

# class upladform(ModelForm):
#     name = forms.TextInput()
#     image = forms.ImageField()
#     class Meta:
#         model = Movie
#         fields = ['name','image']