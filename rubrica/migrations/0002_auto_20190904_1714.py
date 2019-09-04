# Generated by Django 2.2.5 on 2019-09-04 17:14

from django.db import migrations, models
import jsonfield.fields


class Migration(migrations.Migration):

    dependencies = [
        ('rubrica', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='rubrica',
            name='campos',
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='cod',
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='username',
        ),
        migrations.AddField(
            model_name='rubrica',
            name='json',
            field=jsonfield.fields.JSONField(default=dict),
        ),
        migrations.AddField(
            model_name='rubrica',
            name='nombre',
            field=models.CharField(default='', max_length=50),
        ),
        migrations.AddField(
            model_name='usuario',
            name='cedula',
            field=models.IntegerField(default=''),
        ),
        migrations.AddField(
            model_name='usuario',
            name='correo',
            field=models.EmailField(default='', max_length=254),
        ),
        migrations.AddField(
            model_name='usuario',
            name='nombre',
            field=models.CharField(default='', max_length=50),
        ),
        migrations.DeleteModel(
            name='Campo',
        ),
    ]
