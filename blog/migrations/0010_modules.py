# Generated by Django 4.1.2 on 2022-11-30 18:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0009_alter_listenerform_stoped_date'),
    ]

    operations = [
        migrations.CreateModel(
            name='Modules',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('module_name', models.CharField(max_length=200)),
                ('module_type', models.IntegerField()),
                ('created_date', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]