terraform {
  required_version = "~> 0.12" #cannot contain interpolations. Means requiered version >= 0.12 and < 0.13
}

#-----------------------------------------
# Default provider: Kubernetes
#-----------------------------------------

provider "kubernetes" {
  #Context to choose from the config file.
  config_context = "minikube"
  version = "~> 1.12"
}

#-----------------------------------------
# KUBERNETES DEPLOYMENT LUNA API APP
#-----------------------------------------

resource "kubernetes_deployment" "lunaapi" {
    metadata {
        name = "luna-api"
        labels = {
            app   = "lunaapi"
        } //labels
    } //metadata
    
    spec {
        selector {
            match_labels = {
                app   = "lunaapi"
            } //match_labels
        } //selector

        #Number of replicas
        replicas = 3

        #Template for the creation of the pod
        template { 
            metadata {
                labels = {
                    app   = "lunaapi"
                } //labels
            } //metadata

            spec {
                container {
                    image = "jaimesan/luna:v1"   #Docker image name
                    name  = "lunaapi"          #Name of the container specified as a DNS_LABEL. Each container in a pod must have a unique name (DNS_LABEL).
                    
                    #Block of string name and value pairs to set in the container's environment
                    env { 
                        name = "lunaapi"
                    } //env
                    
                    #List of ports to expose from the container.
                    port { 
                        container_port = 8000
                    }//port          
                    
                    resources {
                        limits {
                            cpu    = "0.5"
                            memory = "512Mi"
                        } //limits
                        requests {
                            cpu    = "250m"
                            memory = "50Mi"
                        } //requests
                    } //resources
                } //container
            } //spec
        } //template
    } //spec
} //resource

#-------------------------------------------------
# KUBERNETES DEPLOYMENT LUNA API SERVICE NODE PORT
#-------------------------------------------------

resource "kubernetes_service" "luna-api-service" {
  metadata {
    name = "luna-api-service-np"
  } //metadata
  spec {
    selector = {
      app = "color"
    } //selector
    session_affinity = "ClientIP"
    port {
      port      = 8000 
      node_port = 8000
    } //port
    type = "NodePort"
  } //spec
} //resource