# Notes

## How do Docker and `docker compose` work?
### Docker
Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure
so you can deliver software quickly.

Docker provides the ability to package and run an application in a loosely isolated environment called a container. The isolation and security lets
you run many containers simultaneously on a given host. Containers are lightweight and contain everything needed to run the application, so you don't
need to rely on what's installed on the host. You can share containers while you work, and be sure that everyone you share with gets the same container
that works in the same way.

### `docker compose`
Docker Compose is a tool for defining and running multi-container applications. It is the key to unlocking a streamlined and efficient development and
deployment experience.
Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file. Then, with a single command, you create and start all the services from your configuration file.

Using Docker Compose offers several benefits that streamline the development, deployment, and management of containerized applications:
- Simplified control: it allows you to define and manage multi-container applications in a single YAML file. This simplifies the complex task of
orchestrating and coordinating various services, making it easier to manage and replicate your application environment.
- Efficient collaboration: its configuration files are easy to share, facilitating collaboration among developers, operations teams, and other stakeholders.
This collaborative approach leads to smoother workflows, faster issue resolution, and increased overall efficiency.
- Rapid application development: it caches the configuration used to create a container. When you restart a service that has not changed, Compose re-uses the existing containers. Re-using containers means that you can make changes to your environment very quickly.
- Portability across environments: it supports variables in the Compose file. You can use them to customize your composition for different environments, or different users.
- Extensive community and support: it benefits from a vibrant and active community, which means abundant resources, tutorials, and support. This
community-driven ecosystem contributes to the continuous improvement of Docker Compose and helps users troubleshoot issues effectively.

## What's the difference between a Docker image used with `docker compose` and without `docker compose`?

## What's the benefit of Docker compared to VMs?


## What's the pertinence of the directory structure required for this project?


## Can you give a simple explanation of docker-network?
Container networking refers to the ability for containers to connect to and communicate with each other, or to non-Docker workloads.

Containers have networking enabled by default, and they can make outgoing connections. A container has no information about what kind of network it's
attached to, or whether their peers are also Docker workloads or not. A container only sees a network interface with an IP address, a gateway, a
routing table, DNS services, and other networking details. That is, unless the container uses the none network driver.

You can create custom, user-defined networks, and connect multiple containers to the same network. Once connected to a user-defined network, containers can communicate with each other using container IP addresses or container names.
