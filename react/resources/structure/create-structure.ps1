Write-Host "Iniciando creacion de estructura del proyecto..." -ForegroundColor Green

# Verificar si estamos en el directorio correcto
if (-not (Test-Path "package.json")) {
    Write-Host "Ejecuta este script en la raiz del proyecto frontend_web" -ForegroundColor Red
    exit
}

Write-Host "Creando estructura de carpetas..." -ForegroundColor Yellow

# Crear directorios
$dirs = @(
    # Assets
    "src/assets/images/logos",
    "src/assets/images/icons", 
    "src/assets/images/backgrounds",
    "src/assets/icons/svg",
    "src/assets/fonts",
    
    # Types
    "src/types",
    
    # Utils
    "src/utils/constants",
    "src/utils/helpers",
    "src/utils/hooks",
    
    # Data Layer
    "src/data/repositories",
    "src/data/sources/local",
    "src/data/sources/remote/api",
    "src/data/sources/remote/models",
    
    # Domain Layer  
    "src/domain/entities",
    "src/domain/repositories",
    "src/domain/useCases/auth",
    "src/domain/useCases/userLocal",
    
    # Presentation Layer
    "src/presentation/components",
    "src/presentation/hooks", 
    "src/presentation/theme",
    "src/presentation/views/home",
    "src/presentation/views/profile/info",
    "src/presentation/views/register",
    
    # Public (NUEVO)
    "public"
)

foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "  [DIR] $dir" -ForegroundColor Green
    }
}

Write-Host "`nCreando archivos..." -ForegroundColor Yellow

# Lista simple de archivos (solo los que agregamos nosotros)
$files = @(
    # Environment Files (agregados por nosotros)
    ".env",
    ".env.development", 
    ".env.example",
    ".env.production",
    
    # Config Files (agregados por nosotros)
    ".prettierrc",
    
    # Assets
    "src/assets/images/logos/app-logo.png",
    "src/assets/images/icons/default-user.png", 
    "src/assets/images/backgrounds/auth-bg.jpg",
    "src/assets/icons/svg/home-icon.svg",
    "src/assets/icons/svg/user-icon.svg",
    "src/assets/icons/svg/settings-icon.svg",
    "src/assets/fonts/README.md",
    
    # Types
    "src/types/global.d.ts",
    
    # Utils - Constants
    "src/utils/constants/app.ts",
    "src/utils/constants/api.ts", 
    "src/utils/constants/storage.ts",
    "src/utils/constants/validation.ts",
    
    # Utils - Helpers
    "src/utils/helpers/formatters.ts",
    "src/utils/helpers/validators.ts",
    "src/utils/helpers/http.ts",
    
    # Utils - Hooks
    "src/utils/hooks/useLocalStorage.ts",
    
    # Data Layer
    "src/data/repositories/AuthRepository.ts",
    "src/data/repositories/UserLocalRepository.ts",
    "src/data/sources/local/LocalStorage.ts", 
    "src/data/sources/remote/api/ApiDelivery.ts",
    "src/data/sources/remote/models/ResponseApiDelivery.ts",
    
    # Domain Layer
    "src/domain/entities/User.ts",
    "src/domain/repositories/AuthRepository.ts",
    "src/domain/repositories/UserLocalRepository.ts",
    "src/domain/useCases/auth/LoginAuth.ts",
    "src/domain/useCases/auth/RegisterAuth.ts", 
    "src/domain/useCases/userLocal/GetUserLocal.ts",
    "src/domain/useCases/userLocal/RemoveUserLocal.ts",
    "src/domain/useCases/userLocal/SaveUserLocal.ts",
    
    # Presentation Layer
    "src/presentation/components/CustomTextInput.tsx",
    "src/presentation/components/RoundedButton.tsx",
    "src/presentation/hooks/useUserLocal.ts",
    "src/presentation/theme/AppTheme.ts",
    "src/presentation/views/home/Home.tsx",
    "src/presentation/views/home/Styles.ts",
    "src/presentation/views/home/ViewModel.ts",
    "src/presentation/views/profile/info/ProfileInfo.tsx",
    "src/presentation/views/profile/info/ViewModel.ts",
    "src/presentation/views/register/Register.tsx",
    "src/presentation/views/register/Styles.ts",
    "src/presentation/views/register/ViewModel.ts",
    
    # Public files (NUEVO)
    "public/favicon.ico",
    "public/manifest.json",
    "public/robots.txt",
    "public/social-image.png",
    "public/vite.svg"
)

foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        $dirPath = Split-Path $file -Parent
        if (-not (Test-Path $dirPath)) {
            New-Item -ItemType Directory -Path $dirPath -Force | Out-Null
        }
        
        # Archivos vacíos sin contenido
        Set-Content -Path $file -Value ""
        Write-Host "  [FILE] $file" -ForegroundColor Cyan
    }
}

Write-Host "`nEstructura creada exitosamente!" -ForegroundColor Green
Write-Host "`nEstructuras incluidas:" -ForegroundColor Magenta
Write-Host "   Environment Files    - .env, .env.*, .env.example" -ForegroundColor White
Write-Host "   Config Files         - Prettier" -ForegroundColor White
Write-Host "   src/assets/          - Recursos estaticos" -ForegroundColor White
Write-Host "   src/types/           - Tipos globales TypeScript" -ForegroundColor White
Write-Host "   src/utils/           - Utilidades y constantes" -ForegroundColor White
Write-Host "   src/data/            - Capa de datos" -ForegroundColor White
Write-Host "   src/domain/          - Logica de negocio" -ForegroundColor White
Write-Host "   src/presentation/    - Componentes UI" -ForegroundColor White
Write-Host "   public/              - Archivos publicos" -ForegroundColor White

Write-Host "`nNota: Los archivos base (vite.config.ts, tsconfig.json, etc.) vienen con la inicializacion del proyecto" -ForegroundColor Yellow

# En PowerShell de VS Code, ejecuta:
#       powershell -ExecutionPolicy Bypass -File .\create-structure.ps1
#       Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

# Luego ejecuta tu script:
#       .\create-structure.ps1
