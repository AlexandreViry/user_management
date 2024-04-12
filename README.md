<h1 align="center"> 👥 User Management 📱 </h1> <br>
<p align="center">
    <img alt="login" title="mockup" src="./doc/ReadMe/login_mockup.gif" width="300">
</p>

<p align="center">
  Une application flutter qui gère des permissions d'utilisateurs
</p>

## 👨🏻‍🏫 Le sujet Epitech

#### 📋 Prérequis

- **Version Flutter**: Votre code doit être au minimum sur Flutter 3.19.3 (canal stable).
- **Règles de lint**: Utilisez les règles de lint spécifiées ici: [Blackfoot Flutter Lint](https://pub.dev/packages/blackfoot_flutter_lint) dans votre fichier `analysis_options`.
- **Fonctionnalité**: Votre projet doit être fonctionnel.
- **Téléchargement**: Nous devons pouvoir télécharger au moins la version release pour Android et la version debug pour iOS. Utilisez les moyens que vous souhaitez pour le rendre téléchargeable (Codemagic, Firebase App Distribution, Diawi, TestFlight, les stores directement, etc.).
- **Accessibilité Web**: Nous devons pouvoir accéder à la partie web de votre projet en ligne.
- **Gestion des utilisateurs**: Système de login, d'inscription, avec photo de profil dans les infos utilisateur.
- **Types d'utilisateurs**: Au moins deux types (admin et utilisateur normal) avec des fonctionnalités différentes.
- **Fonctionnalité native du téléphone**: Utilisez au moins une (appel téléphonique, caméra, GPS, gyroscope...).
- **Fonctionnalité native web**.
- **Compatibilité**: Votre app doit fonctionner sur Android, iOS et le Web (responsive).
- **Gestion d'état global**: Utilisez Redux, BloC, Provider, GetX, etc.
- **Animation explicite**.

#### 🎁 Bonus

- **CI/CD** pour automatiquement tester et déployer votre app
- **Tests** pour votre app (unitaire / de widgets et/ou d'intégration)
- **Deploy** votre app sur les stores
- **Monitoring** en place pour votre app (pour les KPIs et/ou informations de crash)

## 👨🏽‍💻 Notre projet

Nous avons élaboré un projet simple mais complet, conçu pour valider tous les critères obligatoires du sujet tout en intégrant quelques fonctionnalités supplémentaires pour obtenir des points bonus. Notre application inclut des tests unitaires, des tests de widgets, et des tests d'intégration.

#### 🚀 Démarrage et Navigation

Le projet démarre sur une page de chargement animée qui introduit l'utilisateur à l'interface principale. Cette animation soignée guide l'utilisateur vers une page de connexion où il peut se connecter avec son email et mot de passe, ou s'inscrire s'il s'agit de sa première visite. Une authentification via Google est également mise en place pour simplifier l'accès.

#### 🏠 Page d'Accueil

Une fois authentifié, l'utilisateur est redirigé vers la page d'accueil. Cette page comporte deux boutons principaux :
Un bouton accessible à tous les utilisateurs qui active une fonctionnalité native du téléphone : la vibration.
Et un bouton exclusif aux administrateurs qui permet de déclencher une notification.

#### 👤 Page de Profil et Personnalisation

La page de profil offre aux utilisateurs la possibilité de gérer leurs préférences personnelles, telles que l'activation du mode sombre. Cette fonctionnalité est gérée via un système global de gestion d'état Getx, assurant une expérience utilisateur fluide et réactive.

#### 🛠 Fonctionnalités Techniques

Les Tests Unitaires et d'Intégration Patrol assurent que les composants fonctionnent correctement isolément et ensemble.
L'authentification Google permet une connexion rapide et sécurisée.
L'utilisation de capacités natives du téléphone et du navigateur web telles que la vibration (seulement pour le téléphone) et les notifications pour enrichir l'expérience utilisateur.
Cette application vise non seulement à satisfaire les exigences techniques du projet mais aussi à offrir une expérience utilisateur agréable et fonctionnelle.


## 🏗️ Architecture et technos
</br>
<div align="center">
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img alt="Firebase" src="https://img.shields.io/badge/firebase-ffca28?style=for-the-badge&logo=firebase&logoColor=black" />
</div>
</br>


## 🖥️ Notre solution
<p align="center">
    <img alt="login" title="mockup" src="./doc/ReadMe/login_mockup.gif" width="300">
    ---
    <img alt="register" title="mockup" src="./doc/ReadMe/register_mockup.gif" width="300">
    ---
    <img alt="google sign in" title="mockup" src="./doc/ReadMe/google_login_mockup.gif" width="300">
    ---
    <img alt="navbar" title="mockup" src="./doc/ReadMe/navbar_mockup.gif" width="300">
</p>

## 📉📈 Déployer localement

