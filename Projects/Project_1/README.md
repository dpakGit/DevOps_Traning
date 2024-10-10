# **Challenge in accessing an application running inside a cluster**
Pods within a Kubernetes cluster are ephemeral, frequently destroyed and recreated, and may not return to the same node.
As a result, their IP addresses change, making it difficult for end-users to consistently access applications or containers running within the pods.
**Kubernetes Service Objects:** A Solution to this problem, providing a reliable and persistent entry point for accessing pod-based applications.

# **Objective:**
 The following project demonstrates the use of Kubernetes NodePort Service and ClusterIP Service to access a container running inside a Kubernetes cluster by the end user and simultaneously providing inter cluster communication between pods using ClusterIP Service.  

 The following link contains the required file and folders to execute the project : https://github.com/Deepakranjanmishra/serviceDemo

# **Project Overview:**
This project demonstrates expertise in Kubernetes service deployment, containerization, and microservices architecture.

### Diagram

![image](https://github.com/user-attachments/assets/1374e7b9-4c5e-40a8-9341-677039d71139)


### Deployment:

The solution comprises two pods:
- Pod-1: Houses a Python frontend application and a Redis cache database within two separate containers.
- Pod-2: Dedicated MySQL database pod.

### Kubernetes Service Deployment Strategy:

To enable seamless communication between containers and external users, this project employs two Kubernetes services:

NodePort Service:

- Exposure: Exposes Pod-1 (Python frontend application and Redis cache database) to external access.
- Access: Enables external users to interact with the Python frontend application.
- Configuration: Maps a container port to a host port, allowing incoming traffic on the specified NodePort.

ClusterIP Service:

- Inter-Cluster Communication: Facilitates communication between Pod-1 (Python frontend application) and Pod-2 (MySQL database).
- Configuration: Allocates a cluster-internal IP address, enabling Pod-1 to access Pod-2.


### API Functionality:
The Python frontend application features three APIs:

1)	Initialization API:  Creates a user table in the MySQL database
2)	Add User API:    Adds user details to the MySQL database
3)	Get User API:   Retrieves user details, leveraging Redis cache for reducing latency.


As soon as from the end user we use an Init API, the python container inside Pod-1 via Cluster IP Service will connect to the MySQL container in Pod -2 and will create a User Table in Pod-2.

By using the Add User API we will pass User detail like User ID, User name, etc.
Here also the python container will connect to Pod-2 using the Cluster IP Service and add the user details to the table.

In order to get a User details, we will use the Get User API.
Suppose we to check the details of a User with ID = 1.
    Once this request comes to the python container, first of all it will connect to the Redis container and        check whether the details of user-1 are available or not. If the details are not available in the Redis database, in that case the Python Container will connect to the MySQL Database Pod, fetch the user details, add that to the Redis Cache and then it will respond it back to the user.

Caching Mechanism:
The Redis cache database stores user data for a specified period. Subsequent requests for the same data are served directly from the cache, reducing latency and optimizing performance.







# **Technical Skills Demonstrated:**

- Kubernetes (NodePort and ClusterIP Services)
- Containerization (Docker)
- Microservices Architecture
- Python
- MySQL
- Redis
- API Design

# **Outcomes:**

- Enabling external traffic to containerized services within the cluster
- Scalable backend architecture
- Efficient inter-cluster communication
- Enhanced performance through caching
- Demonstrated expertise in Kubernetes and microservices deployment




