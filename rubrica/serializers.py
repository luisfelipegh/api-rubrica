from rest_framework import serializers
from .models import Rubrica,Usuario
'''
Los serializers se utilizan para devolver los modelos 
en formato que se pueda enviar por http en este caso 
como es un REST API es json

Ayuda realizar las funciones basicas gsobre todos los registros 
GET POST PUT DELETE  sobre el parametro unico y por defecto de Django  id
'''
class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = ('id','url','cedula','nombre','correo') #id and url are default parameters from django 
        # fields ="__all__"

        
class RubricaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rubrica
        fields = ('id','url','semestre','json','nombre') 
