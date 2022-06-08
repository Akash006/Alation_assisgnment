{{/* Crate Redis Image URL */}}
{{- define "redis-image-url" -}}
{{- if .Values.redis.image.name -}}
{{- printf "%s:%s" .Values.redis.image.name .Values.redis.image.tag -}}
{{ else }}
    {{ fail "Image name and tag is mendatory" }}
{{- end -}}
{{- end -}}
