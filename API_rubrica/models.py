from django.db import models
from django.contrib.auth.models import AbstractBaseUser,BaseUserManager
import datetime

class User(AbstractBaseUser):

    username = None
    cedula = models.IntegerField(default=0)
    nombre = models.CharField(max_length=50,default='')
    correo = models.EmailField(primary_key=True)

    USERNAME_FIELD = 'correo'
    REQUIRED_FIELDS = [ 'date_of_birth','name' ]

    def __str__(self):              # __unicode__ on Python 2
        return self.correo
        
     objects = UserManager()