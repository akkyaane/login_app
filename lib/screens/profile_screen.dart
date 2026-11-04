import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String email;
  final String firstName;
  final String lastName;
  final int role;

  const ProfileScreen({
    super.key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
  });

  String get roleLabel => switch (role) {
        1 => 'Administrateur',
        2 => 'Utilisateur',
        3 => 'Responsable',
        _ => 'Rôle $role',
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil de l\'Utilisateur'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Nom'),
              subtitle: Text('$firstName $lastName'),
            ),
            ListTile(
              leading: const Icon(Icons.mail_outline),
              title: const Text('Email'),
              subtitle: Text(email),
            ),
            ListTile(
              leading: const Icon(Icons.shield_outlined),
              title: const Text('Rôle'),
              subtitle: Text(roleLabel),
            ),
            const SizedBox(height: 24.0),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Se déconnecter'),
            ),
          ],
        ),
      ),
    );
  }
}
