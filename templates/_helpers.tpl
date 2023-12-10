{{/*
Expand the name of the chart.
*/}}
{{- define "daq-dranspose.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "daq-dranspose.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "daq-dranspose.labels" -}}
helm.sh/chart: {{ include "daq-dranspose.chart" . }}
{{ include "daq-dranspose.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "daq-dranspose.selectorLabels" -}}
app.kubernetes.io/name: {{ include "daq-dranspose.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



{{/*
Returns extraEnv variable for DAQ container
*/}}
{{- define "daq-dranspose.extraEnv" -}}
- name: REDIS_URL
  value: "redis://{{ .Release.Name }}-redis-master:6379/0"
- name: LOG_LEVEL
  value: {{ .Values.log_level }}
{{- end }}