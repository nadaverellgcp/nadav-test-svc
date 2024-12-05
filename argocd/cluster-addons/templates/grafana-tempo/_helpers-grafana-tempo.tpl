{{- /*
Auto generated file by koala 1.0.0 YOU ARE ADVISED NOT TO EDIT MANUALLY
*/}}
{{- define "addon.v1.grafanaTempo.authSecretName" -}}
{{- if .Values.grafanaTempoAddon.valuesObject.secretName -}}
{{- .Values.grafanaTempoAddon.valuesObject.secretName -}}
{{- else -}}
tempo-gw-auth
{{- end -}}
{{- end -}}


{{- define "addon.v1.grafanaTempo.sourceAuthSecretName" -}}
{{- $authSecretName := include "addon.v1.grafanaTempo.authSecretName" . -}}
{{- printf "%s-source" $authSecretName -}}
{{- end -}}

{{- define "addon.v1.grafanaTempo.tlsSecretName" -}}
{{- if .Values.grafanaTempoAddon.valuesObject.ingress.tlsSecretName -}}
{{- .Values.grafanaTempoAddon.valuesObject.ingress.tlsSecretName -}}
{{- else -}}
grafana-tempo-gw-tls-cert-{{ .Release.Name }}
{{- end -}}
{{- end -}}

{{/*
Looks if there's an existing secret and reuse its user. If not it generates
new user and use it.
*/}}
{{- define "addon.v1.grafanaTempo.username" -}}
{{- $secret := (lookup "v1" "Secret" "{{destination.namespace}}" (include "addon.v1.grafanaTempo.sourceAuthSecretName" .) ) }}
{{- if $secret }}
{{- $user := index $secret "data" "user" }}
{{$user}}
{{- else }}
{{- $user := (randAlphaNum 40) }}
{{- $user}}
{{- end }}
{{- end }}


{{- define "addon.v1.grafanaTempo.defaultPreset"}}enabled: true
fullnameOverride: tracing-tempo
traces:
  otlp:
    grpc:
      enabled: true
{{- end}}