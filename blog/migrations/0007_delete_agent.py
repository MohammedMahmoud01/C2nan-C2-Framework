# Generated by Django 4.1 on 2022-10-18 20:20

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0006_listenerform_alter_agent_ip'),
    ]

    operations = [
        migrations.DeleteModel(
            name='agent',
        ),
    ]