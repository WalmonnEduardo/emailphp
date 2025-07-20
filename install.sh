#!/bin/bash

# Caminho base do projeto
PROJETO_DIR="$(pwd)"

echo "📦 Instalando dependências para o PHPMailer em: $PROJETO_DIR"

# Verifica se o Composer está instalado
if ! command -v composer &> /dev/null
then
    echo "🔧 Composer não encontrado. Instalando Composer..."
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php')"
    php composer-setup.php
    sudo mv composer.phar /usr/local/bin/composer
    rm composer-setup.php
else
    echo "✅ Composer já está instalado"
fi

# Inicializa o Composer no diretório, se ainda não existir
if [ ! -f "$PROJETO_DIR/composer.json" ]; then
    echo "📄 Criando composer.json..."
    composer init --name="seu/nome" --require="phpmailer/phpmailer:^6.9" --no-interaction
fi

# Instala o PHPMailer
echo "📥 Instalando PHPMailer..."
composer require phpmailer/phpmailer

# Confirmação
echo "✅ PHPMailer instalado com sucesso!"
echo "📂 Estrutura do projeto:"
tree -L 2

echo "🚀 Agora você pode usar o autoload com:"
echo "    require_once __DIR__ . '/vendor/autoload.php';"
