# luna-test
Ejercicio de despliegue de aplicación 

Para ejecutar el despliegue se requiere tener en el sistema instalado:
- [ ] Docker
- [ ] minikube
- [ ] kubernetes
- [ ] terraform

Para levantar la aplicacion desde Docker solo requiere clonar este repo y ejecutar sobre la raiz de el proyecto el siguiente comando:

### `docker apply -f deployment.yml`

para acceder a la aplicacion se debe conectar al:

### `localhost:8000`

para entrar al area administrativa debe utilizar:
###### `localhost:8000/admin/`

user: `admin`
> password: `password123`

para realizar los llamados se agrego un script que se encuentra en la carpeta:

`scripts/send_data.sh`

el cual utiliza un llamado GET de la siguiente sintaxis:
###### 
```
curl -u admin:password123 -X GET http://127.0.0.1:8000/catalogo/recapcion_productos_catalogo/sku/{$sku}/name/{$name}/brand/{$brand}/model/{$model}/price/{$price}/description/{$cambia_es}/
```

Para ejecutar el despliegue desde terraform:

### `terraform apply`
