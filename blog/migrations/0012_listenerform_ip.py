# Generated by Django 3.2.13 on 2022-12-15 13:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0011_agent_created_date_agent_updated_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='listenerform',
            name='ip',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
    ]