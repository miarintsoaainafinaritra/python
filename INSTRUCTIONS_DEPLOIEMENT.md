# Instructions de Déploiement - E-commerce Django

## Étape 1: Installation de Heroku CLI

1. **Téléchargez Heroku CLI**: https://devcenter.heroku.com/articles/heroku-cli
2. **Installez-le** sur Windows
3. **Redémarrez votre terminal** (PowerShell)

## Étape 2: Vérification de l'installation

Ouvrez PowerShell et exécutez:
```bash
heroku --version
```

## Étape 3: Déploiement Automatique

### Option A: Script Windows (recommandé)
```bash
# Double-cliquez sur deploy.bat ou exécutez dans PowerShell:
.\deploy.bat
```

### Option B: Commandes manuelles
```bash
heroku login
heroku create comercio-app
heroku config:set SECRET_KEY=votre-cle-secrete-ici
heroku config:set DEBUG=False
heroku config:set ALLOWED_HOSTS=comercio-app.herokuapp.com,www.comerce.com
heroku config:set STRIPE_PUBLIC_KEY=pk_test_votre-cle-stripe
heroku config:set STRIPE_SECRET_KEY=sk_test_votre-cle-stripe
heroku addons:create heroku-postgresql:hobby-dev
git push heroku main
heroku run python manage.py migrate
heroku run python manage.py createsuperuser
heroku domains:add www.comerce.com
```

## Étape 4: Configuration du Domaine Personnalisé

1. **Achetez le domaine** `comerce.com` chez un registrar
2. **Configurez le DNS**:
   - **CNAME**: `www.comerce.com` → `comercio-app.herokuapp.com`
   - **A Record**: `comerce.com` → `75.2.60.5` (IP Heroku)
3. **Activez SSL** (automatique avec Heroku):
   ```bash
   heroku certs:auto
   ```

## Étape 5: Configuration de Stripe

1. **Créez un compte Stripe**: https://stripe.com
2. **Obtenez vos clés** API (test et production)
3. **Ajoutez-les** aux variables Heroku:
   ```bash
   heroku config:set STRIPE_PUBLIC_KEY=pk_live_votre-cle-publique
   heroku config:set STRIPE_SECRET_KEY=sk_live_votre-cle-secrete
   ```

## Étape 6: Accès au Site

- **URL temporaire**: https://comercio-app.herokuapp.com
- **URL finale**: https://www.comerce.com
- **Admin**: https://www.comerce.com/admin

## Dépannage

### Si le déploiement échoue:
```bash
# Vérifier les logs
heroku logs --tail

# Redéployer après correction
git add .
git commit -m "Fix deployment issue"
git push heroku main
```

### Si les migrations échouent:
```bash
# Réinitialiser la base de données
heroku pg:reset DATABASE
heroku run python manage.py migrate
heroku run python manage.py createsuperuser
```

## Coûts Estimés

- **Heroku**: Gratuit (dyno hobby) → ~7$/mois (production)
- **Domaine**: ~10-15$/an
- **Stripe**: 2.9% + 0.30$ par transaction
- **Total**: ~20-30$/mois pour un petit e-commerce
