# ========================================
# Script: safe-angular-ghpages-deploy.ps1
# Publica una app Angular 20 en GitHub Pages sin borrar tu proyecto
# Autor: ChatGPT para Albeiro Ramos
# ========================================

$projectName = "frontend_angular"
$baseHref = "/$projectName/"
$distFolder = "dist\browser"
$tempFolder = "gh-pages-temp"
$worktreeFolder = "gh-pages-branch"

Write-Host "🛠️ Iniciando build seguro..." -ForegroundColor Cyan

# Paso 1: Compilar el proyecto Angular
ng build --configuration=production --base-href $baseHref

# Verifica que el build haya sido exitoso
if (!(Test-Path $distFolder)) {
    Write-Host "❌ ERROR: No se generó $distFolder. Verifica tu build." -ForegroundColor Red
    exit 1
}

# Paso 2: Crear carpeta temporal para copiar los archivos generados
if (!(Test-Path $tempFolder)) {
    New-Item -ItemType Directory -Path $tempFolder | Out-Null
}
Copy-Item -Path "$distFolder\*" -Destination $tempFolder -Recurse -Force

# Paso 3: Crear y conectar la rama gh-pages sin borrar nada
if (!(Test-Path $worktreeFolder)) {
    git worktree add $worktreeFolder gh-pages
}

# Paso 4: Copiar los archivos al worktree
Copy-Item -Path "$tempFolder\*" -Destination $worktreeFolder -Recurse -Force

# Paso 5: Publicar a GitHub Pages
Push-Location $worktreeFolder
git add .
git commit -m "🚀 Publicación segura de Angular 20 en GitHub Pages"
git push origin gh-pages
Pop-Location

Write-Host "✅ ¡Despliegue completo!"
Write-Host "🌐 Visita: https://profealbeiro.github.io/$projectName/"