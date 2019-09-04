from django.shortcuts import render
from django.db.models import Q
from .models import Rubrica,Campo,Usuario
from .serializers import RubricaSerializer,CampoSerializer,UsuarioSerializer
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

class CampoView(viewsets.ModelViewSet):
    queryset = Campo.objects.all() #obtener los datos de esa tabla en objetos
    serializer_class = CampoSerializer


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

    # @action(methods=['GET'],detail=False)
    # def username(self,request):
    #     usuario_list = Usuario.objects.all()
    #     param = request.GET.get("param")
    #     if param:
    #         queryset = usuario_list.filter(Q(username=param))
    #     else:
    #         queryset = usuario_list
    #     serializer = UsuarioSerializer(queryset,many=True)
    #     return Response(serializer.data)

    # @action(methods=['GET'],detail=False)
    # def cod(self,request):
    #     usuario_list = Usuario.objects.all()
    #     param = request.GET.get("param")
    #     if param:
    #         queryset = usuario_list.filter(Q(cod=param))
    #     else:
    #         queryset = usuario_list
    #     serializer = UsuarioSerializer(queryset,many=True)
    #     return Response(serializer.data)

'''
# Django nos provee vistas por defecto para los metodos genrales sobre el campo id
class UsuarioView(viewsets.ModelViewSet):
    queryset = Usuario.objects.all() #obtener los datos de esa tabla en objetos
    serializer_class = UsuarioSerializer
''' 

'''
# views.APIView
# para definir vistas desde 0 como el dev las quiera 
class UsuarioView(APIView):
    #get, post, put, delete
    def get(self, request):
        queryset = Usuario.objects.all()
        serializer = UsuarioSerializer(queryset,many=True)
        return Response(serializer.data)

    def post(self, request):
        pass
'''

'''
# viewsest.ViewSet
# para definir vistas desde 0 como el dev las quiera 
class UsuarioView(viewsets.ViewSet):
    #List, create, retrieve, update, partial_update, destroy
    def list(self, request):
        queryset = Usuario.objects.all()
        serializer = UsuarioSerializer(queryset,many=True)
        return Response(serializer.data)
'''


'''
#viewsets.ModelViewSet
# para utilizar tanto la ayuda de django como especificar los metodos propios
# Obtener parametros
class UsuarioView(viewsets.ModelViewSet):
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer
    #?search=param
    #para buscar si contiene en fields
    #?ordering=-param
    #para ordenar por un field  
    filter_backends = [SearchFilter,OrderingFilter]
    search_fields = ['username','cod']

    @action(methods=['GET'],detail=False)
    def username(self,request, *args, **kwargs):
        usuario_list = Usuario.objects.all()
        param = request.GET.get("username")
        if param:
            queryset = usuario_list.filter(Q(username=param))
        else: 
            queryset = usuario_list
        serializer = UsuarioSerializer(queryset,many=True)
        return Response(serializer.data)

'''



 