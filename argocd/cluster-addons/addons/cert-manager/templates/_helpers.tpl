{{- define "cert-manager.crds" -}}
https://github.com/cert-manager/cert-manager/releases/download/{{ .Values.crdsVersion }}/cert-manager.crds.yaml
{{- end -}}
