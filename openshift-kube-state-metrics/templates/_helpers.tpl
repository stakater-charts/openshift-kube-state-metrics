{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "openshift-kube-state-metrics.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "openshift-kube-state-metrics.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "openshift-kube-state-metrics.labels.selector" -}}
app: {{ template "openshift-kube-state-metrics.name" . }}
group: {{ .Values.kubeStateMetrics.labels.group }}
provider: {{ .Values.kubeStateMetrics.labels.provider }}
{{- end -}}

{{- define "openshift-kube-state-metrics.labels.stakater" -}}
{{ template "openshift-kube-state-metrics.labels.selector" . }}
version: "{{ .Values.kubeStateMetrics.labels.version }}"
{{- end -}}

{{- define "openshift-kube-state-metrics.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
