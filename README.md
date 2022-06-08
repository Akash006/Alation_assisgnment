# Alation_assisgnment

## Prerequisite
1. **Minikube** - I've used minikube in a VM with docker drivers
2. **Helm**
3. **curl**

## Steps to reproduce
1. Clone the solution
    > git clone https://github.com/Akash006/Alation_assisgnment.git
2. Start the minikube cluster
    > minikube start --driver=docker --nodes=3

3. Get into the cloned dir
    > cd Alation_assisgnment
    
    ```
    [centos@centos7 Alation_assisgnment]$ ls
    docker  helm  README.md
    ```
4. Update the required fields in *value.yaml* at the location *helm/value.yaml*

5. Install application using below command
    ### syntax
    > helm install \<app_name\> ./helm -n \<namespace\>
    ### Example:
    > helm install mywebapp ./helm -n default
    ### Output
    ```
    [centos@centos7 Alation_assisgnment]$ helm install mywebapp ./helm -n default
    NAME: mywebapp
    LAST DEPLOYED: Wed Jun  8 12:18:36 2022
    NAMESPACE: default
    STATUS: deployed
    REVISION: 1
    TEST SUITE: None
    NOTES:
    Thank you for installing aliation web app.

    Your release is named mywebapp.

    To learn more about the release, try:

    $ helm status mywebapp
    $ helm get all mywebapp
    [centos@centos7 Alation_assisgnment]$ kubectl get pods
    NAME                     READY   STATUS    RESTARTS   AGE
    my-dep-d57d86fdc-bpt6w   1/1     Running   0          9s
    my-dep-d57d86fdc-t6fff   1/1     Running   0          9s
    redis                    1/1     Running   0          10s
    ```
6. Verify the deployment
   ```
   [centos@centos7 Alation_assisgnment]$ kubectl get pods
    NAME                     READY   STATUS    RESTARTS   AGE
    my-dep-85597b48d-9plr5   1/1     Running   0          2m30s
    my-dep-85597b48d-zvflb   1/1     Running   0          2m30s
    redis                    1/1     Running   0          2m30s
    [centos@centos7 Alation_assisgnment]$ kubectl get svc
    NAME         TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)          AGE
    kubernetes   ClusterIP      10.96.0.1       <none>         443/TCP          3d21h
    lb-svc       LoadBalancer   10.97.6.169     <pending>   5000:31987/TCP   3m3s
    redis        ClusterIP      10.101.209.60   <none>         6379/TCP         3m3s
   ```
7. Verify application
    > curl $(minikube service lb-svc --url)
    ```
    [centos@centos7 Alation_assisgnment]$ curl $(minikube service lb-svc --url)
    Hola! we have hit 1 times
    [centos@centos7 Alation_assisgnment]$ curl $(minikube service lb-svc --url)
    Hola! we have hit 2 times
    [centos@centos7 Alation_assisgnment]$
    ```

# Bonus questions
1. Brief summary of what you liked about your solution
    ```
    😅 Finally working prototype is ready
    🚩 Option to update the replicaset
    💡 Option to update image and tags
    🎈 Image customization option.
    ```
2. Briefly summarize of what you disliked about your solution
    ```
    😟 There are lot of things which could be done in a better way as per the industry standards.
    🚀 Can give more customization option in value.yaml file like:
        - resources
        - image pull policy
        - Option for Load Balancer IP
        - etc etc
    🌋 Redis can also be deployed as deployemnt and can have replications but as I'm using minikube it has some limitation with storage class. So won't be able to implement that in this solution.
    🔥 More comments must be added to enhance readability.
    ```
