{{/* --- MYSQL --- */}}

{{- define "helm.MysqlName" -}}
{{- printf "%s-statefulset" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helm.MysqlLabels" -}}
app: db
tier: database
{{- end -}}

{{- define "helm.SvcMysqlLabels" -}}
service: db
tier: database
{{- end -}}

{{- define "helm.MysqlServiceName" -}}
{{- printf "%s-svc" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* --- BACKEND --- */}}

{{- define "helm.BackendName" -}}
{{- printf "%s-deployment" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helm.BackendLabels" -}}
app: be
tier: backend
{{- end -}}

{{- define "helm.BackendServiceName" -}}
{{- printf "%s-svc" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helm.SvcBackendLabels" -}}
service: backend
tier: service
{{- end -}}


{{/* --- FRONTEND --- */}}

{{- define "helm.FrontendName" -}}
{{- printf "%s-deployment" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helm.FrontendLabels" -}}
app: fe
tier: Frontend
{{- end -}}

{{- define "helm.FrontendServiceName" -}}
{{- printf "%s-svc" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helm.SvcFrontendLabels" -}}
service: Frontend
tier: service
{{- end -}}


{{/* --- COMMON --- */}}

{{- define "helm.MysqlHost" -}}
{{- printf "%s-svc-mysql.%s.svc.cluster.local" .Chart.Name .Release.Namespace -}}
{{- end -}}

{{- define "helm.BackendHost" -}}
{{- printf "%s-svc-backend.%s.svc.cluster.local" .Chart.Name .Release.Namespace -}}
{{- end -}}

{{- define "helm.LabelsconfigMap" -}}
app: configmap
tier: common
{{- end -}}

{{- define "helm.LabelsSecrets" -}}
app: secret
tier: common
{{- end -}}

{{- define "helm.PvName" -}}
{{- printf "%s-pv-01" .Chart.Name -}}
{{- end -}}

{{- define "helm.PvNameLabels" -}}
app: persistent_volume
tier: common
{{- end -}}