# Wiredcraft-hello_api


[![Build Status](https://github.com/jahanxb/hello_world/)](https://github.com/jahanxb/hello_world)

#  DevOps Assestment 
- Task Accomplished 
    - Terraform
        - Terraform to create an Instance
        - Package installation via terraform 
    - Ansible playbook 
        - Package Installation   
        - Server configuration
        - Ansible playbook to install docker and minikube
        - Ansible playbook for docker-compose 
        - Ansible playbook for minikube orchestration
     - Github Action
         -  Continous Integration
            - github workflow to build image on every merge on [master] branch
            - workflow pushes image to ( dockerhub / custom_docker_registry [35.193.64.108:8080])
         - Continous Deployment 
           - To be Cont.
           - To be Cont.
     - [Dev] Python Hello_API
        - Developed a Simple API in Flask Framework to return current localtime
        - Running the API in Docker Container
# Issues / Bugs

  - Docker insecure-registries 
    - docker-registry is insecure. Docker uses https protocol for registries, since my registry is on http, docker will throw an error when we try to push the image.
>   Run docker push 35.193.64.108:5000/hello_api:v4.0
>   The push refers to repository [35.193.64.108:5000/hello_api]
>   Get https://35.193.64.108:5000/v2/: http: server gave HTTP response to HTTPS client

![Image link](https://github.com/[username]/[reponame]/blob/[branch]/image.jpg?raw=true)
- In localhost, we can add our insecure registry on github workflow and github builds and pushes the image and then pushes the image but so far, i haven't found a workable solution to add insecure-registries in github. 

- ssl certificate: To resolve this issue, i made a domain and set ssl certificate in my server through certbot. Now the image by github workflow gets accepted and it pushes the image but the image never appears on the registry, this is a known issue which i also found on github. 
[Image not showing up on docker hub despite successful push](https://github.com/moby/moby/issues/20743) - Dated. Feb 27, 2016.


### Installation
 Depending on your operating system, you will need to have these dependencies installed:
- Windows 10
    * [Terraform] - Download Terraform.exe for Windows
    * [Ansible] - Ansible works with terminal linux , use terminal for windows or MobaXterm
    * [Docker] - Install Docker on your local machine 
    * [Python] - For API Development
    * [Git] - Code merge and deployment on github


### Development
