## Fonctionnement

1. L'utilisateur saisit son email et son mot de passe.
2. Le mot de passe est haché en SHA-256, puis envoyé en POST à l'API.
3. Si les identifiants sont corrects, l'écran du profil affiche le nom, l'email et le rôle de l'utilisateur.
4. Sinon, un message d'erreur s'affiche.

## Identifiants de test

| Email             | Mot de passe | Rôle                              |
|-------------------|--------------|-----------------------------------|
| jean@example.com  | 1234         | 2 - Utilisateur                   |
| julie@example.com | 4321         | 1 - Administrateur                |
| paul@example.com  | 0000         | 0 - Désactivé (connexion refusée) |

## Lancer l'API (WAMP)

1. Copier le dossier `login_api` dans `C:\wamp64\www\`.
2. Démarrer WAMP.
3. Dans phpMyAdmin, importer `login_api/db/db.sql` (crée la base `login_app_plus`).
4. Vérifier les accès MySQL dans `login_api/db/connect.php` (par défaut `root` sans mot de passe).

L'API est alors disponible sur `http://localhost/login_api/login.php`.

## Lancer l'application

```bash
flutter pub get
flutter run
`
Depuis l'émulateur Android, l'app appelle `http://10.0.2.2/login_api/login.php` (`10.0.2.2` = le `localhost` du PC).
L'URL se change dans `lib/services/auth_service.dart`.
