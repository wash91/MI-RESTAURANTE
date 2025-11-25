@echo off
echo ========================================
echo  DESPLIEGUE AUTOMATICO - FIREBASE
echo ========================================
echo.

echo Verificando Firebase CLI...
call firebase --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Firebase CLI no encontrado. Instalando...
    call npm install -g firebase-tools
)

echo.
echo Iniciando sesion en Firebase...
call firebase login

echo.
echo Desplegando a Firebase Hosting...
call firebase deploy --only hosting

echo.
echo ========================================
echo  DESPLIEGUE COMPLETADO
echo ========================================
echo.
echo Tu sistema esta disponible en:
echo https://mini-restaurante-d0353.web.app
echo.
pause
