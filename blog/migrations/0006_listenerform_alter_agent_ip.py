# Generated by Django 4.1 on 2022-10-14 14:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0005_delete_listenerform_delete_movie_delete_payloadform_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='ListenerForm',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('interface', models.CharField(max_length=100)),
                ('created_date', models.DateTimeField(auto_now_add=True)),
                ('stoped_date', models.DateTimeField(null=True)),
            ],
        ),
        migrations.AlterField(
            model_name='agent',
            name='ip',
            field=models.CharField(max_length=100),
        ),
    ]
