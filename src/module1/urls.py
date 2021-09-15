from django.conf.urls import url, include
from .views import catalogo_input

urlpatterns = [
    url(r'^ADMIN_CONTROL/$', catalogo_input, name='admin_monitor'),
    # === API ===
    url(r'^recapcion_productos_catalogo/sku/(?P<sku>[^/]+)/name/(?P<name>[^/]+)/brand/(?P<brand>[^/]+)/model/(?P<model>[^/]+)/price/(?P<price>[^/]+)/description/(?P<description>[^/]+)/$', catalogo_input, name='catalogo_input'),
]
