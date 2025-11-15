@echo off
REM Script de déploiement pour Heroku (Windows)

echo 1. Connexion à Heroku...
heroku login

echo 2. Création de l'application Heroku...
heroku create comercio-app

echo 3. Configuration des variables d'environnement...
heroku config:set SECRET_KEY=votre-cle-secrete-ici
heroku config:set DEBUG=False
heroku config:set ALLOWED_HOSTS=comercio-app.herokuapp.com,www.comerce.com
heroku config:set STRIPE_PUBLIC_KEY=pk_test_votre-cle-stripe
heroku config:set STRIPE_SECRET_KEY=sk_test_votre-cle-stripe

echo 4. Ajout de la base de données PostgreSQL...
heroku addons:create heroku-postgresql:hobby-dev

echo 5. Déploiement du code...
git push heroku main

echo 6. Exécution des migrations...
heroku run python manage.py migrate

echo 7. Création du superuser...
heroku run python manage.py createsuperuser

echo 8. Configuration du domaine personnalisé...
heroku domains:add www.comerce.com

echo Déploiement terminé!
echo Votre site sera disponible à: https://comercio-app.herokuapp.com
echo Configurez votre DNS www.comerce.com -> comercio-app.herokuapp.com
pause
