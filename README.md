# E-commerce Django Project

## Déploiement sur Heroku

### Prérequis
- Compte Heroku
- CLI Heroku installé
- Git configuré

### Étapes de déploiement

1. **Créer une application Heroku**
   ```bash
   heroku create votre-nom-app
   ```

2. **Configurer les variables d'environnement**
   ```bash
   heroku config:set SECRET_KEY=votre-cle-secrete
   heroku config:set DEBUG=False
   heroku config:set ALLOWED_HOSTS=votre-domaine.herokuapp.com,www.votre-domaine.com
   heroku config:set DATABASE_URL=postgres://user:password@host:port/dbname
   heroku config:set STRIPE_PUBLIC_KEY=votre-cle-stripe-publique
   heroku config:set STRIPE_SECRET_KEY=votre-cle-stripe-secrete
   ```

3. **Ajouter la base de données PostgreSQL**
   ```bash
   heroku addons:create heroku-postgresql:hobby-dev
   ```

4. **Déployer**
   ```bash
   git add .
   git commit -m "Ready for deployment"
   git push heroku main
   ```

5. **Migrations et superuser**
   ```bash
   heroku run python manage.py migrate
   heroku run python manage.py createsuperuser
   ```

### Configuration du domaine personnalisé

1. **Ajouter le domaine sur Heroku**
   ```bash
   heroku domains:add www.comerce.com
   ```

2. **Configurer DNS**
   - CNAME: www.comerce.com -> votre-app.herokuapp.com
   - A Record: commerce.com -> 75.2.60.5 (Heroku)

3. **Configurer SSL**
   ```bash
   heroku certs:auto
   ```

## Configuration locale

1. **Cloner le projet**
   ```bash
   git clone <repository-url>
   cd ecommerce
   ```

2. **Créer l'environnement virtuel**
   ```bash
   python -m venv venv
   source venv/bin/activate  # Windows: venv\Scripts\activate
   ```

3. **Installer les dépendances**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configurer .env**
   ```bash
   cp .env.example .env
   # Éditer .env avec vos configurations
   ```

5. **Migrations**
   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

6. **Créer un superuser**
   ```bash
   python manage.py createsuperuser
   ```

7. **Lancer le serveur**
   ```bash
   python manage.py runserver
   ```

## Structure du projet

- `users/` - Gestion des utilisateurs et authentification
- `products/` - Gestion des produits et catégories
- `orders/` - Gestion des commandes et paiements
- `cart/` - Panier d'achat
- `static/` - Fichiers statiques
- `media/` - Fichiers médias (images produits)
