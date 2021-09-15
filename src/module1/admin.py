from django.contrib import admin
from .models import catalogo

# Register your models here.

class catalogoModelAdmin(admin.ModelAdmin):
    list_display = ["pk", "sku", "name", "brand", "model", "price", "description"]
    list_filter = ["brand"]
    search_fields = ["sku", "name", "description"]
    class Meta:
        model = catalogo

admin.site.register(catalogo, catalogoModelAdmin)