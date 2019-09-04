from django.db import models
import jsonfield
from datetime import datetime

# Create your models here.

'''
ManyToOne   --> ForeignKey()
OneToOne    --> OneToOneField()
ManyToMany  --> ManyToManyField()
'''
def getSemester(now):
    year,month = now.year,now.month
    return str(year)+"2" if month>6 else str(year)+"1"

class Usuario(models.Model):
    username = models.CharField(max_length=20)  
    cedula = models.IntegerField(max_length=11)
    nombre = models.CharField(max_length=50)
    def __str__(self):
        return self.username

class Rubrica(models.Model):
    nombre =  models.CharField(max_length=50)
    semestre = models.IntegerField(default=getSemester(datetime.now())) 
    json = jsonfield.JSONField()
    usuario = models.ForeignKey(Usuario,on_delete=models.CASCADE)


    