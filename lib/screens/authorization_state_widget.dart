import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthorizationStateWidget extends StatelessWidget {
  final Widget authWidget;
  final Widget homeWidget;
  const AuthorizationStateWidget({
    super.key,
    required this.homeWidget,
    required this.authWidget,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return homeWidget;
        }
        return authWidget;
      },
    );
  }
}
