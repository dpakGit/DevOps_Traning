Simplify Application Deployment and Management with Helm Charts!  ( See the diagram ) : https://medium.com/@agheelnair/simplify-application-deployment-and-management-with-helm-charts-da62428877fb#:~:text=helm%20install%20myapp%20.%2Fmyapp%2D,care%20of%20it%20for%20you!

https://helm.sh/docs/

Charts contain a Chart.yaml file as well as templates, default values (values.yaml), and dependencies.

The Chart Best Practices Guide : https://v2-14-0.helm.sh/docs/chart_best_practices/

#### Create Your First Helm Chart ( VMWARE ): https://docs.vmware.com/en/VMware-Tanzu-Application-Catalog/services/tutorials/GUID-create-first-helm-chart-index.html (use the digram to do a project on helm)


### **Helm Install Command**


Helm is a package manager for Kubernetes, and the `helm install` command is used to install a chart (a packaged application) into a Kubernetes cluster.

The basic syntax of the `helm install` command is:
```
helm install [RELEASE_NAME] [CHART_NAME]
```
Here:

- `RELEASE_NAME` is the name you want to give to the released application
- `CHART_NAME` is the name of the chart you want to install

For example:
```
helm install my-app my-chart
```
This command installs the `my-chart` chart and names the released application `my-app`.

You can also specify additional options and values, such as:

- `--set`: sets a specific configuration value
- `--values`: specifies a YAML file with configuration values
- `--namespace`: installs the chart in a specific namespace
- `--version`: specifies a specific version of the chart

Here's an example with some additional options:
```
helm install my-app my-chart --set server.port=8080 --values values.yaml --namespace my-ns --version 1.2.3
```
This command installs the `my-chart` chart with specific configuration values, in the `my-ns` namespace, and with version `1.2.3`.

The `helm install` command also supports other options and flags, such as `--dry-run` for testing the installation without applying it, and `--debug` for enabling debug logging.


### **Helm Template Command**



The Helm template command is used to render a chart's templates without installing the chart. It allows you to preview the generated Kubernetes resources (YAML files) that would be created by the chart, without actually deploying them to a cluster.

The basic syntax of the Helm template command is:
```
helm template [RELEASE_NAME] [CHART_NAME]
```
Here:

- `RELEASE_NAME` is the name you want to give to the released application (optional)
- `CHART_NAME` is the name of the chart you want to render

For example:
```
helm template my-app my-chart
```
This command renders the templates in the `my-chart` chart, using the default values, and outputs the generated YAML files to the console.

You can also specify additional options and flags, such as:

- `--set`: sets a specific configuration value
- `--values`: specifies a YAML file with configuration values
- `--namespace`: specifies the namespace for the resources
- `--output-dir`: outputs the generated YAML files to a specific directory

Here are some examples:

- `helm template my-app my-chart --set server.port=8080`: renders the templates with a specific configuration value
- `helm template my-app my-chart --values values.yaml`: renders the templates with configuration values from a YAML file
- `helm template my-app my-chart --namespace my-ns`: renders the templates with resources in a specific namespace
- `helm template my-app my-chart --output-dir ./generated`: outputs the generated YAML files to a specific directory

The Helm template command is useful for debugging and testing charts, and for generating Kubernetes resources without actually deploying them.




