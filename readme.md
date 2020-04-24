# AWS EKS kubectl config updater

The AWS EKS update-kubeconfig command does a terrible job in updating your kubectl configuration file when your using
the same cluster for multiple roles and namespaces like we do for access authorization. This script will update your
kubectl config file for use with AWS EKS per role/namespace.

## Requirements

You need at least Python 3.

Install the following Python packages:

```bash
pip3 install pyyaml boto3
```

## Install

To install the script, use the following command:

MacOS:

```bash
curl -o /usr/local/bin/kubectl-updater-aws https://raw.githubusercontent.com/xip-online-applications/kubectl-updater-aws/master/kubectl-updater-aws; chmod +x /usr/local/bin/kubectl-updater-aws 
```

Linux:

```bash
curl -o /usr/bin/kubectl-updater-aws https://raw.githubusercontent.com/xip-online-applications/kubectl-updater-aws/master/kubectl-updater-aws; chmod +x /usr/bin/kubectl-updater-aws
```

## Usage

Use the command in the following way:

```bash
kubectl-updater-aws -c <cluster_name>
```

It supports the following arguments:

| Argument  | Shortcut | Required | Description | Default |
|-----------|----------|----------|-------------|---------|
| --cluster | -c | &check; | The cluster name to use | |
| --role-arn | -r | | The role ARN to assume | |
| --config-file | -f | | The kubectl config file to use | ~/.kube/config |
| --namespace | -n | | The namespace to authenticate with | |
| --aws-profile | -p | | The AWS profile to use | |

## Examples

Connect with role and namespace:

```bash
kubectl-updater-aws -c test -r arn:aws:iam::123456789:role/test-application-role -n test-application-namespace
```

Connect with namespace only:

```bash
kubectl-updater-aws -c prod -n prod-namespace
```
