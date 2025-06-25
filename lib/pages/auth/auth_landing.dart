import 'package:flutter/material.dart';
import 'package:stockallref/pages/auth/auth_base.dart';
import 'package:stockallref/pages/home/home_page.dart';
import 'package:stockallref/supabase/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLanding extends StatefulWidget {
  const AuthLanding({super.key});

  @override
  State<AuthLanding> createState() => _AuthLandingState();
}

class _AuthLandingState extends State<AuthLanding> {
  final supabase = AuthService();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: supabase.authState(),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('An Error Occured')),
          );
        } else {
          Session? session =
              snapshot.hasData
                  ? snapshot.data!.session
                  : null;

          if (session != null) {
            return HomePage();
          } else {
            return AuthBase();
          }
        }
      },
    );
  }
}
