@echo off
setlocal

:: =========================================
:: CONFIGURATION - MODIFIEZ ICI SEULEMENT
:: =========================================
set TOMCAT_WEBAPPS=F:\xampp\tomcat\webapps
set NEW_WAR_NAME=Biblio
:: =========================================

echo ----------------------------------
echo [2] Déploiement vers Tomcat...
echo ----------------------------------

REM Vérifier si un fichier WAR existe
for %%f in (target\*.war) do set WARFILE=%%f

if not defined WARFILE (
    echo Aucun fichier WAR trouvé dans target\. Veuillez d'abord compiler le projet.
    pause
    exit /b 1
)

echo Fichier WAR trouvé : %WARFILE%

echo Copie vers %TOMCAT_WEBAPPS%\%NEW_WAR_NAME%.war
copy "%WARFILE%" "%TOMCAT_WEBAPPS%\%NEW_WAR_NAME%.war"

if errorlevel 1 (
    echo Erreur lors de la copie du fichier WAR.
    pause
    exit /b 1
)

echo Déploiement terminé avec succès.
pause