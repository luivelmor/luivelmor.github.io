# Script de despliegue para GitHub Pages
# Uso: .\deploy.ps1 "mensaje del commit"

param(
    [string]$Message = "Update website"
)

Write-Host "🚀 Iniciando despliegue..." -ForegroundColor Green

# Verificar que estamos en un repositorio git
if (-not (Test-Path ".git")) {
    Write-Host "❌ Error: No se encontró un repositorio git en este directorio" -ForegroundColor Red
    exit 1
}

# Verificar el estado actual
Write-Host "📋 Estado actual del repositorio:" -ForegroundColor Yellow
git status --short

# Agregar todos los cambios
Write-Host "`n📦 Agregando archivos..." -ForegroundColor Yellow
git add .

# Hacer commit
Write-Host "💾 Haciendo commit con mensaje: '$Message'" -ForegroundColor Yellow
git commit -m $Message

# Verificar si hay cambios para hacer push
$changes = git status --porcelain
if ($LASTEXITCODE -eq 0) {
    # Hacer push
    Write-Host "📤 Subiendo cambios a GitHub..." -ForegroundColor Yellow
    git push origin master
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n✅ ¡Despliegue exitoso!" -ForegroundColor Green
        Write-Host "🌐 Tu sitio estará disponible en: https://luivelmor.github.io/" -ForegroundColor Cyan
        Write-Host "⏱️ Los cambios pueden tardar 1-5 minutos en aparecer" -ForegroundColor Yellow
    } else {
        Write-Host "`n❌ Error al hacer push" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "`n📝 No hay cambios para subir" -ForegroundColor Yellow
}

Write-Host "`n🎉 Proceso completado" -ForegroundColor Green