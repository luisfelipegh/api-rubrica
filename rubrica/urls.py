from django.urls import path, include
from . import views
from rest_framework import routers

'''
El router genera todas la urls para la collection 
le pasamos el endpoint
'''
router = routers.DefaultRouter()
router.register('auth',views.RubricaView)


router.register('usuarios',views.UsuarioView, base_name='usuario')
router.register('rubricas',views.RubricaView)


urlpatterns = [
     path('',include(router.urls))
] 
