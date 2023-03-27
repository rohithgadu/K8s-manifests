
# Kubernetes

Task 3. Kubernetes.
- Use the application that you created in task #1 or task #2. Create dockerfiles and build docker images. Create kubernetes yaml manifests for the application (at least a deployment and a service). It’s ok to expose the application with a LoadBalancer or NodePort service or with an ingress. Spin up a single-node local Kubernetes cluster (Docker Desktop, Kind or Minikube) or use a managed cluster like EKS, AKS, GKE etc. Deploy MongoDB to the cluster (it’s ok to use a community helm chart for this, any other approach is fine as well). Then deploy the application to the cluster by applying your manifests. 
- The following requirements should be fulfilled:
  - you can bring your application up by applying your yaml manifests
    mongodb is running in a separate pod
  - the application should take mongo connection details from the environment variables
  - the app endpoints should be available from your host machine
  - a persistent volume should be used to store the MongoDB data. I.e., when you delete the MongoDB pod the records in the db should not disappear.

## Docker
  - The Dockerfile in this repo is for the project built in task 1.
  - Task 1 repo link: https://github.com/rohithgadu/java-rest-api 
  - The docker image is built and then pushed to the docker hub. 

  ```bash
    docker pull rohithgadu/taskdockerimage:latest
  ```
  - Before running the docker image make sure you have mongo image on your system.
  - The port 8090 is exposed in the taskdockerimage.
  - While running the taskdockerimage pass the environment variables DATABASE_HOST and DATABASE_PORT.
  - Or else run this docker-compose.yaml file:
  ```yaml
    services:
      taskmongo:
        image: mongo:latest
        ports:
          - "27017:27017"
      taskdockerimage:
        image: rohithgadu/taskdockerimage
        container_name: "taskdockerimage"
        ports:
          - "8090:8090"
        environment:
          - DATABASE_HOST= taskmongo
          - DATABASE_PORT= 27017  
        links:
          - taskmongo

  ```
  - Access the endpoints mentioned in task 1 repo at localhost:8090.
    


## K8s Manfiests 

  - For the K8s Cluster I used a single-node local Kubernetes cluster from Docker Desktop.

  - The yaml manifests in this repo are for the project built in task 1.
  - Task 1 repo link: https://github.com/rohithgadu/java-rest-api 

  - The mongo-config.yaml file contains the mongo configuration.

  - The mongo.yaml file contains Persistent Volume Claim, Deployment and Service.

  - The taskapp.yaml file contains both Deployment and Service.

  - The Volume is persistent even when you delete the MongoDB pod and the records in the db are not disappeared. 
  
  - After applying all the manifest files the app endpoints are available at localhost:8090.



    
