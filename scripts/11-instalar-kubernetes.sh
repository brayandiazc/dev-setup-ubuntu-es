#!/usr/bin/env bash
set -e

# Script para instalar kubectl y minikube en Ubuntu
# Autor: Brayan Diaz C
# Fecha: 25 jun 2025

echo "☸️  Iniciando instalación de herramientas Kubernetes (kubectl + minikube)..."

### --- INSTALAR kubectl ---
KUBECTL_VERSION="v1.30.1"

echo ""
echo "📥 [1/6] Descargando kubectl versión ${KUBECTL_VERSION}..."
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

echo "🔐 [2/6] Dando permisos de ejecución a kubectl..."
chmod +x kubectl

echo "📂 Moviendo kubectl a /usr/local/bin..."
sudo mv kubectl /usr/local/bin/

echo "✅ Verificando instalación de kubectl..."
kubectl version --client --short

### --- INSTALAR minikube ---
echo ""
echo "📥 [3/6] Descargando Minikube..."
curl -LO "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"

echo "🔐 [4/6] Dando permisos de ejecución a minikube..."
chmod +x minikube-linux-amd64

echo "📂 Moviendo minikube a /usr/local/bin/minikube..."
sudo mv minikube-linux-amd64 /usr/local/bin/minikube

echo "✅ Verificando instalación de Minikube..."
minikube version

### --- SUGERENCIA FINAL ---
echo ""
echo "🎉 [6/6] Instalación completada exitosamente."
echo "🚀 Puedes iniciar tu clúster con el siguiente comando:"
echo "    minikube start --driver=docker"
