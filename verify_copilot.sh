#!/bin/bash

# 🚀 SCRIPT DE VERIFICAÇÃO - GitHub Copilot Android Studio
# Este script verifica se tudo está configurado corretamente

echo "🔍 VERIFICANDO CONFIGURAÇÃO DO GITHUB COPILOT..."
echo "================================================"

# Verificar se Android Studio está instalado
echo "1. Verificando Android Studio..."
if command -v studio.sh &> /dev/null || [ -d "/opt/android-studio" ] || [ -d "$HOME/android-studio" ]; then
    echo "✅ Android Studio encontrado"
else
    echo "❌ Android Studio não encontrado"
    echo "   → Instale o Android Studio primeiro"
fi

# Verificar conexão com internet
echo ""
echo "2. Verificando conexão com internet..."
if ping -c 1 github.com &> /dev/null; then
    echo "✅ Conexão com internet OK"
else
    echo "❌ Sem conexão com internet"
    echo "   → Verifique sua conexão"
fi

# Verificar se Git está configurado
echo ""
echo "3. Verificando configuração do Git..."
if git config user.name &> /dev/null && git config user.email &> /dev/null; then
    echo "✅ Git configurado"
    echo "   Nome: $(git config user.name)"
    echo "   Email: $(git config user.email)"
else
    echo "⚠️  Git não configurado completamente"
    echo "   → Configure com: git config --global user.name 'Seu Nome'"
    echo "   → Configure com: git config --global user.email 'seu@email.com'"
fi

# Verificar se o projeto Android está OK
echo ""
echo "4. Verificando projeto Android..."
if [ -f "build.gradle" ] && [ -f "gradlew" ]; then
    echo "✅ Projeto Android válido encontrado"
else
    echo "❌ Projeto Android não encontrado"
    echo "   → Execute este script na pasta do projeto Android"
fi

# Verificar permissões do gradlew
echo ""
echo "5. Verificando permissões..."
if [ -x "gradlew" ]; then
    echo "✅ Permissões do gradlew OK"
else
    echo "⚠️  Corrigindo permissões do gradlew..."
    chmod +x gradlew
    echo "✅ Permissões corrigidas"
fi

echo ""
echo "================================================"
echo "🎯 PRÓXIMOS PASSOS:"
echo "1. Abra o Android Studio"
echo "2. Vá em File → Settings → Plugins"
echo "3. Procure por 'GitHub Copilot'"
echo "4. Instale e reinicie"
echo "5. Faça login com sua conta GitHub"
echo ""
echo "📖 Guia completo: install_copilot_guide.md"
echo "================================================"