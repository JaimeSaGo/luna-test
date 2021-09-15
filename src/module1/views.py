from django.contrib.auth.models import User, Group
from django.http import JsonResponse
from rest_framework import viewsets
from rest_framework import permissions
'''Agregando las librerias de los modelos '''
from module1.serializers import UserSerializer, GroupSerializer
from .models import catalogo

def catalogo_input(request, sku, name, brand, model, price, description):
    if request.method == 'GET':
        '''Este es el metodo que ingresa los datos a la base de datos'''
        description = description.replace("@", " ")
        registro = catalogo(sku=sku, name=name, brand=brand, model=model, price=price, description=description)
        registro.save()
    return JsonResponse({"message": "OK", "data": {"ValidateUserAccountResponse": {"ValidatorUserAccount": {"success": "true", "index": registro.pk, "SKU": registro.sku}}}})

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticated]