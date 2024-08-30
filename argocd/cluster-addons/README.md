# Cluster "add-ons"

This directory contains a wrapper "app-of-apps" helm chart and ArgoCD `ApplicationSet` to deploy one such "app-of-apps to each cluster. The helm chart consists simply of several ArgoCD `Application`s, defined in the `templates` dir. Each of these `Application`s refers to the relevant dir under `addons` which contains the actual recipe to deploy that addon - whether using Helm, kustomize or otherwise.

`addons-applicationset.yaml` defines the ApplicationSet.

Clusters are configured in the `cluster-config` dir.

Each addon (e.g. `cert-manager`) is found in its own dir under `addons`, and refered to by an Argo `Application`.

Example structure:

```
├── Chart.yaml
├── README.md
├── addons                            <-- Installation recipes for each addon - helm, kustomize etc
│   └── cert-manager
│       ├── Chart.yaml
│       └── templates
│           ├── issuer.yaml
│           └── kustomization.yaml
├── addons-applicationset.yaml        <-- ApplicationSet definition
├── cluster-config                    <-- Configuration for each cluster
│   └── nonprod-us-east1
│       └── config.json
└── templates                         <-- ArgoCD "Application" for each addon, refers to to "addons" dir
    └── cert-manager.yaml
```