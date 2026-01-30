#!/bin/bash

echo "🚀 Iniciando creación de estructura del proyecto..."

# Verificar si estamos en el directorio correcto
if [ ! -f "package.json" ]; then
    echo "❌ Ejecuta este script en la raíz del proyecto frontend_web"
    exit 1
fi

echo "📁 Creando estructura de carpetas..."

# Crear directorios
dirs=(
    # Assets
    "src/assets/images/logos"
    "src/assets/images/icons" 
    "src/assets/images/backgrounds"
    "src/assets/icons/svg"
    "src/assets/fonts"
    
    # Types
    "src/types"
    
    # Utils
    "src/utils/constants"
    "src/utils/helpers"
    "src/utils/hooks"
    
    # Data Layer
    "src/data/repositories"
    "src/data/sources/local"
    "src/data/sources/remote/api"
    "src/data/sources/remote/models"
    
    # Domain Layer  
    "src/domain/entities"
    "src/domain/repositories"
    "src/domain/useCases/auth"
    "src/domain/useCases/userLocal"
    
    # Presentation Layer
    "src/presentation/components"
    "src/presentation/hooks" 
    "src/presentation/theme"
    "src/presentation/views/home"
    "src/presentation/views/profile/info"
    "src/presentation/views/register"
    
    # Public (NUEVO)
    "public"
)

for dir in "${dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo "  ✅ $dir"
    fi
done

echo ""
echo "📄 Creando archivos..."

# Lista de archivos (solo los que agregamos nosotros)
files=(
    # Environment Files (agregados por nosotros)
    ".env"
    ".env.development"
    ".env.example"
    ".env.production"
    
    # Config Files (agregados por nosotros)
    ".prettierrc"
    
    # Assets
    "src/assets/images/logos/app-logo.png"
    "src/assets/images/icons/default-user.png" 
    "src/assets/images/backgrounds/auth-bg.jpg"
    "src/assets/icons/svg/home-icon.svg"
    "src/assets/icons/svg/user-icon.svg"
    "src/assets/icons/svg/settings-icon.svg"
    "src/assets/fonts/README.md"
    
    # Types
    "src/types/global.d.ts"
    
    # Utils - Constants
    "src/utils/constants/app.ts"
    "src/utils/constants/api.ts"
    "src/utils/constants/storage.ts"
    "src/utils/constants/validation.ts"
    
    # Utils - Helpers
    "src/utils/helpers/formatters.ts"
    "src/utils/helpers/validators.ts"
    "src/utils/helpers/http.ts"
    
    # Utils - Hooks
    "src/utils/hooks/useLocalStorage.ts"
    
    # Data Layer
    "src/data/repositories/AuthRepository.ts"
    "src/data/repositories/UserLocalRepository.ts"
    "src/data/sources/local/LocalStorage.ts" 
    "src/data/sources/remote/api/ApiDelivery.ts"
    "src/data/sources/remote/models/ResponseApiDelivery.ts"
    
    # Domain Layer
    "src/domain/entities/User.ts"
    "src/domain/repositories/AuthRepository.ts"
    "src/domain/repositories/UserLocalRepository.ts"
    "src/domain/useCases/auth/LoginAuth.ts"
    "src/domain/useCases/auth/RegisterAuth.ts" 
    "src/domain/useCases/userLocal/GetUserLocal.ts"
    "src/domain/useCases/userLocal/RemoveUserLocal.ts"
    "src/domain/useCases/userLocal/SaveUserLocal.ts"
    
    # Presentation Layer
    "src/presentation/components/CustomTextInput.tsx"
    "src/presentation/components/RoundedButton.tsx"
    "src/presentation/hooks/useUserLocal.ts"
    "src/presentation/theme/AppTheme.ts"
    "src/presentation/views/home/Home.tsx"
    "src/presentation/views/home/Styles.ts"
    "src/presentation/views/home/ViewModel.ts"
    "src/presentation/views/profile/info/ProfileInfo.tsx"
    "src/presentation/views/profile/info/ViewModel.ts"
    "src/presentation/views/register/Register.tsx"
    "src/presentation/views/register/Styles.ts"
    "src/presentation/views/register/ViewModel.ts"
    
    # Public files (NUEVO)
    "public/favicon.ico"
    "public/manifest.json"
    "public/robots.txt"
    "public/social-image.png"
    "public/vite.svg"
)

for file in "${files[@]}"; do
    if [ ! -f "$file" ]; then
        # Crear directorio padre si no existe
        dir_path=$(dirname "$file")
        mkdir -p "$dir_path"
        
        # Crear archivo vacío sin contenido
        touch "$file"
        echo "  📄 $file"
    fi
done

echo ""
echo "✅ Estructura creada exitosamente!"
echo ""
echo "📁 Estructuras incluidas:"
echo "   🌐 Environment Files    - .env, .env.*, .env.example"
echo "   ⚙️  Config Files        - Prettier"
echo "   📸 src/assets/          - Recursos estáticos"
echo "   📊 src/types/           - Tipos globales TypeScript"
echo "   🔧 src/utils/           - Utilidades y constantes"
echo "   📊 src/data/            - Capa de datos"
echo "   🏗️  src/domain/          - Lógica de negocio" 
echo "   🎨 src/presentation/    - Componentes UI"
echo "   🌐 public/              - Archivos públicos"
echo ""
echo "💡 Nota: Los archivos base (vite.config.ts, tsconfig.json, etc.) vienen con la inicialización del proyecto"

# Dar permisos de ejecución
#       chmod +x create-structure.sh

# Ejecutar el script
#       ./create-structure.sh