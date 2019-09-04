from django.shortcuts import render
from django.db.models import Q
from .models import Rubrica,Campo,Usuario
from .serializers import RubricaSerializer,UsuarioSerializer
#REST_FRAMEWORK
from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import action, api_view
from rest_framework.filters import SearchFilter,OrderingFilter

'''
Con las views definiremos que queremos que pase
dependiedno del tipo de request que nos hagan 
GET, POST, PUT, DELETE
'''

# Create your views here.
class RubricaView(viewsets.ModelViewSet):
    queryset = Rubrica.objects.all() #obtener los datos de esa tabla en objetos
    serializer_class = RubricaSerializer

class UsuarioView(viewsets.ViewSet):
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer
    global campos
    campos = ['id','cod','username']

    def list(self,request,*args, **kwargs):
        usuario_list = Usuario.objects.all() 
        query = request.META['QUERY_STRING']

        if query:
            campo = query[:query.index('=')]
            param = request.GET.get(campo)   
            if param and campo in campos:
                # queryset = usuario_list.filter(exec("%s=param" % campo))
                if campo == "username":
                    queryset = usuario_list.filter(Q(username=param))
                if campo == "cod":
                    queryset = usuario_list.filter(Q(cod=param))
                if campo == "id":
                    queryset = usuario_list.filter(Q(id=param))
            else:
                content = {"status_code": 404, "detail": "Param not found."}
                # content = {"status_code": 405, "detail": "Method 'DELETE' not allowed."}
                return Response(content, status=status.HTTP_404_NOT_FOUND)
        else: 
            queryset = usuario_list
        serializer = UsuarioSerializer(queryset,many=True)
        return Response(serializer.data)
