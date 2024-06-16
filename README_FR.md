# flutter-supabase-auth

- [Click here to see the English version of the README](README_EN.md)

## Description du Projet

`flutter-supabase-auth` est un projet démontrant la mise en œuvre d'un système d'authentification pour une application `Flutter` en utilisant `Supabase`. Ce projet suit les principes de l'architecture (`clean architecture`) et de la `modularité` pour assurer une séparation claire des responsabilités et une meilleure maintenabilité du code.

## Fonctionnalités Clés
  - Modules (Fonctionnalités indépendantes)
  - Architecture (`Clean Architecture`)
  - Gestion des États avec `GetX`
  - Authentification avec `Supabase`
  - Initialisation de `OneSignal` pour les `notifications push` avec Supabase
  - Autres Fonctionnalités Utiles (configurations, utilitaires, services, etc.)


## Architecture du Projet

L'architecture de ce projet est organisée en plusieurs dossiers et fichiers, chacun ayant un rôle spécifique. Voici une description détaillée de l'architecture :

### Structure du Répertoire

```
/app_folder
├── /assets
│   ├── /fonts
│   ├── /images
│   └── /etc...
├── /lib
│   ├── /src
│   │   ├── /commons
│   │   ├── /core
│   │   ├── /features
│   │   │   ├── /authentication
│   │   │   │   ├── /controllers
│   │   │   │   │   └── authentication_controller.dart
│   │   │   │   ├── /ui
│   │   │   │   │   ├── /widgets
│   │   │   │   │   │   └── social_auth_widget.dart
│   │   │   │   │   ├── signin_ui.dart
│   │   │   │   │   └── signup_ui.dart
│   │   │   ├── /users
│   │   │   └── /etc...
│   │   └── app.dart
│   ├── init_dependencies.dart
│   ├── init_dependencies.main.dart
│   └── main.dart
├── /libs
│   ├── /core
│   └── /modules
│       ├── /authentication
│       ├── /user_management
│       └── /etc...
├── pubspec.yaml
└── pubspec.lock
```

### Description des Dossiers et Fichiers

- **/app_folder** : Dossier racine du projet contenant tous les fichiers et sous-dossiers nécessaires.
  
- **/assets** : Contient les ressources statiques telles que les polices, les images, et autres éléments statiques utilisés dans l'application.
  
- **/lib** : Principal répertoire de code source de l'application Flutter.
  - **/src** : Contient les sources principales de l'application.
    - **/commons** : Regroupe les éléments communs et réutilisables à travers l'application.
    - **/core** : Contient les éléments centraux de l'application, comme les configurations globales et les utilitaires.
    - **/features** : Dossier dédié aux fonctionnalités de l'application.
      - **/authentication** : Module spécifique à l'authentification.
        - **/controllers** : Contient les contrôleurs responsables de la logique métier liée à l'authentification, gérés par GetX.
          - `authentication_controller.dart` : Contrôleur principal pour gérer les processus d'authentification avec GetX.
        - **/ui** : Regroupe les éléments de l'interface utilisateur liés à l'authentification.
          - **/widgets** : Contient les widgets personnalisés utilisés dans les interfaces d'authentification.
            - `social_auth_widget.dart` : Widget pour l'authentification via les réseaux sociaux.
          - `signin_ui.dart` : Interface de connexion.
          - `signup_ui.dart` : Interface d'inscription.
      - **/users** : Module pour la gestion des utilisateurs.
      - **/etc...** : Autres modules de fonctionnalités spécifiques.
    - `app.dart` : Point d'entrée de l'application, configuration générale.
  - `init_dependencies.dart` : Fichier de configuration pour initialiser les dépendances, incluant GetX et OneSignal.
  - `init_dependencies.main.dart` : Fichier principal pour initialiser les dépendances spécifiques à l'exécution.
  - `main.dart` : Point d'entrée principal de l'application Flutter.
  
- **/libs** : Contient les bibliothèques et modules externes.
  - **/core** : Bibliothèques et utilitaires centraux.
  - **/modules** : Modules spécifiques utilisés par l'application.
    - **/authentication** : Module d'authentification externe.
    - **/user_management** : Module de gestion des utilisateurs.
    - **/etc...** : Autres modules spécifiques.
  
- `pubspec.yaml` : Fichier de configuration des dépendances du projet.
- `pubspec.lock` : Fichier de verrouillage des dépendances pour assurer la cohérence des versions.

### Avantages de cette Architecture

1. **Modularité** : Chaque fonctionnalité de l'application est isolée dans un module spécifique, ce qui facilite la maintenance et l'évolution du code.
2. **Séparation des responsabilités** : L'architecture suit le principe de séparation des préoccupations, en séparant clairement la logique métier (controllers) de l'interface utilisateur (ui).
3. **Réutilisabilité** : Les composants communs et les utilitaires sont regroupés dans des dossiers spécifiques, permettant leur réutilisation à travers l'application.
4. **Scalabilité** : L'organisation modulaire permet d'ajouter facilement de nouvelles fonctionnalités sans perturber les modules existants.
5. **Clarté** : La structure du projet est claire et bien définie, facilitant la compréhension pour les nouveaux développeurs et les contributeurs.
6. **Initialisation de OneSignal** : Configuration intégrée de OneSignal pour les notifications push.
7. **Autres Fonctionnalités Utiles** : Les configurations, utilitaires et services supplémentaires sont organisés pour améliorer l'efficacité et la fonctionnalité globale de l'application.

---

## Architecture du Module d'Authentification

Le module d'authentification est organisé de manière propre et modulaire, assurant une séparation claire des responsabilités et une meilleure maintenabilité. Voici une description détaillée de l'architecture du module d'authentification :

### Structure du Répertoire

```
/modules
├── /authentication
│   ├── /lib
│   │   ├── /data
│   │   │   ├── /data_sources
│   │   │   │   ├── auth_remote_data_source_impl.dart
│   │   │   │   ├── auth_remote_data_source.dart
│   │   │   ├── /models
│   │   │   │   ├── model_user.dart
│   │   │   ├── /repositories
│   │   │   │   ├── auth_repository_impl.dart
│   │   ├── /domain 
│   │   │   ├── /entities
│   │   │   │   ├── entity_user.dart
│   │   │   ├── /repositories
│   │   │   │   ├── auth_repository.dart
│   │   │   ├── /usecases
│   │   │   │   ├── login_by_email_and_password_usecase.dart
│   │   │   │   ├── logout_usecase.dart
│   │   │   │   ├── register_by_email_and_password_usecase.dart
│   │   │   │   ├── etc...
│   ├── /test
├── /user_management
└── /etc
```

### Description des Dossiers et Fichiers

- **/modules** : Dossier racine contenant tous les modules de l'application.
  - **/authentication** : Dossier du module d'authentification.
    - **/lib** : Contient la logique de base et la structure du module d'authentification.
      - **/data** : Gère les opérations liées aux données.
        - **/data_sources** : Contient les sources de données, y compris la récupération de données à distance ou locale.
          - `auth_remote_data_source_impl.dart` : Implémentation de la source de données à distance pour l'authentification.
          - `auth_remote_data_source.dart` : Interface définissant la source de données à distance pour l'authentification.
        - **/models** : Contient les modèles de données utilisés dans le processus d'authentification.
          - `model_user.dart` : Modèle représentant la structure des données utilisateur.
        - **/repositories** : Gère les dépôts de données, l'interface entre les sources de données et la couche de domaine.
          - `auth_repository_impl.dart` : Implémentation du dépôt d'authentification, gérant les opérations de données.
      - **/domain** : Contient la logique métier du module d'authentification.
        - **/entities** : Définit les entités principales utilisées dans la logique métier.
          - `entity_user.dart` : Entité représentant un utilisateur dans la couche de domaine.
        - **/repositories** : Contient les interfaces de dépôt, abstraites des opérations de données.
          - `auth_repository.dart` : Interface pour le dépôt d'authentification.
        - **/usecases** : Contient les cas d'utilisation, représentant des actions ou opérations spécifiques de l'application.
          - `login_by_email_and_password_usecase.dart` : Cas d'utilisation pour la connexion avec email et mot de passe.
          - `logout_usecase.dart` : Cas d'utilisation pour la déconnexion.
          - `register_by_email_and_password_usecase.dart` : Cas d'utilisation pour l'inscription avec email et mot de passe.
          - `etc...` : Placeholder pour d'autres cas d'utilisation si nécessaire.

### Avantages de cette Architecture

1. **Modularité** : Chaque aspect du processus d'authentification est séparé en dossiers distincts, rendant le code plus gérable et compréhensible.
2. **Séparation des responsabilités** : L'architecture sépare clairement la gestion des données, la logique métier et les entités, assurant que chaque couche a une responsabilité spécifique.
3. **Maintenabilité** : La structure organisée permet une maintenance et des mises à jour plus faciles, car les changements dans une partie du module n'affectent pas les autres.
4. **Scalabilité** : De nouvelles fonctionnalités et capacités peuvent être ajoutées avec un minimum de perturbation du code existant, améliorant ainsi la scalabilité de l'application.
5. **Réutilisabilité** : Les composants et logiques communs sont encapsulés dans des fichiers spécifiques, favorisant leur réutilisation à travers l'application.

---

En utilisant cette architecture, le projet `flutter-supabase-auth` assure une base solide et extensible pour le développement d'applications Flutter intégrant l'authentification avec Supabase.