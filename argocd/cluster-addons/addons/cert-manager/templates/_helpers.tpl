{{- define "cert-manager.crds" -}}
{{ .Files.Get "https://github.com/cert-manager/cert-manager/releases/download/{{ .Values.crdsVersion }}/cert-manager.crds.yaml" | fromYaml }}
{{- end -}}
