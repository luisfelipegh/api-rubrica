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
    cedula = models.IntegerField(default=0)
    nombre = models.CharField(max_length=50,default='')
    correo = models.EmailField(primary_key=True)
    def __str__(self):
        return self.correo

class Rubrica(models.Model):
    nombre =  models.CharField(max_length=50,default='')
    semestre = models.IntegerField(default=getSemester(datetime.now())) 
    json = jsonfield.JSONField()


    