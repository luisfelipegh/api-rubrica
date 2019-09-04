from django.db import models
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
    cod = models.IntegerField() 
    username = models.CharField(max_length=50)  
    def __str__(self):
        return self.username

class Campo(models.Model):
    nombre =  models.CharField(max_length=50)  
    porcentaje = models.FloatField()
    def __str__(self):
        return self.nombre 

class Rubrica(models.Model):
    semestre = models.IntegerField(default=getSemester(datetime.now())) 
    campos = models.ManyToManyField(Campo)
    usuario = models.ForeignKey(Usuario,on_delete=models.CASCADE)


    